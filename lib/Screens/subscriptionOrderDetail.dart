import 'dart:convert';

import 'package:deliveryboy_multivendor/Helper/Session.dart';
import 'package:deliveryboy_multivendor/Helper/color.dart';
import 'package:deliveryboy_multivendor/Helper/string.dart';
import 'package:deliveryboy_multivendor/Model/New%20Model/subscriptionDetailModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Helper/constant.dart';
import '../Model/New Model/NewModel.dart';

class SubscriptionOrderDetail extends StatefulWidget {
  final String? orderId;
  SubscriptionOrderDetail({this.orderId});

  @override
  State<SubscriptionOrderDetail> createState() => _SubscriptionOrderDetailState();
}

class _SubscriptionOrderDetailState extends State<SubscriptionOrderDetail> {


  SubscriptionDetailModel? subscriptionDetailModel;
  getOrderDetail()async{
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=c0519024f58ff8f30902d4a79d4d4b54'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}sub_pending_order.php'));
    request.body = json.encode({
      "rid": "${CUR_USERID}",
      "order_id": "${widget.orderId}"
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResult = await response.stream.bytesToString();
      final jsonResponse = SubscriptionDetailModel.fromJson(json.decode(finalResult));
      setState(() {
        subscriptionDetailModel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  NewModel? newModel;
  getProductDetail(String id)async{
    var headers = {
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}d_sub_itemlist.php'));
    request.body = json.encode({
      "uid": "$CUR_USERID",
      "order_id": "${widget.orderId}",
      "product_id": "${id}"
    });
    print("parameter are here ${request.body}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = NewModel.fromJson(json.decode(finalResponse));
      setState(() {
        newModel = jsonResponse;
      });
      print("ssssssss ${newModel!.orderProductList}");
      // return OrderProductList.fromJson(json.decode(finalResponse));
    }
    else {
      print(response.reasonPhrase);
    }
  }

  List<String> selectedDates = [];

    String? totalDelivery;

  apply(id,sid)async{
    print("pppppppppppp ${selectedDates[0]}");
    var headers = {
      'Content-Type': 'application/json',
      'Cookie': 'PHPSESSID=c0519024f58ff8f30902d4a79d4d4b54'
    };
    var request = http.Request('POST', Uri.parse('${baseUrl}sub_order_status_change.php'));
    request.body = json.encode({
      "oid": "${subscriptionDetailModel!.orderData!.orderId}",
      "status": "date_complete",
      "date_com": "${selectedDates[0]}",
      "rid": "${CUR_USERID}",
      "porderid": "${sid}",
      "completedates": "${selectedDates[0]}"
    });
    print("requst body ${request.body}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      getProductDetail(id);
    }
    else {
      print(response.reasonPhrase);
    }

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(milliseconds: 200),(){
      return getOrderDetail();
    });
  }
  String currentIndex = "0";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(ORDER_DETAIL, context),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 12),
        child: ListView(
          children: [
            Text("Product List",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 16),),
            SizedBox(height: 10,),
            subscriptionDetailModel == null ? Center(child: CircularProgressIndicator(),) : Container(
              height: 120,

              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: ScrollPhysics(),
                  itemCount: subscriptionDetailModel!.orderData!.orderProductData!.length,
                  itemBuilder: (c,i){
                    return InkWell(
                      onTap: ()async{
                        setState(() {
                          totalDelivery = subscriptionDetailModel!.orderData!.orderProductData![i].totaldelivery.toString();
                         // selectedId = subscriptionDetailModel!.orderProductList!.orderProductData![i].subscribeId.toString();
                          currentIndex =  subscriptionDetailModel!.orderData!.orderProductData![i].productId.toString();
                        });
                        await  getProductDetail(subscriptionDetailModel!.orderData!.orderProductData![i].productId.toString());
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: currentIndex ==  subscriptionDetailModel!.orderData!.orderProductData![i].productId.toString() ? primary : Colors.transparent)
                        ),
                        margin: EdgeInsets.only(right: 15),
                        child: Column(
                          children: [
                            Container(
                              height:80,
                              width: 100,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network("${imageUrl}${subscriptionDetailModel!.orderData!.orderProductData![i].productImage}",fit: BoxFit.fill,)),
                            ),
                            SizedBox(height: 8,),
                            Text("${subscriptionDetailModel!.orderData!.orderProductData![i].productName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),maxLines: 1,)
                          ],
                        ),
                      ),
                    );
                  }),
            ),

            SizedBox(height: 20,),

            newModel == null ? SizedBox.shrink() : Text("Delivery Dates",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 15),),
            SizedBox(height: 15,),
            newModel == null ? SizedBox.shrink() : Container(
                height: 60,
                child: newModel != null ?
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: newModel!.orderProductList!.orderProductData![0].totaldates!.length,
                    scrollDirection: Axis.horizontal,
                    physics: ScrollPhysics(),
                    itemBuilder: (c,i){
                      return InkWell(
                        onTap: (){
                          if(selectedDates.contains(newModel!.orderProductList!.orderProductData![0].totaldates![i].date.toString())){

                            setState(() {
                              selectedDates.remove(newModel!.orderProductList!.orderProductData![0].totaldates![i].date.toString());
                            });
                          }
                          else{
                            setState(() {
                              selectedDates.add(newModel!.orderProductList!.orderProductData![0].totaldates![i].date.toString());
                              getProductDetail(newModel!.orderProductList!.orderProductData![0].productId.toString());
                            });
                            apply(newModel!.orderProductList!.orderProductData![0].productId.toString(),newModel!.orderProductList!.orderProductData![0].subscribeId.toString());
                          }
                          // setState(() {
                          //   selectedDate = newModel!.orderProductList!.orderProductData![0].totaldates![i].date.toString();
                          // });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 2),
                          margin: EdgeInsets.only(right: 10),
                          height: 45,
                          width: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: newModel!.orderProductList!.orderProductData![0].totaldates![i].isComplete == 1  ? primary : Colors.grey,
                                  width: 2
                              ),
                              borderRadius: BorderRadius.circular(9)
                          ),
                          child: Text("${newModel!.orderProductList!.orderProductData![0].totaldates![i].formatDate}",style: TextStyle(color: newModel!.orderProductList!.orderProductData![0].totaldates![i].isComplete == 1  ? primary : Colors.black,fontWeight: FontWeight.w500),),
                        ),
                      );
                    }) : Center(child: CircularProgressIndicator(),)
            ),

            SizedBox(height: 20,),

            newModel == null ? SizedBox.shrink() :   Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: primary)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Product Info",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                  Divider(),
                  Column(
                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Price",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("\u{20B9} ${newModel!.orderProductList!.orderProductData![0].productPrice}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Quantity",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("${newModel!.orderProductList!.orderProductData![0].productQuantity}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Start Date",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("${newModel!.orderProductList!.orderProductData![0].startdate}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Time Slot",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("${newModel!.orderProductList!.orderProductData![0].deliveryTimeslot}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Delivery",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("${newModel!.orderProductList!.orderProductData![0].totaldelivery}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 20,),
            newModel == null ? SizedBox.shrink() :  Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: primary)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Order Info",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                  Divider(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("ID # ${subscriptionDetailModel!.orderData!.orderId}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("")
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Payment Method",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("${subscriptionDetailModel!.orderData!.pMethodName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sub Total",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("\u{20B9} ${subscriptionDetailModel!.orderData!.orderSubTotal}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Discount",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("\u{20B9} ${subscriptionDetailModel!.orderData!.couponAmount}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text("Delivery Charge",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                      //     Text("\u{20B9} ${subscriptionDetailModel!.orderProductList!.deliveryCharge}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                      //   ],
                      // ),
                      // SizedBox(
                      //   height: 8,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("\u{20B9} ${subscriptionDetailModel!.orderData!.orderTotal}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),

                    ],
                  )
                ],
              ),
            ),

            SizedBox(height: 20,),
            newModel == null ? SizedBox.shrink() :  Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: primary)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Shipping Info",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w600),),
                  Divider(),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Name",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("${subscriptionDetailModel!.orderData!.customerName}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500))
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Mobile",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),),
                          Text("${subscriptionDetailModel!.orderData!.customerMobile}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text("Address",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),)),
                          Expanded(child: Text("${subscriptionDetailModel!.orderData!.customerAddress}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500),))
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
