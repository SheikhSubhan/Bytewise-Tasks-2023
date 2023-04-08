 

// Everything is object in dart programming language

// automatically imported in every dart file
// void main() {
//   var fname = "Subhan";
//   String lname = "talal";
//   print(fname + " " + lname);
//   stdout.writeln("Your Name?");
//   String? name = stdin.readLineSync();
//   print("My name is $name");
// }

// void main() {
//   // These Variable data type assigned at compile time
//   int a = 10;
//   int b = 20;
//   print("$a |  $b");

//   double c = 10.2;
//   var d = 20.2;
//   print("$c |  $d ");

//   bool e = true;
//   var f = false;
//   print("$e |  $f ");

//   // This variable data type can be change at runtime
//   dynamic val = "Bytewise";
//   print(val);
//   val = 2;
//   print(val);
//   val = null;
//   print(val);
// }

// void main() {
//   String s1 = "Subhan \n talal";
//   String rawstring = r"Subhan \n talal";
//   // rawstring treated as a whole string no characters are entertained
//   print(s1);
//   print(rawstring);
// }

// void main() {
//   // type conversion
//   // String to integer

//   String abc = "123";
//   var one = int.parse(abc);
//   assert(one == 1);
//   print("$abc | $one");

// // String to double
//   String def = "1.234";
//   var two = double.parse(def);
//   assert(two == 1.234);
//   print("$def | $two");

//   // int to String

//   int inp = 2;
//   String changetostring = inp.toString();
//   assert(changetostring == "2");

//   // double to String
// // limit to two digits
//   double inp1 = 2.222;
//   String changetofixed = inp1.toStringAsFixed(2);
//   assert(changetofixed == "2.22");

//   // contant value
//   const a = 0;
//   const b = 2.2;
//   const c = "abc";
//   print("$a $b $c");
//   print(a.runtimeType);
//   print(b.runtimeType);
//   print(c.runtimeType);
// }

// void main() {
//   // operators
//   int a = 2;
//   int b = 4;
//   int c = a + b;
//   int d = a - b;
//   int e = a * b;
//   int f = a % b;

//   // conditionals
//   bool g = a == b;
//   bool h = a <= b;
//   bool i = a >= b;
//   bool j = a != b;

// // unary operator
// // num++
// // ++num
// // --num
// // num--
// // +=num
// // --num
// // *=num

//   // Logicals
//   // && and
//   // || or

// }

// create a class for practice
// null aware operators
// class ClassName {
//   int num = 10;
// }

// void main() {
//   // creating obj of class
//   var n = ClassName();
//   // ?. means check if null then dont work.
//   // ?? means if null then set default value
//   int num = n?.num ?? 0;
//   // int? num = n?.num;
//   print(num);

//   // for assigning defult value  if null
//   int? int1 = null;
//   print(int1);
//   int num1 = int1 ??= 20;
//   print(num1);

//   // turnary operator
//   int x = 101;
//   var result = x % 2 == 0 ? "even" : "odd";
//   print(result);

// //  type test

//   var type = 1;
//   if (type is int) {
//     print("integer");
//   }
// }

// void main() {
//   // conditional statement

//   // if else
//   var a = 2;
//   if (a == 2) {
//     print("a is 2");
//   } else if (a == 3) {
//     print("a is 3");
//   } else {
//     print("a not found");
//   }
//   // switch case
//   var num = 29;
//   switch (num) {
//     case 1:
//       print("num is 1");
//       break;
//     case 5:
//       print("num is 5");
//       break;
//     case 10:
//       print("num is 10");
//       break;
//     default:
//       print("num is default 0 or else");
//   }
// }

// void main() {
//   // loops
// // Standard for  loop
//   for (var i = 0; i <= 10; i++) {
//     print(i);
//   }

//   // for-in loop
//   var collection = [1, 3, 4];
//   for (var element in collection) {
//     print(element);
//   }
//   // For Each Loop
//   // you can pass function in for each loop
//   var number = [1, 2, 3];
//   number.forEach((element) => print(element));
//   // OR you can define a function to pass in it
//   void printnum(n) {
//     print(n);
//   }

//   number.forEach(printnum);

//   // while loop
//   var a = 10;
//   while (a != 2) {
//     print(a);
//     a--;
//   }
//   var b = 10;
//   do {
//     print(b);
//     b--;
//   } while (b != 2);

// // Break and continue
//   for (var i = 0; i < 20; i++) {
//     if (i == 10) {
//       break;
//     }
//     print(i);
//   }

//   for (var i = 0; i < 20; i++) {
//     if (i == 10) {
//       continue;
//     }
//     print(i);
//   }
// }

// void main() {
//   // Collections [list,set,map]

//   // list mutable data
//   List name = [1, "jill"];
//   print(name[0]);
//   print(name.length); // it returns from 1 to lenght

// //  String list
//   List<String> stringname = ["name", "jill"];
//   stringname[1] = "subhan"; //replace item

//   // const list immputable
//   List<String> stringname1 = const ["name", "jill"];
//   // stringname1[1] = "subhan"; //cant replace item
//   // print(stringname1);
//   // iteration through for in

//   for (var element in name) {
//     print(element);
//   }

//   // copying a list
//   List name2 = [...stringname];
//   print(name2);
//   name2[1] = "suv";
//   print(name2);
// }

