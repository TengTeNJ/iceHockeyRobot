
import 'package:icehockeyrobot/util/blue_tooth_manager.dart';

import '../constants.dart';
import '../model/ble_model.dart';

/// APP->WIF模组->MCU  数据发送类
class BleSendUtil {
 // 机器人游戏模式选择（1个字节）0x00 暂停 0x01游戏模式10x02 游戏模式20x03游戏模式3
  static setRobotGameMode(RobotMode mode) {
     if (BluetoothManager().hasConnectedDeviceList.isEmpty) {
       return;
     }
     BluetoothManager().writerDataToDevice(getWriterDevice(), changeRobotMode(mode));

  }

  static BLEModel getWriterDevice() {
    final model = BluetoothManager()
        .hasConnectedDeviceList
        .firstWhere((element) => element.device.name == kBLEDevice_NewName);
    return model;
  }
}

/*机器人运行模式*/
enum RobotMode {
  stop, // 暂停(0 -- )
  gameModeP1, // 游戏模式P1
  gameModeP2, // 游戏模式P2
  gameModeP3 // 游戏模式P3
}

/*机器人游戏模式选择*/
List<int> changeRobotMode(RobotMode mode) {
  int start = kDataFrameHeader;
  int length = 6;
  int cmd = 0x11;
  int data = mode.index;
  int cs = start + length + cmd + data;
  int end = kDataFrameFoot;
  print('切换机器人模式:${[start, length, cmd, data, cs, end]}');
  return [start, length, cmd, data, cs, end];
}

/*心跳*/
List<int> heartBeatData() {
  int v = 0xA5 + 0x05 + 0x30;
  List<int> values = [0xA5, 0x05, 0x30, v, 0xAA];
  print('心跳${values}');
  return values;
}