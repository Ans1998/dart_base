class TestFunction {
  FunctionLearn functionLearn = FunctionLearn();
  void start() {
    print('-----------start---------------');
    int sum = functionLearn.sum(1, 2);
    print(sum); // 3
    functionLearn.anonymousFunction();
  }

  void json() {
    List json = functionLearn.res();
    print(json);
  }
}



class FunctionLearn {
  // 方法构成
  // 返回值类型 + 方法名  + 参数
  // 其中返回值类型可缺省，也可以为void 或 具体的类型
  // 方法名：匿名方法不需要方法名
  // 参数：参数类型和参数名，参数类型可缺省

  int sum (int val1, int val2) {
    return val1+val2;
  }

  List res() {
     List<Map> data = [ {'name': 'An', 'age': '12'}, {} ];
     return data;
  }
  // 私有方法(通常_开头)
  _learn() {
    print('私有方法');
  }
  // 匿名方法
  anonymousFunction() {
    var list = ['私有方法', '匿名方法'];
    list.forEach((i) {
      print(list.indexOf(i).toString() + ':' + i);
    });
  }
}