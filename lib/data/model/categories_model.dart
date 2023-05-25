class CatagoriesModel {
  int? catagoriesId;
  String? catagoriesName;
  String? catagoriesNamaAr;
  String? catagoriesImage;
  String? catagoriesDatetime;

  CatagoriesModel(
      {this.catagoriesId,
      this.catagoriesName,
      this.catagoriesNamaAr,
      this.catagoriesImage,
      this.catagoriesDatetime});

  CatagoriesModel.fromJson(Map<String, dynamic> json) {
    catagoriesId = json['catagories_id'];
    catagoriesName = json['catagories_name'];
    catagoriesNamaAr = json['catagories_nama_ar'];
    catagoriesImage = json['catagories_image'];
    catagoriesDatetime = json['catagories_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['catagories_id'] = this.catagoriesId;
    data['catagories_name'] = this.catagoriesName;
    data['catagories_nama_ar'] = this.catagoriesNamaAr;
    data['catagories_image'] = this.catagoriesImage;
    data['catagories_datetime'] = this.catagoriesDatetime;
    return data;
  }
}
