import 'package:flutter/material.dart';

// 常用数据类型
class DataType extends StatefulWidget {
  DataType({Key key}) : super(key: key);

  @override
  _DataTypeState createState() => _DataTypeState();
}

class _DataTypeState extends State<DataType> {
  @override
  Widget build(BuildContext context) {

    _numType(); // 调用_numType方法

    _stringType(); // 调用_stringType方法

    _boolType(); // 调用_boolType方法

    _listType(); // 调用_listType方法

    __mapType(); //调用__mapType方法

    _tips(); // 调用_tips方法

    return Container(child: Text('常用数据类型，请查看控制台输出'),);
  }
  // 数字类型
  void _numType() {
    num num1 = -1.0; // 它是数字类型的父类
    num num2 = 2; // 它是数字类型的父类
    int int1 = 3; // 只能接收整数
    double d1 = 1.68; // 只能接收双精度
    print("num1: $num1，num2: $num2, int1: $int1, d1: $d1");

    print(num1.abs()); // 求绝对值

    print(num1.toInt()); // 转换Int类型
    print(num1.toDouble()); // 转换Double类型
  }
  // 字符串类型
  void _stringType() {
    String str1 = '字符串', str2 = '字符串2';
    String str3 = 'str1: $str1 str2: $str2';
    String str4 = str1+str2;
    print(str1);
    print(str3);
    print(str4);

    print(str3.substring(1, 4)); // 字符串截取
    print(str2.indexOf('1212')); // 获取索引位置
  }
  // 布尔值类型，Dart 是 强bool类型检查，只有bool类型的值是true才被认为是true
  void _boolType() {
    bool success = true, fail = false;
    print(success);
    print(fail);

    print(success || fail); // true
    print(success && fail); // false
  }
  // list集合
  void _listType() {
    print('----list-----');
    // 集合初始化
    List arr = [1, '1', 2, '3', '集合'];
    print(arr);

    // 集合(int)泛型
    List<int> arrInt = [1, 2, 3, 4];
    print(arrInt);

    // arrInt = arr; // 语法错误（动态类型集合不是int集合）
    // print(arrInt);

    List arr3 = [];
    arr3.add('arr3'); // 通过add添加元素
    arr3.addAll(arr);
    print(arr3);


    List arr4 = List.generate(3, (index) => index * 2); // 集合生成
    print(arr4);// [0, 2, 4]

    // 集合遍历
    for(int i=0; i<arr.length; i++) {
      print(arr[i]);
    }
    for (var o in arr) {
      print(o);
    }
    arr.forEach((val){
      print(val);
    });
  }
  // map数据类型 map是将key和value相关联的对象，key和value都可以是任何类型的对象，并且key是唯一的如果key重负后面添加的key会替换前面的
  __mapType() {
    print('-----map------');
    // map初始化
    Map objName = { 'name': '小明', 'age': 14 };
    print(objName);

    Map objAge = {};
    objAge['name'] = 'An';
    objAge['age'] = '13';
    print(objAge);

    // map遍历
    objAge.forEach((key, val) {
      print("key: $key, val: $val");
    });

    Map objAge2 = objAge.map((key, val) {
      // 迭代生成一个新的Map
      return MapEntry(val, key);
    });
    print(objAge2);

    for(var key in objAge.keys) {
      print('$key ${objAge[key]}');
    }
  }
  // 科普：dynamic、var、object 三者区别
  
  // dynamic：是所有Dart对象的基础类型， 在大多数情况下，通常不直接使用它，
  // 通过它定义的变量会关闭类型检查，这意味着 dynamic x = 'hal';x.foo();
  // 这段代码静态类型检查不会报错，但是运行时会crash，因为x并没有foo()方法，所以建议大家在编程时不要直接使用dynamic；

  // var：是一个关键字，意思是“我不关心这里的类型是什么。”，系统会自动推断类型runtimeType；

  // Object：是Dart对象的基类，当你定义：Object o=xxx；时这时候系统会认为o是个对象，你可以调用o的toString()和hashCode()方法
  // 因为Object提供了这些方法，但是如果你尝试调用o.foo()时，静态类型检查会进行报错；
  // 综上不难看出dynamic与Object的最大的区别是在静态类型检查上；

  _tips() {
    print('------tips-------');

    // dynamic动态类型 只有运行的时候才知道你是什么类型（可以让语法检查失效）
    dynamic x = 'hal';
    print(x.runtimeType); // 字符串
    print(x); // hal
    // x.foo(); // 运行才会报错
    x = 123;
    print(x.runtimeType); // int
    print(x); // 123

    // var 关键字  我不关心你数据类型是什么系统会自行判断
    var a = 'var';
     print(a.runtimeType); // 字符串
    print(a); // var
    // a = 123; // 前面的var已经定义好数据类型了是不可在改变数据类型的（相同数据类型可以）

    //object 基类
    Object o1 = '1111';
    print(o1.runtimeType); // 字符串
    print(o1); // 1111
  }

}