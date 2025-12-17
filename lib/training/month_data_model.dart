class MonthDataModel{
  String Parks = ''; // 标题
  String Reaction = ''; // 时间
  String  Rate = ""; // 描述
  bool isRise = true;// 上升

  MonthDataModel(this.Parks,this.Reaction, this.Rate,{this.isRise = false});
}