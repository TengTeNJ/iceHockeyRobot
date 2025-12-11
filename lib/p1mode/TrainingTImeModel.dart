//捡球机器人捡球时间
class Trainingtimemodel {
  String id = '0';
  String pickupBallTime = '0'; // 捡球机器人工作时间
  String time = ''; // 捡球日期

  Trainingtimemodel({required this.pickupBallTime,required this.time});

  factory Trainingtimemodel.modelFromJson(Map<String, dynamic> json) {
    Trainingtimemodel model =  Trainingtimemodel(
      pickupBallTime: json['pickupBallTime'] ?? '0',
      time: json['time'] ?? '0',
    );
    return model;
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'pickupBallTime': this.pickupBallTime,
        'time': this.time,
        'id': this.id,
      };
}