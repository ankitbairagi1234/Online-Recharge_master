/// OrderHistory : [{"id":"13","total_product":1,"p_method_name":"Razorpay","status":"Pending","date":null,"customer_name":"rohit","total":"1"}]
/// ResponseCode : "200"
/// Result : "true"
/// ResponseMsg : "Order History  Get Successfully!!!"

class OrderModel {
  OrderModel({
      List<OrderHistory>? orderHistory, 
      String? responseCode, 
      String? result, 
      String? responseMsg,}){
    _orderHistory = orderHistory;
    _responseCode = responseCode;
    _result = result;
    _responseMsg = responseMsg;
}

  OrderModel.fromJson(dynamic json) {
    if (json['OrderHistory'] != null) {
      _orderHistory = [];
      json['OrderHistory'].forEach((v) {
        _orderHistory?.add(OrderHistory.fromJson(v));
      });
    }
    _responseCode = json['ResponseCode'];
    _result = json['Result'];
    _responseMsg = json['ResponseMsg'];
  }
  List<OrderHistory>? _orderHistory;
  String? _responseCode;
  String? _result;
  String? _responseMsg;
OrderModel copyWith({  List<OrderHistory>? orderHistory,
  String? responseCode,
  String? result,
  String? responseMsg,
}) => OrderModel(  orderHistory: orderHistory ?? _orderHistory,
  responseCode: responseCode ?? _responseCode,
  result: result ?? _result,
  responseMsg: responseMsg ?? _responseMsg,
);
  List<OrderHistory>? get orderHistory => _orderHistory;
  String? get responseCode => _responseCode;
  String? get result => _result;
  String? get responseMsg => _responseMsg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_orderHistory != null) {
      map['OrderHistory'] = _orderHistory?.map((v) => v.toJson()).toList();
    }
    map['ResponseCode'] = _responseCode;
    map['Result'] = _result;
    map['ResponseMsg'] = _responseMsg;
    return map;
  }

}

/// id : "13"
/// total_product : 1
/// p_method_name : "Razorpay"
/// status : "Pending"
/// date : null
/// customer_name : "rohit"
/// total : "1"

class OrderHistory {
  OrderHistory({
      String? id, 
      num? totalProduct, 
      String? pMethodName, 
      String? status, 
      dynamic date, 
      String? customerName, 
      String? total,}){
    _id = id;
    _totalProduct = totalProduct;
    _pMethodName = pMethodName;
    _status = status;
    _date = date;
    _customerName = customerName;
    _total = total;
}

  OrderHistory.fromJson(dynamic json) {
    _id = json['id'];
    _totalProduct = json['total_product'];
    _pMethodName = json['p_method_name'];
    _status = json['status'];
    _date = json['date'];
    _customerName = json['customer_name'];
    _total = json['total'];
  }
  String? _id;
  num? _totalProduct;
  String? _pMethodName;
  String? _status;
  dynamic _date;
  String? _customerName;
  String? _total;
OrderHistory copyWith({  String? id,
  num? totalProduct,
  String? pMethodName,
  String? status,
  dynamic date,
  String? customerName,
  String? total,
}) => OrderHistory(  id: id ?? _id,
  totalProduct: totalProduct ?? _totalProduct,
  pMethodName: pMethodName ?? _pMethodName,
  status: status ?? _status,
  date: date ?? _date,
  customerName: customerName ?? _customerName,
  total: total ?? _total,
);
  String? get id => _id;
  num? get totalProduct => _totalProduct;
  String? get pMethodName => _pMethodName;
  String? get status => _status;
  dynamic get date => _date;
  String? get customerName => _customerName;
  String? get total => _total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['total_product'] = _totalProduct;
    map['p_method_name'] = _pMethodName;
    map['status'] = _status;
    map['date'] = _date;
    map['customer_name'] = _customerName;
    map['total'] = _total;
    return map;
  }

}