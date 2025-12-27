import 'package:icehockeyrobot/constants.dart';
import 'package:icehockeyrobot/model/ble_model.dart';

class ResponseCMDType {
  static const int batteryInfo = 0x10; // 电池状态字（1字节）。电池电量: 0-100的数值（电量百分比），单位：%；
  static const int gameModeFeedback = 0x12; // 游戏模式反馈 0x00 暂停
  // 0x01游戏模式1
  // 0x02 游戏模式2
  // 0x03游戏模式3
  // 0x10游戏开始
  // 0x11游戏结束
  static const int countdownTimeFeedback =
      0x13; // 倒计时时间反馈（2个字节） 第一个字节为：0x00时，时间重置（升级时需要重置）
  //第一个字节：分钟数
  // 第二个字节：秒钟数
  static const int scoreFeedback =
      0x14; // 分数反馈（2个字节）//先读高位，再读低位 总分设置上限为65535，防止1个字节的情况下分数溢出
  static const int warningInfo = 0x17; // 报警信息（1个字节）
  static const int heartBeatDataResponse = 0x31; // MCU发送心跳包
}

/*数据拆分*/
List<List<int>> splitData(List<int> _data) {
  int a = kDataFrameHeader;
  List<List<int>> result = [];
  int start = 0;
  while (true) {
    int index = _data.indexOf(a, start);
    if (index == -1) break;
    List<int> subList = _data.sublist(start, index);
    result.add(subList);
    start = index + 1;
  }
  if (start < _data.length) {
    List<int> subList = _data.sublist(start);
    result.add(subList);
  }
  return result;
}

handleData(List<int> element) {
  int cmd = element[1];
  switch (cmd) {
    case ResponseCMDType.batteryInfo:
      int power_data = element[2]; // 电量
      print('电量上报${power_data}');

    case ResponseCMDType.gameModeFeedback:
      int gameMode_data = element[2];
      print('游戏模式反馈的${gameMode_data}');

    case ResponseCMDType.countdownTimeFeedback:
      int countdownTime_data = element[2];
      print('倒计时时间反馈的${countdownTime_data}');

    case ResponseCMDType.scoreFeedback:
      int score_data = element[2];
      print('分数反馈的${score_data}');

    case ResponseCMDType.warningInfo:
      int warn_data = element[2];
      print('告警信息的${warn_data}');

    case ResponseCMDType.heartBeatDataResponse:
      print('MCU发送心跳包');
  }
}

class BluetoothDataParse {
  /// 蓝牙数据解析
  static parseData(List<int> data, BLEModel model) {
    if (data.isEmpty) {
      return;
    }

    if (data.contains(kDataFrameHeader)) {
      List<List<int>> _datas = splitData(data);
      _datas.forEach((element) {
        if (element == null || element.length == 0) {
          print("有问题的蓝牙数据${element}");
        } else {
          // 先获取长度
          int length = element[0] - 1; // 获取长度 去掉了帧头
          if (length != element.length) {
            // 说明不是完整的数据
          } else {
            handleData(element);
          }
        }
      });
    }
  }
}
