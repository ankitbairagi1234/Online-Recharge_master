/// order_data : {"order_id":"27","p_method_name":"Cash On Delivery","customer_address":"151,Ratna Lok Colony,Indore,Indore,Madhya Pradesh,452010,India","customer_name":"Shivam Kanathe ","customer_mobile":"9090909090","Delivery_charge":"0","Coupon_Amount":"0","Wallet_Amount":"0","Order_Total":"800","Order_SubTotal":"800","Order_Transaction_id":"1","Additional_Note":"tes","Order_Status":"Processing","Order_Product_Data":[{"product_order_id":"29","product_id":"68","Product_quantity":"1","Product_name":"Milk","Product_discount":"0","Product_image":"product/1676287425.png","Product_price":"100","Product_variation":null,"Delivery_Timeslot":"0","Product_total":100,"totaldelivery":"8","startdate":"15-02-2023","totaldates":[{"date":"15-02-2023","is_complete":0,"format_date":"Wed 15"},{"date":"16-02-2023","is_complete":0,"format_date":"Thu 16"},{"date":"17-02-2023","is_complete":0,"format_date":"Fri 17"},{"date":"18-02-2023","is_complete":0,"format_date":"Sat 18"},{"date":"19-02-2023","is_complete":0,"format_date":"Sun 19"},{"date":"20-02-2023","is_complete":0,"format_date":"Mon 20"},{"date":"21-02-2023","is_complete":0,"format_date":"Tue 21"},{"date":"22-02-2023","is_complete":0,"format_date":"Wed 22"},{"date":"23-02-2023","is_complete":0,"format_date":"Thu 23"}]}]}
/// ResponseCode : "200"
/// Result : "true"
/// ResponseMsg : "Subscribe Order Get successfully!"

class SubscriptionDetailModel {
  SubscriptionDetailModel({
      OrderData? orderData, 
      String? responseCode, 
      String? result, 
      String? responseMsg,}){
    _orderData = orderData;
    _responseCode = responseCode;
    _result = result;
    _responseMsg = responseMsg;
}

