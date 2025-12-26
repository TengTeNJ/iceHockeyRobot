import 'package:flutter/material.dart';
import 'package:icehockeyrobot/util/string_util.dart';

import '../constants.dart';
import '../model/ble_model.dart';
import '../view/ble_list_view.dart';
import 'blue_tooth_manager.dart';
import 'cancel_button.dart';
import 'color.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';


class TTDialog {
  /**蓝牙列表**/
  static bleListDialog(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.transparent,
      isScrollControlled: true, // 设置为false话 弹窗的高度就会固定
      context: context,
      builder: (BuildContext context) {
        return FractionallySizedBox(
          heightFactor: 0.5,
          child: BLEListDialog(),
        );
      },
    );
  }


  // 日期选择器
  static timeSelect(BuildContext context, Function confirm,
      {int index = 0, String? start, String? end}) {
    showModalBottomSheet(
      backgroundColor: Color.fromRGBO(62, 62, 85, 1),
      isScrollControlled: true, // 设置为false话 弹窗的高度就会固定
      context: context,
      builder: (BuildContext context) {
        double _height = 0.5;
        return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return FractionallySizedBox(
                heightFactor: _height,
                child: TimeSelectDialog(
                  startTime: start,
                  endTime: end,
                  selectIndex: index,
                  datePickerSelect: (value) {
                    if (value) {
                      _height = 0.80;
                      setState(() {});
                    } else {
                      _height = 0.5;
                      setState(() {});
                    }
                  },
                  confirm: (startTime, endTime, selectIndex) {
                    if (confirm != null) {
                      int _index = selectIndex;
                      if (selectIndex == -1) {
                        _index = 3;
                      }
                      confirm(startTime, endTime, _index);
                    }
                  },
                ),
              );
            });
      },
    );
  }


}

/*时间选择弹窗*/
class TimeSelectDialog extends StatefulWidget {
  String? startTime;
  String? endTime;
  int selectIndex; // 标识选择的时7,30 还是90days
  Function? datePickerSelect;
  Function? confirm;

  TimeSelectDialog(
      {this.datePickerSelect,
        this.confirm,
        this.selectIndex = 0,
        this.startTime,
        this.endTime});

  @override
  State<TimeSelectDialog> createState() => _TimeSelectDialogState();
}

class _TimeSelectDialogState extends State<TimeSelectDialog> {
  int _selectIndex = 0;
  int _timeSelectIndex = 0; // 当选择自定义时，标记选择的时开始还是结束 1开始 2结束
  DateTime _selectedDate = DateTime.now();
  DateTime _maxDate = DateTime.now();
  late DateTime _yesterdayDate;

  late String startTime;
  late String endTimer;

