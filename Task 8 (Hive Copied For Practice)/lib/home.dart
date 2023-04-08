

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:task8/models/boxes/boxes.dart';
import 'package:task8/models/notes_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, }) : super(key: key);


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
final titlecontroller = TextEditingController();
final descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bytewise Community"),
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: boxes.getData().listenable(),
        builder: (context,box,_) {
          var data = box.values.toList().cast<NotesModel>();
          return ListView.builder(
              itemCount: box.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(data[index].title.toString(),style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                            const Spacer(),
                            InkWell(
                                onTap: (){
                                  delete(data[index]);
                                },
                                child: const Icon(Icons.delete, color: Colors.red,),),

                            const SizedBox(width: 15,),
                            InkWell(
                                onTap : (){
                                  _editdialog(data[index], data[index].title.toString() , data[index].description.toString());
                                }
                                ,child: const Icon(Icons.edit)),

                          ],
                        ),
                        Text(data[index].description.toString(),style:const TextStyle(fontSize: 18, fontWeight: FontWeight.w300) ,)
                      ],
                    ),
                  ),
                );
              }
          );
        },
      ),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
          _showmydialog();
    },
        child: const Icon(Icons.add),),
    );
  }
  void delete(NotesModel NotesModel)async{
  await NotesModel.delete();
  }

Future<void> _editdialog(NotesModel notesModel, String title,String description) async{
    titlecontroller.text = title;
    descriptioncontroller.text = description;
  return showDialog(context: context, builder: (context){
    return AlertDialog(
      title: const Text("Edit Notes"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              controller: titlecontroller,
              decoration: const InputDecoration(
                hintText: "Enter Title",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20,),
            TextFormField(
              controller: descriptioncontroller,
              decoration: const InputDecoration(
                hintText: "Enter Description",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(onPressed: () async
        {
          notesModel.title =  titlecontroller.text.toString();
          notesModel.description =  descriptioncontroller.text.toString();
          await notesModel.save();
          titlecontroller.clear();
          descriptioncontroller.clear();

          Navigator.pop(context);
        }, child: const Text("Edit")),
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: const Text("Cancel")),

      ],
    );

  });
}
Future<void> _showmydialog() async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: const Text("Add Notes"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextFormField(
                controller: titlecontroller,
                decoration: const InputDecoration(
                  hintText: "Enter Title",
                    border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20,),
              TextFormField(
                controller: descriptioncontroller,
                decoration: const InputDecoration(
                  hintText: "Enter Description",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(onPressed: ()
          {
            final data = NotesModel(title: titlecontroller.text,
            description: descriptioncontroller.text);
            final box = boxes.getData();
            box.add(data);
            // data.save();
            titlecontroller.clear();
            descriptioncontroller.clear();

            Navigator.pop(context);
          }, child: const Text("Add")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Cancel")),

        ],
      );

    });
  }

}