  SubscriptionDetailModel.fromJson(dynamic json) {
    _orderData = json['order_data'] != null ? OrderData.fromJson(json['order_data']) : null;
    _responseCode = json['ResponseCode'];
    _result = json['Result'];
    _responseMsg = json['ResponseMsg'];
  }
  OrderData? _orderData;
  String? _responseCode;
  String? _result;
  String? _responseMsg;
SubscriptionDetailModel copyWith({  OrderData? orderData,
  String? responseCode,
  String? result,
  String? responseMsg,
}) => SubscriptionDetailModel(  orderData: orderData ?? _orderData,
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

/// order_id : "27"
/// p_method_name : "Cash On Delivery"
/// customer_address : "151,Ratna Lok Colony,Indore,Indore,Madhya Pradesh,452010,India"
/// customer_name : "Shivam Kanathe "
/// customer_mobile : "9090909090"
/// Delivery_charge : "0"
/// Coupon_Amount : "0"
/// Wallet_Amount : "0"
/// Order_Total : "800"
/// Order_SubTotal : "800"
/// Order_Transaction_id : "1"
/// Additional_Note : "tes"
/// Order_Status : "Processing"
/// Order_Product_Data : [{"product_order_id":"29","product_id":"68","Product_quantity":"1","Product_name":"Milk","Product_discount":"0","Product_image":"product/1676287425.png","Product_price":"100","Product_variation":null,"Delivery_Timeslot":"0","Product_total":100,"totaldelivery":"8","startdate":"15-02-2023","totaldates":[{"date":"15-02-2023","is_complete":0,"format_date":"Wed 15"},{"date":"16-02-2023","is_complete":0,"format_date":"Thu 16"},{"date":"17-02-2023","is_complete":0,"format_date":"Fri 17"},{"date":"18-02-2023","is_complete":0,"format_date":"Sat 18"},{"date":"19-02-2023","is_complete":0,"format_date":"Sun 19"},{"date":"20-02-2023","is_complete":0,"format_date":"Mon 20"},{"date":"21-02-2023","is_complete":0,"format_date":"Tue 21"},{"date":"22-02-2023","is_complete":0,"format_date":"Wed 22"},{"date":"23-02-2023","is_complete":0,"format_date":"Thu 23"}]}]

class OrderData {
  OrderData({
      String? orderId, 
      String? pMethodName, 
      String? customerAddress, 
      String? customerName, 
      String? customerMobile, 
      String? deliveryCharge, 
      String? couponAmount, 
      String? walletAmount, 
      String? orderTotal, 
      String? orderSubTotal, 
      String? orderTransactionId, 
      String? additionalNote, 
      String? orderStatus, 
      List<OrderProductData>? orderProductData,}){
    _orderId = orderId;
    _pMethodName = pMethodName;
    _customerAddress = customerAddress;
    _customerName = customerName;
    _customerMobile = customerMobile;
    _deliveryCharge = deliveryCharge;
    _couponAmount = couponAmount;
    _walletAmount = walletAmount;
    _orderTotal = orderTotal;
    _orderSubTotal = orderSubTotal;
    _orderTransactionId = orderTransactionId;
    _additionalNote = additionalNote;
    _orderStatus = orderStatus;
    _orderProductData = orderProductData;
}

  OrderData.fromJson(dynamic json) {
    _orderId = json['order_id'];
    _pMethodName = json['p_method_name'];
    _customerAddress = json['customer_address'];
    _customerName = json['customer_name'];
    _customerMobile = json['customer_mobile'];
    _deliveryCharge = json['Delivery_charge'];
    _couponAmount = json['Coupon_Amount'];
    _walletAmount = json['Wallet_Amount'];
    _orderTotal = json['Order_Total'];
    _orderSubTotal = json['Order_SubTotal'];
    _orderTransactionId = json['Order_Transaction_id'];
    _additionalNote = json['Additional_Note'];
    _orderStatus = json['Order_Status'];
    if (json['Order_Product_Data'] != null) {
      _orderProductData = [];
      json['Order_Product_Data'].forEach((v) {
        _orderProductData?.add(OrderProductData.fromJson(v));
      });
    }
  }
  String? _orderId;
  String? _pMethodName;
  String? _customerAddress;
  String? _customerName;
  String? _customerMobile;
  String? _deliveryCharge;
  String? _couponAmount;
  String? _walletAmount;
  String? _orderTotal;
  String? _orderSubTotal;
  String? _orderTransactionId;
  String? _additionalNote;
  String? _orderStatus;
  List<OrderProductData>? _orderProductData;
OrderData copyWith({  String? orderId,
  String? pMethodName,
  String? customerAddress,
  String? customerName,
  String? customerMobile,
  String? deliveryCharge,
  String? couponAmount,
  String? walletAmount,
  String? orderTotal,
  String? orderSubTotal,
  String? orderTransactionId,
  String? additionalNote,
  String? orderStatus,
  List<OrderProductData>? orderProductData,
}) => OrderData(  orderId: orderId ?? _orderId,
  pMethodName: pMethodName ?? _pMethodName,
  customerAddress: customerAddress ?? _customerAddress,
  customerName: customerName ?? _customerName,
  customerMobile: customerMobile ?? _customerMobile,
  deliveryCharge: deliveryCharge ?? _deliveryCharge,
  couponAmount: couponAmount ?? _couponAmount,
  walletAmount: walletAmount ?? _walletAmount,
  orderTotal: orderTotal ?? _orderTotal,
  orderSubTotal: orderSubTotal ?? _orderSubTotal,
  orderTransactionId: orderTransactionId ?? _orderTransactionId,
  additionalNote: additionalNote ?? _additionalNote,
  orderStatus: orderStatus ?? _orderStatus,
  orderProductData: orderProductData ?? _orderProductData,
);
  String? get orderId => _orderId;
  String? get pMethodName => _pMethodName;
  String? get customerAddress => _customerAddress;
  String? get customerName => _customerName;
  String? get customerMobile => _customerMobile;
  String? get deliveryCharge => _deliveryCharge;
  String? get couponAmount => _couponAmount;
  String? get walletAmount => _walletAmount;
  String? get orderTotal => _orderTotal;
  String? get orderSubTotal => _orderSubTotal;
  String? get orderTransactionId => _orderTransactionId;
  String? get additionalNote => _additionalNote;
  String? get orderStatus => _orderStatus;
  List<OrderProductData>? get orderProductData => _orderProductData;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['order_id'] = _orderId;
    map['p_method_name'] = _pMethodName;
    map['customer_address'] = _customerAddress;
    map['customer_name'] = _customerName;
    map['customer_mobile'] = _customerMobile;
    map['Delivery_charge'] = _deliveryCharge;
    map['Coupon_Amount'] = _couponAmount;
    map['Wallet_Amount'] = _walletAmount;
    map['Order_Total'] = _orderTotal;
    map['Order_SubTotal'] = _orderSubTotal;
    map['Order_Transaction_id'] = _orderTransactionId;
    map['Additional_Note'] = _additionalNote;
    map['Order_Status'] = _orderStatus;
    if (_orderProductData != null) {
      map['Order_Product_Data'] = _orderProductData?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_order_id : "29"
/// product_id : "68"
/// Product_quantity : "1"
/// Product_name : "Milk"
/// Product_discount : "0"
/// Product_image : "product/1676287425.png"
/// Product_price : "100"
/// Product_variation : null
/// Delivery_Timeslot : "0"
/// Product_total : 100
/// totaldelivery : "8"
/// startdate : "15-02-2023"
/// totaldates : [{"date":"15-02-2023","is_complete":0,"format_date":"Wed 15"},{"date":"16-02-2023","is_complete":0,"format_date":"Thu 16"},{"date":"17-02-2023","is_complete":0,"format_date":"Fri 17"},{"date":"18-02-2023","is_complete":0,"format_date":"Sat 18"},{"date":"19-02-2023","is_complete":0,"format_date":"Sun 19"},{"date":"20-02-2023","is_complete":0,"format_date":"Mon 20"},{"date":"21-02-2023","is_complete":0,"format_date":"Tue 21"},{"date":"22-02-2023","is_complete":0,"format_date":"Wed 22"},{"date":"23-02-2023","is_complete":0,"format_date":"Thu 23"}]

class OrderProductData {
  OrderProductData({
      String? productOrderId, 
      String? productId, 
      String? productQuantity, 
      String? productName, 
      String? productDiscount, 
      String? productImage, 
      String? productPrice, 
      dynamic productVariation, 
      String? deliveryTimeslot, 
      num? productTotal, 
      String? totaldelivery, 
      String? startdate, 
      List<Totaldates>? totaldates,}){
    _productOrderId = productOrderId;
    _productId = productId;
    _productQuantity = productQuantity;
    _productName = productName;
    _productDiscount = productDiscount;
    _productImage = productImage;
    _productPrice = productPrice;
    _productVariation = productVariation;
    _deliveryTimeslot = deliveryTimeslot;
    _productTotal = productTotal;
    _totaldelivery = totaldelivery;
    _startdate = startdate;
    _totaldates = totaldates;
}

  OrderProductData.fromJson(dynamic json) {
    _productOrderId = json['product_order_id'];
    _productId = json['product_id'];
    _productQuantity = json['Product_quantity'];
    _productName = json['Product_name'];
    _productDiscount = json['Product_discount'];
    _productImage = json['Product_image'];
    _productPrice = json['Product_price'];
    _productVariation = json['Product_variation'];
    _deliveryTimeslot = json['Delivery_Timeslot'];
    _productTotal = json['Product_total'];
    _totaldelivery = json['totaldelivery'];
    _startdate = json['startdate'];
    if (json['totaldates'] != null) {
      _totaldates = [];
      json['totaldates'].forEach((v) {
        _totaldates?.add(Totaldates.fromJson(v));
      });
    }
  }
  String? _productOrderId;
  String? _productId;
  String? _productQuantity;
  String? _productName;
  String? _productDiscount;
  String? _productImage;
  String? _productPrice;
  dynamic _productVariation;
  String? _deliveryTimeslot;
  num? _productTotal;
  String? _totaldelivery;
  String? _startdate;
  List<Totaldates>? _totaldates;
OrderProductData copyWith({  String? productOrderId,
  String? productId,
  String? productQuantity,
  String? productName,
  String? productDiscount,
  String? productImage,
  String? productPrice,
  dynamic productVariation,
  String? deliveryTimeslot,
  num? productTotal,
  String? totaldelivery,
  String? startdate,
  List<Totaldates>? totaldates,
}) => OrderProductData(  productOrderId: productOrderId ?? _productOrderId,
  productId: productId ?? _productId,
  productQuantity: productQuantity ?? _productQuantity,
  productName: productName ?? _productName,
  productDiscount: productDiscount ?? _productDiscount,
  productImage: productImage ?? _productImage,
  productPrice: productPrice ?? _productPrice,
  productVariation: productVariation ?? _productVariation,
  deliveryTimeslot: deliveryTimeslot ?? _deliveryTimeslot,
  productTotal: productTotal ?? _productTotal,
  totaldelivery: totaldelivery ?? _totaldelivery,
  startdate: startdate ?? _startdate,
  totaldates: totaldates ?? _totaldates,
);
  String? get productOrderId => _productOrderId;
  String? get productId => _productId;
  String? get productQuantity => _productQuantity;
  String? get productName => _productName;
  String? get productDiscount => _productDiscount;
  String? get productImage => _productImage;
  String? get productPrice => _productPrice;
  dynamic get productVariation => _productVariation;
  String? get deliveryTimeslot => _deliveryTimeslot;
  num? get productTotal => _productTotal;
  String? get totaldelivery => _totaldelivery;
  String? get startdate => _startdate;
  List<Totaldates>? get totaldates => _totaldates;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_order_id'] = _productOrderId;
    map['product_id'] = _productId;
    map['Product_quantity'] = _productQuantity;
    map['Product_name'] = _productName;
    map['Product_discount'] = _productDiscount;
    map['Product_image'] = _productImage;
    map['Product_price'] = _productPrice;
    map['Product_variation'] = _productVariation;
    map['Delivery_Timeslot'] = _deliveryTimeslot;
    map['Product_total'] = _productTotal;
    map['totaldelivery'] = _totaldelivery;
    map['startdate'] = _startdate;
    if (_totaldates != null) {
      map['totaldates'] = _totaldates?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// date : "15-02-2023"
/// is_complete : 0
/// format_date : "Wed 15"

class Totaldates {
  Totaldates({
      String? date, 
      num? isComplete, 
      String? formatDate,}){
    _date = date;
    _isComplete = isComplete;
    _formatDate = formatDate;
}

  Totaldates.fromJson(dynamic json) {
    _date = json['date'];
    _isComplete = json['is_complete'];
    _formatDate = json['format_date'];
  }
  String? _date;
  num? _isComplete;
  String? _formatDate;
Totaldates copyWith({  String? date,
  num? isComplete,
  String? formatDate,
}) => Totaldates(  date: date ?? _date,
  isComplete: isComplete ?? _isComplete,
  formatDate: formatDate ?? _formatDate,
);
  String? get date => _date;
  num? get isComplete => _isComplete;
  String? get formatDate => _formatDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['is_complete'] = _isComplete;
    map['format_date'] = _formatDate;
    return map;
  }

}