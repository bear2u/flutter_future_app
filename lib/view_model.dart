class ViewModel {
  Service _service = new Service();
  int _count = 0;

  Future<int> get count =>
      Future.delayed(Duration(seconds: 3), () => Future.value(_count));

  increment() async {
    _count = await _service.increment(_count);
    return count;
  }

  decrement() async {
    await _service.decrement(_count);
    return count;
  }
}

//서버쪽
class Service {
  Future<int> increment(int count) {
    //서버 가져온 경우
    return Future.value(++count);
  }

  Future<int> decrement(int count) {
    return Future.value(--count);
  }
}
