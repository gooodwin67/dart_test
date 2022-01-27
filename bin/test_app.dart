import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() async {
  print('start');
  //printFile;
  /*  var g580 = Keyboards('g580');
  print(g580); */
  //await printNum;
  //printUsers();

  //showTimer(3);
  //showController(5);
  //print(generator());
  /*generatorAsync().listen((el) {
    print(el);
  });*/
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
      .get(Uri.parse(('https://jsonplaceholder.typicode.com/users/')))
      .then((value) {
    try {
      var users2 = json.decode(value.body);
      var list = [];
      //var usersMap = Map<String, dynamic>.from(users2);
      for (var item in users2) {
        if (item.containsKey('id') && item['id'] <= 3) {
          list.add(item['name']);
        }
      }
      print(list);
    } catch (e) {
      print(e);
    } finally {
      print('endShowUsers');
    }
  });
}

showTimer(sec) async {
  //Stream
  Stream<int> stream;
  StreamSubscription<int> subscription;

  stream = Stream.periodic(Duration(seconds: 1), (el) => el);
  subscription = stream.listen((e) {
    print(e);
  });
  Future.delayed(Duration(seconds: sec), () {
    subscription.cancel();
  });

  /*await for (var el in stream) {
    print(el);
  }*/
}

showController(max) {
  StreamController<int> controller = StreamController();
  StreamSubscription subscriber;

  for (var i = 1; i <= max; i++) {
    controller.add(i);
  }

  subscriber = controller.stream.listen((event) {
    print(event);
  });
}

Iterable generator() sync* {
  yield 1;
  yield 2;
}

Stream generatorAsync() async* {
  yield 1;
  yield 2;
}
