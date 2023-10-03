// ignore_for_file: unnecessary_this

class ContactModel {
  String? objectId;
  String? name;
  String? imagePath;
  String? phoneNumber;
  String? createdAt;
  String? updatedAt;

  ContactModel(
      {this.objectId,
      this.name,
      this.imagePath,
      this.phoneNumber,
      this.createdAt,
      this.updatedAt});

  ContactModel.fromJson(Map<String, dynamic> json) {
    objectId = json['objectId'];
    name = json['name'];
    imagePath = json['image_path'];
    phoneNumber = json['phone_number'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['objectId'] = this.objectId;
    data['name'] = this.name;
    data['image_path'] = this.imagePath;
    data['phone_number'] = this.phoneNumber;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
