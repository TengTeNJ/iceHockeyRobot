class RankDataModel{
  int index = 1;
  String nickName = ''; // 昵称
  String region = ''; // 地区
  String reactionTime = ''; // 反应时间

  RankDataModel(this.nickName,this.region,this.reactionTime,{this.index = 1});
}