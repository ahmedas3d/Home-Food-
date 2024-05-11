class CartModel {
  String? itemsprice;
  String? countitems;
  String? cartId;
  String? cartItemsId;
  String? userId;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDescount;
  String? itemsDate;
  String? itemsCat;

  CartModel(
      {this.itemsprice,
        this.countitems,
        this.cartId,
        this.cartItemsId,
        this.userId,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDesc,
        this.itemsDescAr,
        this.itemsImage,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDescount,
        this.itemsDate,
        this.itemsCat});

  CartModel.fromJson(Map<String, dynamic> json) {
    itemsprice = json['itemsprice'].toString();
    countitems = json['countitems'].toString();
    cartId = json['cart_id'].toString();
    cartItemsId = json['cart_items_id'].toString();
    userId = json['user_id'].toString();
    itemsId = json['items_id'].toString();
    itemsName = json['items_name'].toString();
    itemsNameAr = json['items_name_ar'].toString();
    itemsDesc = json['items_desc'].toString();
    itemsDescAr = json['items_desc_ar'].toString();
    itemsImage = json['items_image'].toString();
    itemsCount = json['items_count'].toString();
    itemsActive = json['items_active'].toString();
    itemsPrice = json['items_price'].toString();
    itemsDescount = json['items_descount'].toString();
    itemsDate = json['items_date'].toString();
    itemsCat = json['items_cat'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemsprice'] = this.itemsprice;
    data['countitems'] = this.countitems;
    data['cart_id'] = this.cartId;
    data['cart_items_id'] = this.cartItemsId;
    data['user_id'] = this.userId;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_desc'] = this.itemsDesc;
    data['items_desc_ar'] = this.itemsDescAr;
    data['items_image'] = this.itemsImage;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_descount'] = this.itemsDescount;
    data['items_date'] = this.itemsDate;
    data['items_cat'] = this.itemsCat;
    return data;
  }
}