  // 计算90天前的时间
  late DateTime _minDate;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectIndex = widget.selectIndex;
    _minDate = _selectedDate.subtract(Duration(days: 180));
    // 昨天的时间
    DateTime yesterday = _selectedDate.subtract(Duration(days: 1));
    _yesterdayDate = yesterday;
    endTimer = widget.endTime != null
        ? widget.endTime!
        : StringUtil.dateToString(yesterday);
    // 过去七天的第一天的时间
    DateTime beforeSeven = yesterday.subtract(Duration(days: 7));
    startTime = widget.startTime != null
        ? widget.startTime!
        : StringUtil.dateToString(beforeSeven);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [CancelButton()],
            ),
            SizedBox(
              height: 28,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      // Last 7days
                      if (widget.datePickerSelect != null) {
                        widget.datePickerSelect!(false);
                      }
                      _timeSelectIndex = 0;
                      _selectIndex = 0;

                      DateTime yesterday =
                      _selectedDate.subtract(Duration(days: 1));
                      _yesterdayDate = yesterday;
                      endTimer = StringUtil.dateToString(yesterday);
                      // 过去七天的第一天的时间
                      DateTime beforeSeven =
                      _yesterdayDate.subtract(Duration(days: 7));
                      startTime = StringUtil.dateToString(beforeSeven);
                      setState(() {});
                    },
                    child: Container(
                        height: 28,
                        decoration: BoxDecoration(
                            border: _selectIndex == 0
                                ? Border.all(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              width: 0.0, // 设置边框宽度
                            )
                                : Border.all(
                              color:  Color.fromRGBO(112, 112, 112, 1),
                              width: 1.0, // 设置边框宽度
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: _selectIndex == 0
                                ? Constants.baseStyleColor
                                : Color.fromRGBO(62, 62, 85, 1)),
                        child: Center(
                          child: _selectIndex == 0
                              ? Constants.regularWhiteTextWidget(
                              'Last 7 days', 14,Colors.white)
                              : Constants.regularWhiteTextWidget(
                              'Last 7 days', 14,Constants.baseGreyStyleColor),
                        )),
                  ),
                  flex: 1,
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      // Last 30days
                      if (widget.datePickerSelect != null) {
                        widget.datePickerSelect!(false);
                      }
                      _timeSelectIndex = 0;
                      _selectIndex = 1;
                      DateTime yesterday =
                      _selectedDate.subtract(Duration(days: 1));
                      _yesterdayDate = yesterday;
                      endTimer = StringUtil.dateToString(yesterday);
                      // 过去30天的第一天的时间
                      DateTime beforeSeven =
                      _yesterdayDate.subtract(Duration(days: 30));
                      startTime = StringUtil.dateToString(beforeSeven);
                      setState(() {});
                    },
                    child: Container(
                        height: 28,
                        decoration: BoxDecoration(
                            border: _selectIndex == 1
                                ? Border.all(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              width: 0.0, // 设置边框宽度
                            )
                                : Border.all(
                              color: Color.fromRGBO(112, 112, 112, 1),
                              width: 1.0, // 设置边框宽度
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: _selectIndex == 1
                                ? Constants.baseStyleColor
                                : hexStringToColor('#3E3E55')),
                        child: Center(
                          child: _selectIndex == 1
                              ? Constants.regularWhiteTextWidget(
                              'Last 30 days', 14,Colors.white)
                              : Constants.regularWhiteTextWidget(
                              'Last 30 days', 14,Constants.baseGreyStyleColor),
                        )),
                  ),
                  flex: 1,
                ),
                SizedBox(
                  width: 6,
                ),
                Expanded(
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () {
                      // Last 90days
                      if (widget.datePickerSelect != null) {
                        widget.datePickerSelect!(false);
                      }
                      _timeSelectIndex = 0;
                      _selectIndex = 2;
                      DateTime yesterday =
                      _selectedDate.subtract(Duration(days: 1));
                      _yesterdayDate = yesterday;
                      endTimer = StringUtil.dateToString(yesterday);
                      // 过去90天的第一天的时间
                      DateTime beforeSeven =
                      _yesterdayDate.subtract(Duration(days: 90));
                      startTime = StringUtil.dateToString(beforeSeven);
                      setState(() {});
                    },
                    child: Container(
                        height: 28,
                        decoration: BoxDecoration(
                            border: _selectIndex == 2
                                ? Border.all(
                              color: hexStringToColor('#707070'),
                              width: 0.0, // 设置边框宽度
                            )
                                : Border.all(
                              color: hexStringToColor('#707070'),
                              width: 1.0, // 设置边框宽度
                            ),
                            borderRadius: BorderRadius.circular(20),
                            color: _selectIndex == 2
                                ? Constants.baseStyleColor
                                : hexStringToColor('#3E3E55')),
                        child: Center(
                          child: _selectIndex == 2
                              ? Constants.regularWhiteTextWidget(
                              'Last 90 days', 14,Colors.white)
                              : Constants.regularWhiteTextWidget(
                              'Last 90 days', 14,Constants.baseGreyStyleColor),
                        )),
                  ),
                  flex: 1,
                ),
              ],
            ),
            SizedBox(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_timeSelectIndex == 1) {
                      _timeSelectIndex = 0;
                      if (widget.datePickerSelect != null) {
                        widget.datePickerSelect!(false);
                      }
                      setState(() {});
                      return;
                    }
                    _selectIndex = -1;
                    _timeSelectIndex = 0; // 如果时间选择弹窗正在显示，先让收起
                    setState(() {});

                    Future.delayed(Duration(milliseconds: 100), () {
                      _selectedDate = StringUtil.stringToDate(startTime);
                      _timeSelectIndex = 1;
                      if (widget.datePickerSelect != null) {
                        widget.datePickerSelect!(true);
                      }
                      setState(() {});
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Constants.regularWhiteTextWidget(startTime, 16,Colors.white),
                          SizedBox(
                            width: 8,
                          ),
                          _timeSelectIndex == 1
                              ? Icon(
                            Icons.keyboard_arrow_down,
                            color: Constants.baseStyleColor,
                          )
                              : Icon(
                            Icons.chevron_right,
                            color: Constants.baseGreyStyleColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        color: hexStringToColor('#707070'),
                        height: 0.5,
                        width: (Constants.screenWidth(context) - 90) / 2.0,
                      )
                    ],
                  ),
                ),
                Constants.regularWhiteTextWidget('To', 14, height: 0.8,Constants.baseGreyStyleColor),
                GestureDetector(
                  onTap: () {
                    if (_timeSelectIndex == 2) {
                      _timeSelectIndex = 0;
                      if (widget.datePickerSelect != null) {
                        widget.datePickerSelect!(false);
                      }
                      setState(() {});
                      return;
                    }
                    _selectIndex = -1;
                    _timeSelectIndex = 0; // 如果时间选择弹窗正在显示，先让收起
                    setState(() {});
                    Future.delayed(Duration(milliseconds: 100), () {
                      _selectedDate = StringUtil.stringToDate(endTimer);
                      _timeSelectIndex = 2;
                      if (widget.datePickerSelect != null) {
                        widget.datePickerSelect!(true);
                      }
                      setState(() {});
                    });
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Constants.regularWhiteTextWidget(endTimer, 16,Colors.white),
                          SizedBox(
                            width: 8,
                          ),
                          _timeSelectIndex == 2
                              ? Icon(
                            Icons.keyboard_arrow_down,
                            color: Constants.baseStyleColor,
                          )
                              : Icon(
                            Icons.chevron_right,
                            color: Constants.baseGreyStyleColor,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        color: hexStringToColor('#707070'),
                        height: 0.5,
                        width: (Constants.screenWidth(context) - 90) / 2.0,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.help,
                  color: hexStringToColor('#B1B1B1'),
                  size: 12,
                ),
                SizedBox(
                  width: 4,
                ),
                Constants.regularWhiteTextWidget(
                    'Only six months of data are available', 10,Constants.baseGreyStyleColor),
              ],
            ),
            SizedBox(
              height: 32,
            ),
            _timeSelectIndex >= 1
                ? Container(
              color: Colors.red,
              height: 220,
              child: Center(
                  child: DateTimePickerWidget(
                    onChange: (DateTime dateTime, List<int> selectedIndex) {
                      if (_timeSelectIndex == 1) {
                        startTime = StringUtil.dateToString(dateTime);
                      } else if (_timeSelectIndex == 2) {
                        endTimer = StringUtil.dateToString(dateTime);
                      }
                      setState(() {});
                    },
                    pickerTheme: DateTimePickerTheme(
                        itemTextStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontFamily: 'SanFranciscoDisplay'),
                        backgroundColor: hexStringToColor('#3E3E55'),
                        titleHeight: 0,
                        itemHeight: 44,
                        pickerHeight: 220),
                    minDateTime: _minDate,
                    maxDateTime: _maxDate,
                    initDateTime: _selectedDate,
                    locale: DateTimePickerLocale.en_us,
                    dateFormat:
                    'MMM-dd-yyyy', // 这里的MMMM4个显示引英文全写，两个的话仍然显示数字月份.3个的话显示缩写的英文月份
                  )),
            ) // 时间弹窗
                : Container(),
            _timeSelectIndex >= 1
                ? SizedBox(
              height: 16,
            )
                : SizedBox(
              height: 0,
            ),
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                DateTime startDate = StringUtil.stringToDate(startTime);
                DateTime endDate = StringUtil.stringToDate(endTimer);
                if (endDate.isBefore(startDate)) {
                  /* TODO */
                  // 结束时间不能早于开始时间
                  // TTToast.showToast(
                  //     'End time cannot be earlier than start time');
                  return;
                }
                if (widget.confirm != null) {
                  widget.confirm!(startTime.replaceAll('/', '-'),
                      endTimer.replaceAll('/', '-'), _selectIndex);
                }
                /* TODO */
                // NavigatorUtil.pop();
              },
              child: Container(
                width: 210,
                height: 40,
                decoration: BoxDecoration(
                    color: Constants.baseStyleColor,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: Constants.regularWhiteTextWidget('Confirm', 14,Colors.white),
                ),
              ),
            ), // Confirm按钮
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }
}

