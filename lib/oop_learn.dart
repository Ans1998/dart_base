class Student extends Person {

  // 定义类的变量
  String _school; // (通过下划线标识)私有变量
  String city;
  String country;
  String name;

  // 初始化子类构造方法的时候会先调用父类构造方法


  Student(this._school, String nmae, int age, {this.city, this.country = 'China'}) : 
  // 初始化列表：除了调用父类构造器，在子类构造器方法体之前，你也可以初始化实例变量，
  name='$country.$city', 
  // 如果父类没有默认构造方法(无参的构造方法)，则需要在初始列表汇中调用父类的构造方法进行初始化
  super(nmae, age){
    print('构造方法体不是必须的');
  }

  // 可以为私有字段设置getter来让外界取到私有字段
  String get school => _school;
  // 可以为私有字段设置setter来控制外界对私有字段的修改
  set school(String value) {
    _school = value;
  }

  // 静态方法（不需要实例化类就可以调用）
  static doPrint(String str) {
    print('doPrint: $str');
  }


  // 命名构造方法[类名.方法名]
  Student.cover(Student stu): super(stu.name, stu.age);
  // Student.cover(Student stu): super(stu.name, stu.age){
  //   print('命名构造方法')
  // }

  // 命名工厂构造方法：factory [类名.方法名]
  // 它可以有返回值，而且不需要将类的final变量作为参数，是提供一种灵活获取类对象的方式。
  factory Student.stu(Student stu) {
    return Student(stu._school, stu.name, stu.age);
  }

  @override
  String toString() {
    return 'Student --- name: $name, _school:${this._school}, city: $city, country: $country ${super.toString()}';
  }

}


// 工厂构造方法演示demo
class Logger {
  static Logger _cache;
  // 工厂构造方法：
  // 不仅仅是构造方法，更是一种模式
  // 有时候为了返回一个之前已经创建的缓存对象，原始的构造方法已经不能满足要求
  // 那么可以使用工厂模式来定义构造方法
  factory Logger() {
    if (_cache == null) {
      _cache = Logger._internal();
    }
    return _cache;
  }
  Logger._internal();

  void log(String msg){
    print(msg);
  }
}



// 定义dart类， 所有类都是继承Object
class Person {
  String name;
  int age;

  // 标准的构造方法
  Person(this.name, this.age);

  // 重写父类的方法
  @override
  String toString() {
    return 'Person --- name: $name, age: $age';
  }
}

// 继承抽象类要实现他的抽象方法，否则也需要将自己定义成抽象类
class StudyFlutter extends Study {
  @override
  void study() {
    print('-----learning flutter-----');
  }
}

// 抽象类（使用abstract 装饰符来定义一个抽象类，该类不能被实例化。抽象类在定义接口的时候非常有用，实际上抽象中也包含一些实现）
abstract class Study {
  void study();
}

// 抽象类（使用abstract 装饰符来定义一个抽象类，该类不能被实例化。抽象类在定义接口的时候非常有用，实际上抽象中也包含一些实现）
abstract class Study2 {
  void study2();
}

// mixins（为类添加特性）
// mixins 是在多个类层次结构中重用代码的一种方式
// 要使用mixins，在with关键字后面跟上一个或者多个mixin xxx（多个逗号分隔），并且with要用在extends关键字之后
// mixins的特征：实现 mixin ，就创建一个继承 Object 类的子类(不能继承其他类)，不声明任何构造方法，不调用 super

class Test extends Person with Study, Study2 {

  Test(String name, int age) : super(name, age);

  @override
  String study() {
    // TODO: implement study
  }
  
   @override
  String study2() {
    // TODO: implement study2
  }
}