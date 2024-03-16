/// 泛型

void main() {}

/// 泛型：提高代码复用度
class Cache<T> {
  final Map<String, T> _cached = {};

  void set(String key, T value) {
    _cached[key] = value;
  }


  /// 泛型方法
  T? get(String key) {
    return _cached[key];
  }
}