/**蓝牙列表弹窗**/
class BLEListDialog extends StatefulWidget {
  const BLEListDialog({super.key});

  @override
  State<BLEListDialog> createState() => _BLEListDialogState();
}

class _BLEListDialogState extends State<BLEListDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: Constants.darkControllerColor),
      child: Stack(
        children: [
          Positioned(
              top: 8,
              left: (Constants.screenWidth(context) - 80) / 2.0,
              child: Container(
                  width: 80,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Color.fromRGBO(89, 105, 138, 0.4),
                  ))),
          // Positioned(
          //     top: 16,
          //     left: 16,
          //     child: GestureDetector(
          //       behavior: HitTestBehavior.opaque,
          //       onTap: () async {
          //         if (BluetoothManager().hasConnectedDeviceList.length == 1) {
          //           BLEModel model =
          //           BluetoothManager().hasConnectedDeviceList[0];
          //           BluetoothManager().disconnectDevice(model);
          //         } else {
          //           print('未有连接蓝牙设备');
          //         }
          //
          //       },
          //       child: Row(
          //         children: [
          //           Container(
          //             width: 36,
          //             height: 36,
          //             decoration: BoxDecoration(
          //                 color: hexStringToColor('#65657D'),
          //                 borderRadius: BorderRadius.circular(18)),
          //             child: Center(
          //               child: Image(
          //                   image: AssetImage('images/ble/disconnect.png'),
          //                   width: 16),
          //             ),
          //           )
          //         ],
          //       ),
          //     )),
          Positioned(
              top: 16,
              right: 16,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () async {
                  print('begain scan');
                  // BleUtil.begainScan(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                          color: hexStringToColor('#65657D'),
                          borderRadius: BorderRadius.circular(18)),
                      child: Center(
                        child: Image(
                            image: AssetImage('images/home/scan.png'),
                            width: 16),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            child: BleListView(),
            top: 45,
            bottom: 99,
          ),
          Positioned(
            child: GestureDetector(
              onTap: () {
                // NavigatorUtil.pop();
              },
              child: Container(
                child: Center(
                  child: Constants.regularWhiteTextWidget("Cancel", 16, Colors.white),

                ),
                decoration: BoxDecoration(
                    color: Constants.baseStyleColor,
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            left: 83,
            right: 83,
            bottom: 42,
            height: 40,
          )
        ],
      ),
    );
  }
}
