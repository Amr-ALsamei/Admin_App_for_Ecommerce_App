class ItemModel {
  int? itemID;
  int? itemCategory;
  String? itemName;
  String? itemNameAr;
  String? itemDesc;
  String? itemDescAr;
  String? itemImage;
  int? itemCount;
  int? itemDiscount;
  int? itemPrice;
  int? itemActive;
  String? itemDate;
  int? favorite;
  String? categoryName;
  String? categoryNamear;
  int? itemsPriceDiscount;
  int? ratingvalue;

  ItemModel(
      {this.itemID,
      this.itemCategory,
      this.itemName,
      this.itemNameAr,
      this.itemDesc,
      this.itemDescAr,
      this.itemImage,
      this.itemCount,
      this.itemDiscount,
      this.itemPrice,
      this.itemActive,
      this.itemDate,
      this.favorite,
      this.categoryName,
      this.categoryNamear,
      this.itemsPriceDiscount,
      this.ratingvalue});

  ItemModel.fromJson(Map<String, dynamic> json) {
    itemID = json['item_ID'];
    itemCategory = json['item_category'];
    itemName = json['item_name'];
    itemNameAr = json['item_name_ar'];
    itemDesc = json['item_desc'];
    itemDescAr = json['item_desc_ar'];
    itemImage = json['item_image'];
    itemCount = json['item_count'];
    itemDiscount = json['item_discount'];
    itemPrice = json['item_price'];
    itemActive = json['item_active'];
    itemDate = json['item_date'];
    favorite=json['favorite'];
    categoryName=json['Category_name'];
    categoryNamear=json['Category_name_ar'];
    itemsPriceDiscount=json['itemspricediscount'];
    ratingvalue=json['ratingvalu'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_ID'] = this.itemID;
    data['item_category'] = this.itemCategory;
    data['item_name'] = this.itemName;
    data['item_name_ar'] = this.itemNameAr;
    data['item_desc'] = this.itemDesc;
    data['item_desc_ar'] = this.itemDescAr;
    data['item_image'] = this.itemImage;
    data['item_count'] = this.itemCount;
    data['item_discount'] = this.itemDiscount;
    data['item_price'] = this.itemPrice;
    data['item_active'] = this.itemActive;
    data['item_date'] = this.itemDate;
    data['favorite']=this.favorite;
    data['Category_name']=this.categoryName;
    data['Category_name_ar']=this.categoryNamear;
    data['itemspricediscount']=this.itemsPriceDiscount;
    data['ratingvalu']=this.ratingvalue;
    return data;
  }
}