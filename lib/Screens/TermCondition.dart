import 'dart:convert';

import 'package:deliveryboy_multivendor/Helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Helper/color.dart';

class TermCondition extends StatefulWidget {
  const TermCondition({Key? key}) : super(key: key);

  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {


  var termConditionData;

  getTermsCondition()async{
    var headers = {
      'Cookie': 'PHPSESSID=ff06401d66704b3e53ac75084c1a6632'
    };
    var request = http.Request('GET', Uri.parse('${baseUrl}d_terms.php'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print("final response here ${jsonResponse}");
      setState(() {
        termConditionData = jsonResponse['data'];
      });
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
      return getTermsCondition();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.all(10),

            child: InkWell(
              borderRadius: BorderRadius.circular(4),
              onTap: () => Navigator.of(context).pop(),
              child: Center(
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: primary,
                  size: 30,
                ),
              ),
            ),
          );
        }),
        title: Text(
          'Terms & Condition',
          style: TextStyle(
            color: primary,
          ),
        ),

        backgroundColor: white,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 14,vertical: 14),
        child: termConditionData == null || termConditionData == "" ? Center(child: CircularProgressIndicator(color: primary,),) : Text("${termConditionData}",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 15),),
      ),
    );
  }
}
