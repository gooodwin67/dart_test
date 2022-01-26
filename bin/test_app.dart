import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

void main() async {
  print('start');
  //printFile;
  /*  var g580 = Keyboards('g580');
  print(g580); */
  //await printNum;
  printUsers();

  print('end');
}

class Keyboards {
  String name;
  Keyboards(this.name);

  @override
  String toString() {
    return name;
  }

  void printing() {
    print('Name: $name');
  }
}

Future printNum = Future(() => 6).then((value) => print(value));

Future printFile = Future(() {
  var myFile =
      new File('C:/Dart/test/test_app/bin/test.txt').readAsStringSync();
  return myFile;
}).then((value) => print(value));

printUsers() {
  http
      .get(Uri.parse(('https://jsonplaceholder.typicode.com/users/1')))
      .then((value) {
    try {
      var users2 = json.decode(value.body);
      print(users2);
    } catch (e) {
      print(e);
    }
  });
}
