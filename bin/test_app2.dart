import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:async';

void main() async {
  print('start');

  showFile();

  print('end');
}

showFile() {
  Stream stream;
  StreamSubscription subscribe;

  stream = Stream.periodic(Duration(seconds: 1), (el) => el);

  subscribe = stream.listen((event) {
    var myFile = File('C:/Dart/test/test_app/bin/test.txt').readAsStringSync();
    var myFile2 = myFile.split(',');
    var isElement = false;
    for (var el in myFile2) {
      if (el == '1') {
        isElement = true;
      }
    }
    print(isElement);
  });
  Future.delayed(Duration(seconds: 2), () => subscribe.cancel());
}
