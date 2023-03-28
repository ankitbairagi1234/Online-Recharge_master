class NewModel {
  OrderProductList? orderProductList;
  String? responseCode;
  String? result;
  String? responseMsg;

  NewModel(
      {this.orderProductList,
        this.responseCode,
        this.result,
        this.responseMsg});

  NewModel.fromJson(Map<String, dynamic> json) {
    orderProductList = json['OrderProductList'] != null
        ? new OrderProductList.fromJson(json['OrderProductList'])
        : null;
    responseCode = json['ResponseCode'];
    result = json['Result'];
    responseMsg = json['ResponseMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderProductList != null) {
      data['OrderProductList'] = this.orderProductList!.toJson();
    }
    data['ResponseCode'] = this.responseCode;
    data['Result'] = this.result;
    data['ResponseMsg'] = this.responseMsg;
    return data;
  }
}

class OrderProductList {
  List<OrderProductData>? orderProductData;

  OrderProductList({this.orderProductData});

  OrderProductList.fromJson(Map<String, dynamic> json) {
    if (json['Order_Product_Data'] != null) {
      orderProductData = <OrderProductData>[];
      json['Order_Product_Data'].forEach((v) {
        orderProductData!.add(new OrderProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orderProductData != null) {
      data['Order_Product_Data'] =
          this.orderProductData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderProductData {
  String? subscribeId;
  String? productQuantity;
  String? productId;
  String? productName;
  String? productDiscount;
  String? productImage;
  String? productPrice;
  dynamic? productVariation;
  String? deliveryTimeslot;
  int? productTotal;
  String? totaldelivery;
  String? startdate;
  List<Totaldates>? totaldates;

  OrderProductData(
      {this.subscribeId,
        this.productQuantity,
        this.productId,
        this.productName,
        this.productDiscount,
        this.productImage,
        this.productPrice,
        this.productVariation,
        this.deliveryTimeslot,
        this.productTotal,
        this.totaldelivery,
        this.startdate,
        this.totaldates});

  OrderProductData.fromJson(Map<String, dynamic> json) {
    subscribeId = json['Subscribe_Id'];
    productQuantity = json['Product_quantity'];
    productId = json['product_id'];
    productName = json['Product_name'];
    productDiscount = json['Product_discount'];
    productImage = json['Product_image'];
    productPrice = json['Product_price'];
    productVariation = json['Product_variation'];
    deliveryTimeslot = json['Delivery_Timeslot'];
    productTotal = json['Product_total'];
    totaldelivery = json['totaldelivery'];
    startdate = json['startdate'];
    if (json['totaldates'] != null) {
      totaldates = <Totaldates>[];
      json['totaldates'].forEach((v) {
        totaldates!.add(new Totaldates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Subscribe_Id'] = this.subscribeId;
    data['Product_quantity'] = this.productQuantity;
    data['product_id'] = this.productId;
    data['Product_name'] = this.productName;
    data['Product_discount'] = this.productDiscount;
    data['Product_image'] = this.productImage;
    data['Product_price'] = this.productPrice;
    data['Product_variation'] = this.productVariation;
    data['Delivery_Timeslot'] = this.deliveryTimeslot;
    data['Product_total'] = this.productTotal;
    data['totaldelivery'] = this.totaldelivery;
    data['startdate'] = this.startdate;
    if (this.totaldates != null) {
      data['totaldates'] = this.totaldates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Totaldates {
  String? date;
  int? isComplete;
  String? formatDate;

  Totaldates({this.date, this.isComplete, this.formatDate});

  Totaldates.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    isComplete = json['is_complete'];
    formatDate = json['format_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['is_complete'] = this.isComplete;
    data['format_date'] = this.formatDate;
    return data;
  }
}