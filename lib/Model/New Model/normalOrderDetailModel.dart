/// order_data : {"order_id":"13","order_date":null,"p_method_name":"Razorpay","customer_address":"indore ganesh dham colony","customer_name":"rohit","customer_mobile":"787878787","Delivery_charge":"30","Delivery_Timeslot":"1","Coupon_Amount":"1","Order_Total":"1","Order_SubTotal":"10","Order_Transaction_id":"1","Additional_Note":"tes","Order_Status":"Pending","Wallet_Amount":"1","Order_Product_Data":[{"Product_quantity":"1","Product_name":"285","Product_discount":"2","Product_image":"a.jpg","Product_price":"1","Product_variation":null,"Product_total":0.979999999999999982236431605997495353221893310546875}]}
/// ResponseCode : "200"
/// Result : "true"
/// ResponseMsg : "Order Get successfully!"

class NormalOrderDetailModel {
  NormalOrderDetailModel({
      OrderData? orderData, 
      String? responseCode, 
      String? result, 
      String? responseMsg,}){
    _orderData = orderData;
    _responseCode = responseCode;
    _result = result;
    _responseMsg = responseMsg;
}

  NormalOrderDetailModel.fromJson(dynamic json) {
    _orderData = json['order_data'] != null ? OrderData.fromJson(json['order_data']) : null;
    _responseCode = json['ResponseCode'];
    _result = json['Result'];
    _responseMsg = json['ResponseMsg'];
  }
  OrderData? _orderData;
  String? _responseCode;
  String? _result;
  String? _responseMsg;
NormalOrderDetailModel copyWith({  OrderData? orderData,
  String? responseCode,
  String? result,
  String? responseMsg,
}) => NormalOrderDetailModel(  orderData: orderData ?? _orderData,
  responseCode: responseCode ?? _responseCode,
  result: result ?? _result,
  responseMsg: responseMsg ?? _responseMsg,
);
  OrderData? get orderData => _orderData;
  String? get responseCode => _responseCode;
  String? get result => _result;
  String? get responseMsg => _responseMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_orderData != null) {
      map['order_data'] = _orderData?.toJson();
    }
    map['ResponseCode'] = _responseCode;
    map['Result'] = _result;
    map['ResponseMsg'] = _responseMsg;
    return map;
  }

}

/// order_id : "13"
/// order_date : null
/// p_method_name : "Razorpay"
/// customer_address : "indore ganesh dham colony"
/// customer_name : "rohit"
/// customer_mobile : "787878787"
/// Delivery_charge : "30"
/// Delivery_Timeslot : "1"
/// Coupon_Amount : "1"
/// Order_Total : "1"
/// Order_SubTotal : "10"
/// Order_Transaction_id : "1"
/// Additional_Note : "tes"
/// Order_Status : "Pending"
/// Wallet_Amount : "1"
/// Order_Product_Data : [{"Product_quantity":"1","Product_name":"285","Product_discount":"2","Product_image":"a.jpg","Product_price":"1","Product_variation":null,"Product_total":0.979999999999999982236431605997495353221893310546875}]

class OrderData {
  OrderData({
      String? orderId, 
      dynamic orderDate, 
      String? pMethodName, 
      String? customerAddress, 
      String? customerName, 
      String? customerMobile, 
      String? deliveryCharge, 
      String? deliveryTimeslot, 
      String? couponAmount, 
      String? orderTotal, 
      String? orderSubTotal, 
      String? orderTransactionId, 
      String? additionalNote, 
      String? orderStatus, 
      String? walletAmount, 
      List<OrderProductData>? orderProductData,}){
    _orderId = orderId;
    _orderDate = orderDate;
    _pMethodName = pMethodName;
    _customerAddress = customerAddress;
    _customerName = customerName;
    _customerMobile = customerMobile;
    _deliveryCharge = deliveryCharge;
    _deliveryTimeslot = deliveryTimeslot;
    _couponAmount = couponAmount;
    _orderTotal = orderTotal;
    _orderSubTotal = orderSubTotal;
    _orderTransactionId = orderTransactionId;
    _additionalNote = additionalNote;
    _orderStatus = orderStatus;
    _walletAmount = walletAmount;
    _orderProductData = orderProductData;
}

  OrderData.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _orderDate = json['order_date'];
    _pMethodName = json['p_method_name'];
    _customerAddress = json['customer_address'];
    _customerName = json['customer_name'];
    _customerMobile = json['customer_mobile'];
    _deliveryCharge = json['Delivery_charge'];
    _deliveryTimeslot = json['Delivery_Timeslot'];
    _couponAmount = json['Coupon_Amount'];
    _orderTotal = json['Order_Total'];
    _orderSubTotal = json['Order_SubTotal'];
    _orderTransactionId = json['Order_Transaction_id'];
    _additionalNote = json['Additional_Note'];
    _orderStatus = json['Order_Status'];
    _walletAmount = json['Wallet_Amount'];
    if (json['Order_Product_Data'] != null) {
      _orderProductData = [];
      json['Order_Product_Data'].forEach((v) {
        _orderProductData?.add(OrderProductData.fromJson(v));
      });
    }
  }
  String? _orderId;
  dynamic _orderDate;
  String? _pMethodName;
  String? _customerAddress;
  String? _customerName;
  String? _customerMobile;
  String? _deliveryCharge;
  String? _deliveryTimeslot;
  String? _couponAmount;
  String? _orderTotal;
  String? _orderSubTotal;
  String? _orderTransactionId;
  String? _additionalNote;
  String? _orderStatus;
  String? _walletAmount;
  List<OrderProductData>? _orderProductData;
