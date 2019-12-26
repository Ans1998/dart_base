import 'package:flutter/material.dart';

import './data_type.dart';

import './oop_learn.dart';

import './function_learn.dart';

import './generic_learn.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 必备基础',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter必备Dart基础'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {

    _oopLearn(); // 调用_oopLearn方法

    _functionLearn(); // 调用_functionLearn方法
    
    _testGeneric(); // 调用_testGeneric方法

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[ DataType() ],
        )
      ),
    );
  }
  // 调用工厂构造方法
  void _oopLearn() {
    print('------oop-----');
    Logger log1 = Logger();
    Logger log2 = Logger();
    print(log1 == log2);

    // 访问静态方法
    Student.doPrint('_oopLearn');


    // 创建Student的对象
    Student stu1 = Student('清华', 'An', 18);
    stu1.school = '985';
    print(stu1.toString()); // Student --- name: China.null, _school:985, city: null, country: China Person --- name: China.null, age: 18

    Student stu2 = Student('北大', 'An', 18, city: 'shanghai', country: '中国');
    // stu2.school = '211';
    print(stu2.toString()); // Student --- name: 中国.shanghai, _school:北大, city: shanghai, country: 中国 Person --- name: 中国.shanghai, age: 18
   


   Student.doPrint('---StudyFlutter----');
    // 抽象类
    StudyFlutter studyFlutter = StudyFlutter();
    studyFlutter.study();
  }
  // 方法调用
  void _functionLearn() {
    TestFunction testFunction = TestFunction();
    testFunction.start();
    testFunction.json();
  }
  // 泛型调用
  void _testGeneric() {
    print('---------testGeneric------------');
    TestGeneric testGeneric = TestGeneric();
    testGeneric.start();
  }
}
