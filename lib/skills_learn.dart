// 面向对象
// 1.封装、继承、多态
// 善于封装、大到功能模块的封装、类的封装与抽象、小到方法的封装，封装的目的在于复用和易于扩展和维护
// 不要在一个方法体里面堆砌太多的代码<建议小于100行>
// 2.点点点的技巧
// 一个类的世界里：万物皆对象；1点查看对象有些方法和属性；2点看源码；3点探究竟;
void manin() {
  // dart编程小技巧：安全调用
  // 对于不确定的是否为空的对象可以通过?.的方式来方位它的属性以防止空异常如：obj?.foo()
  List list;
  print(list?.length); // null

  // 设置默认值
  print(list?.length ?? 0); // 0
  // print(list?.length ?? -1); // -1

  // 简化判断
  list = [];
  list.add(0);
  list.add('');
  list.add(null);

  if (list[0] == null || list[0] || list[0] == 0) {
    print("list[0] 为 空");
  }

  if ([null, '', 0].contains(list[0])) {
    print("list[0] 为 空");
  }
}