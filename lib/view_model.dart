import 'dart:async';

class ViewModel {
  StreamController<int> _countController = StreamController<int>();

  Stream<int> get countStream => _countController.stream;

  Service _service = new Service();
  int _count = 0;

  Future<int> get count =>
      Future.delayed(Duration(seconds: 3), () => Future.value(_count));

  ViewModel() {
    _countController.sink.add(_count);
  }

  Future<int> delay(int value) =>
      Future.delayed(Duration(seconds: 3), () => Future.value(value));

  increment() async {
    _count = await _service.increment(_count);
    _countController.sink.add(await delay(_count));
  }

  decrement() async {
    await _service.decrement(_count);
    return count;
  }

  dispose() {
    _countController.close();
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
