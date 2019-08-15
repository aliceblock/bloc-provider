import 'package:rxdart/subjects.dart';

class CounterBloc {
  // กำหนดค่าเริ่มต้นของ counter
  static int initialCounter = 0;

  // สร้าง BehaviorSubject เป็นตัวกลางในการส่งผ่านค่า counter เป็น Stream ชนิดหนึ่ง
  BehaviorSubject<int> _counterController = BehaviorSubject<int>();
  // Stream สำหรับคนที่จะมา Subscribe
  get stream => _counterController.stream;
  // ค่า counter ปัจจุบัน
  get currentCounter => _counterController.value ?? initialCounter;

  // ฟังก์ชันสำหรับเพิ่มค่า counter
  increaseCounter() {
    _counterController.sink.add(currentCounter + 1);
  }

  // Stream เมื่อใช้เสร็จก็ควรปิดด้วย
  dispose() {
    _counterController.close();
  }
}