OrderData copyWith({  String? orderId,
  dynamic orderDate,
  String? pMethodName,
  String? customerAddress,
  String? customerName,
  String? customerMobile,
  String? deliveryCharge,
  String? deliveryTimeslot,
  String? couponAmount,
  String? orderTotal,
  String? orderSubTotal,
  String? orderTransactionId,
  String? additionalNote,
  String? orderStatus,
  String? walletAmount,
  List<OrderProductData>? orderProductData,
}) => OrderData(  orderId: orderId ?? _orderId,
  orderDate: orderDate ?? _orderDate,
  pMethodName: pMethodName ?? _pMethodName,
  customerAddress: customerAddress ?? _customerAddress,
  customerName: customerName ?? _customerName,
  customerMobile: customerMobile ?? _customerMobile,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  deliveryTimeslot: deliveryTimeslot ?? _deliveryTimeslot,
  couponAmount: couponAmount ?? _couponAmount,
  orderTotal: orderTotal ?? _orderTotal,
  orderSubTotal: orderSubTotal ?? _orderSubTotal,
  orderTransactionId: orderTransactionId ?? _orderTransactionId,
  additionalNote: additionalNote ?? _additionalNote,
  orderStatus: orderStatus ?? _orderStatus,
  walletAmount: walletAmount ?? _walletAmount,
  orderProductData: orderProductData ?? _orderProductData,
);
  String? get orderId => _orderId;
  dynamic get orderDate => _orderDate;
  String? get pMethodName => _pMethodName;
  String? get customerAddress => _customerAddress;
  String? get customerName => _customerName;
  String? get customerMobile => _customerMobile;
  String? get deliveryCharge => _deliveryCharge;
  String? get deliveryTimeslot => _deliveryTimeslot;
  String? get couponAmount => _couponAmount;
  String? get orderTotal => _orderTotal;
  String? get orderSubTotal => _orderSubTotal;
  String? get orderTransactionId => _orderTransactionId;
  String? get additionalNote => _additionalNote;
  String? get orderStatus => _orderStatus;
  String? get walletAmount => _walletAmount;
  List<OrderProductData>? get orderProductData => _orderProductData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['order_date'] = _orderDate;
    map['p_method_name'] = _pMethodName;
    map['customer_address'] = _customerAddress;
    map['customer_name'] = _customerName;
    map['customer_mobile'] = _customerMobile;
    map['Delivery_charge'] = _deliveryCharge;
    map['Delivery_Timeslot'] = _deliveryTimeslot;
    map['Coupon_Amount'] = _couponAmount;
    map['Order_Total'] = _orderTotal;
    map['Order_SubTotal'] = _orderSubTotal;
    map['Order_Transaction_id'] = _orderTransactionId;
    map['Additional_Note'] = _additionalNote;
    map['Order_Status'] = _orderStatus;
    map['Wallet_Amount'] = _walletAmount;
    if (_orderProductData != null) {
      map['Order_Product_Data'] = _orderProductData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Product_quantity : "1"
/// Product_name : "285"
/// Product_discount : "2"
/// Product_image : "a.jpg"
/// Product_price : "1"
/// Product_variation : null
/// Product_total : 0.979999999999999982236431605997495353221893310546875

class OrderProductData {
  OrderProductData({
      String? productQuantity, 
      String? productName, 
      String? productDiscount, 
      String? productImage, 
      String? productPrice, 
      dynamic productVariation, 
      num? productTotal,}){
    _productQuantity = productQuantity;
    _productName = productName;
    _productDiscount = productDiscount;
    _productImage = productImage;
    _productPrice = productPrice;
    _productVariation = productVariation;
    _productTotal = productTotal;
}

  OrderProductData.fromJson(dynamic json) {
    _productQuantity = json['Product_quantity'];
    _productName = json['Product_name'];
    _productDiscount = json['Product_discount'];
    _productImage = json['Product_image'];
    _productPrice = json['Product_price'];
    _productVariation = json['Product_variation'];
    _productTotal = json['Product_total'];
  }
  String? _productQuantity;
  String? _productName;
  String? _productDiscount;
  String? _productImage;
  String? _productPrice;
  dynamic _productVariation;
  num? _productTotal;
OrderProductData copyWith({  String? productQuantity,
  String? productName,
  String? productDiscount,
  String? productImage,
  String? productPrice,
  dynamic productVariation,
  num? productTotal,
}) => OrderProductData(  productQuantity: productQuantity ?? _productQuantity,
  productName: productName ?? _productName,
  productDiscount: productDiscount ?? _productDiscount,
  productImage: productImage ?? _productImage,
  productPrice: productPrice ?? _productPrice,
  productVariation: productVariation ?? _productVariation,
  productTotal: productTotal ?? _productTotal,
);
  String? get productQuantity => _productQuantity;
  String? get productName => _productName;
  String? get productDiscount => _productDiscount;
  String? get productImage => _productImage;
  String? get productPrice => _productPrice;
  dynamic get productVariation => _productVariation;
  num? get productTotal => _productTotal;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Product_quantity'] = _productQuantity;
    map['Product_name'] = _productName;
    map['Product_discount'] = _productDiscount;
    map['Product_image'] = _productImage;
    map['Product_price'] = _productPrice;
    map['Product_variation'] = _productVariation;
    map['Product_total'] = _productTotal;
    return map;
  }

}