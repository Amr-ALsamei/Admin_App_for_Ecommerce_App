class CategoriesModel {
  int? categoryID;
  String? categoryName;
  String? categoryNameAr;
  String? categoryImage;
  String? categoryDatetime;

  CategoriesModel(
      {this.categoryID,
      this.categoryName,
      this.categoryNameAr,
      this.categoryImage,
      this.categoryDatetime});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoryID = json['Category_ID'];
    categoryName = json['Category_name'];
    categoryNameAr = json['Category_name_ar'];
    categoryImage = json['Category_image'];
    categoryDatetime = json['category_datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Category_ID'] = this.categoryID;
    data['Category_name'] = this.categoryName;
    data['Category_name_ar'] = this.categoryNameAr;
    data['Category_image'] = this.categoryImage;
    data['category_datetime'] = this.categoryDatetime;
    return data;
  }
}