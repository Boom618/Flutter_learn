void main() {
  _numb();
  //_numb2();
  FunctionLearn learn = FunctionLearn();
  learn.sum(1, 5);
  learn._learn();
  learn.anonymousFunction();
}

/// 方法构成
///
class FunctionLearn {
  int sum(int value1, int value2, {bool? isPrint = false}) {
    var result = value1 + value2;
    if (isPrint ?? false) {
      print(isPrint);
    }
    return result;
  }

  _learn() {
    print('hello');
  }

  anonymousFunction() {
    var list = [1, 2, 3];
    // lambda表达式 是匿名方法
    list.forEach((element) {
      print('${list.indexOf(element)} : $element');
    });
  }
}

_numb() {
  num number1 = -1.0;
  int int1 = 2;

  print(number1);
}
