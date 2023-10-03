class ContactModel {
  List<Results>? results;

  ContactModel({this.results});

  ContactModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? objectId;
  String? name;
  String? phoneNumber;
  String? imagePath;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.objectId,
      this.name,
      this.phoneNumber,
      this.imagePath,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    name = json['name'];
    phoneNumber = json['phone_number'];
    imagePath = json['image_path'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['objectId'] = objectId;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['image_path'] = imagePath;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
