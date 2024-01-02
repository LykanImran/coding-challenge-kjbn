class HomeModel {
  int? second;
  int? randomNum;
  String? msgTitle;
  String? msgSub;
  int currTimer;

  int? attempts;
  int? success;

  HomeModel({this.currTimer = 5, this.attempts = 0, this.success = 0});
}
