
class TrainingDataModel{
  int index = 1;
  String parks = ''; //
  String reaction = ''; //
  String rate = ''; //
  bool isShowBottomLine = true;

  TrainingDataModel(this.parks,this.reaction,this.rate,{this.isShowBottomLine = true,this.index = 1});
}