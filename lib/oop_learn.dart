void main() {

  StudentMixin student = StudentMixin('Jack',26);
  student.study();
}

class Person {
  String name;
  int age;

  Person(this.name, this.age);

  void sayHello() {
    print('你好，我是$name，今年$age岁。');
  }
}

class Student extends Person {
  String? city;
  String? _school;

  Student(this._school, String? name, int? age, {this.city})
      : super('张三', 18); // 调用父类的构造函数

  // 命名构造方法：  类名.方法
  Student.cover(Student stu) : super(stu.name, stu.age);

  // 命名工厂构造方法： factory 类名.方法
  factory Student.stu(Student student) {
    return Student(student._school, student.name, student.age);
  }
}

abstract class Study {
  // 抽象方法抽象方法
  void read();

  void study();

}

/// mixin 在多个类层次结构之间提供代码重用
/// 要实现 mixin ，需要满足以下条件：创建一个继承 Object  的类，


mixin StudyMixins{
  // 抽象方法抽象方法
  void read();

  void study() {
    print('我在学习');
  }

}

class StudentMixin extends Person with StudyMixins {
  StudentMixin(super.name, super.age);

  @override
  void read() {
    study();
  }

}