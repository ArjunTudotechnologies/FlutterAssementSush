class BadModel {
  int? charId;
  String? name;
  String? birthday;
  String? img;
  String? status;
  String? nickname;
  String? portrayed;
  String? category;
  List<dynamic>? occupation;

  BadModel(
      {this.charId,
        this.name,
        this.birthday,
        this.img,
        this.status,
        this.nickname,
        this.portrayed,
        this.category,
        this.occupation
       });

  BadModel.fromJson(Map<dynamic, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json['birthday'];
    img = json['img'];
    status = json['status'];
    nickname = json['nickname'];
    portrayed = json['portrayed'];
    category = json['category'];
    occupation = json['occupation'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['img'] = this.img;
    data['status'] = this.status;
    data['nickname'] = this.nickname;
    data['portrayed'] = this.portrayed;
    data['category'] = this.category;
    data['occupation'] = occupation;
    return data;
  }
}