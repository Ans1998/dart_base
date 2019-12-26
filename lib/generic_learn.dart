import './oop_learn.dart';

class TestGeneric{
  void start() {
    Cache<String> cache1 = Cache();

    cache1.setItem('cache1', 'aaa'); // 泛型作用：类型检查约束类比：List<String>
    
    String string1 = cache1.getItem('cache1');
    print(string1);


    Cache<int> cache2 = Cache();
    cache2.setItem('cache2', 123); // 泛型作用：类型检查约束类比：List<String>
    
    int string2 = cache2.getItem('cache2');
    print(string2);

    // 泛型约束
    Member<Student> member = Member(Student('', '', 16));
    print(member.fixedName());
  }
}

// 泛型（主要解决类、接口、方法的复用性、以及对不特定数据类型的支持） 提高代码复用度
class Cache<T> {
  static final Map<String, Object> _cache = {};
  // static final Map<String, Object> _cache = Map();
  // 泛型方法
  void setItem(String key, T val) {
    _cache[key] = val;
  }
  T getItem(String key) {
    return _cache[key];
  }
}

// 类型约束
class Member<T extends Person> {
  T _person;
  // 泛型作用：约束参数类型
  Member(this._person);
  String fixedName() {
    return 'fixed: ${_person.name}';
  }
}