// void main() {
//   // sets of dart
//   // unique Collectios are accepted a1 and a1 are duplicates
//   var name1 = {"a1", "a2", "a1"};
//   for (var element in name1) {
//     print(element);
//   }

//   // empty set
//   var set1 = <String>{};
//   print(set1.runtimeType);

// // only string;

//   Set<String> name2 = {};
// }

// void main() {
//   // Map --> Same as python dictionary Key value pair
//   var map1 = {"name": "subhan", "age": 3, 3: "map"};
//   print(map1["age"]);
//   print(map1[3]);

//   // defining empty map
//   var diction = Map();
//   diction["name"] = 'subhan';
//   diction["age"] = 2;
//   print(diction["name"]);
// }

// void main1() {
//   // Function of dart
//   showout((square(2)));
//   showout((square(2.5)));
// }

// dynamic square(var num) {
//   return num * num;
// }

// void showout(var msg) {
//   print(msg);
// }

// // arrow functions =>
// dynamic squrae1(var n) => n + n; //works same

// // anonmyous function
// void main() {
//   var list1 = [1, 2, 3];
//   list1.forEach((element) {
//     print(element);
//   });
// }

// void main() {
// // postional arguments in dart function
//   print(sum(1, 2));
//   print(sum1(a1: 2, a2: 3));
//   print(sum3(2, a2: 3));
//   print(sum4(2));
//   print(sum6(2));
// }

// dynamic sum(var a1, var a2) => a1 + a2;

// // named paramerter in dart function
// dynamic sum1({var a1, var a2}) => a1 + a2;

// // mix of position and named
// dynamic sum3(var a1, {var a2}) => a1 + a2;

// // providing no parametre
// dynamic sum4(var a1, {var a2}) => a1 + (a2 ?? 0); //if nulll pass zero

// //default value
// dynamic sum5({var a1 = 0, var a2 = 0}) => a1 + (a2 ?? 0); //if nulll pass zero

// // making a paramerter optional
// dynamic sum6(var a1, [var a2]) => a1 + (a2 ?? 0); //if nulll pass zero

//OBJECT ORIENTED TOPICS:

// Class creation
// ? in datatype is for nullable

// class person {
//   String? name;
//   int? age;
// // constructor to get parameter for class
//   // person(name, [age = 19]) {
//   //   this.name = name;
//   //   this.age = age;
//   // }

//   // OR
//   // Second way of contructor
//   //default constructor
//   person(this.name, [this.age = 19]);

// // named constructor
//   person.guest() {
//     name = "guest";
//     age = 18;
//   }

//   void printdata() {
//     print(name);
//     print(age);
//   }
// }

// void main() {
//   person p1 = person("Ahmed", 20);
//   p1.printdata();
//   var p2 = person("Subhan");
//   p2.printdata();
//   var p3 = person.guest();
//   p3.printdata();
// }

// Unchanged in Class values
// class x {
//   final name; //cant be change
//   static const int age = 10; //can only be access by class only and cant change
//   x(this.name);
// }

// void main() {
//   var y = x('jack');
//   print(y.name);
//   // y.name = "subhan"; //cant change beacause its final
//   // print(y.age); //error
//   print(x.age); //right one
// }

// Adding extra features in the class INHERITENCE
// class vehicle {
//   String? model;
//   int? year;
//   // constructor
//   vehicle(this.model, this.year) {
//     print(this.model);
//     print(this.year);
//   }
//   void printval() {
//     print(model);
//     print(year);
//   }
// }

// class Car extends vehicle {
//   double? price;
//   Car(String model, int year, this.price) : super(model, year);
//   void printval() {
//     super.printval();
//     print(this.price);
//   }
// }

// void main() {
//   var c1 = Car("corolla", 2000, 123142525);
//   c1.printval();
// }

// METHOD OVERRIDING

// class x {
//   String? name;
//   x(this.name);

//   void printout() {
//     print(this.name);
//   }

//   dynamic square(dynamic val) {
//     return val * val;
//   }
// }

// class y extends x {
//   y(String name) : super(name);
//   @override //if you dont use this override it will not give any error while overriding method is not avaiable
//   void printout() {
//     print(this.name);
//     print("name");
//   }
// }

//GETTERS AND SETTERS
// num type can have integar and doubles
// class Rectangle {
//   num left, right, width, height;
//   Rectangle(this.left, this.right, this.width, this.height);
//   //adding getter setter to give and set the value on basis of class rules

//   num get top => left + width;
//   set top(num value) => left = value - width;
//   num get bottom => right + height;
//   set bottom(num value) => right = value - height;
// }

// void main() {
//   var r1 = Rectangle(10, 20, 30, 40);

//   print(r1.top); //40
//   print(r1.top = 10); //20
//   print(r1.left); //20
//   print(r1.bottom); //60
//   print(r1.bottom = 20); //20
//   print(r1.right); //20
// }

//EXEPTION HANDLING IN DART

// int? zero(int val) {
//   if (val == 0) {
//     throw Exception("Value is Zero");
//   }
// }

// void verify(var val) {
//   var value1;
//   try {
//     value1 = zero(val);
//   } catch (e) {
//     print(e);
//   } finally {
//     if (value1 == null) {
//       print("not accepted");
//     } else {
//       print("accpeted");
//     }
//   }
// }

// void main() {
//   verify(10);
//   verify(0);
// }
