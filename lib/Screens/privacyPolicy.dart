import 'dart:convert';

import 'package:deliveryboy_multivendor/Helper/constant.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Helper/color.dart';

class NewPrivacyPolicy extends StatefulWidget {
  const NewPrivacyPolicy({Key? key}) : super(key: key);

  @override
  State<NewPrivacyPolicy> createState() => _NewPrivacyPolicyState();
}

class _NewPrivacyPolicyState extends State<NewPrivacyPolicy> {

  var privacyData;
  getPrivacy()async{
    var headers = {
      'Cookie': 'PHPSESSID=ff06401d66704b3e53ac75084c1a6632'
    };
    var request = http.Request('GET', Uri.parse('${baseUrl}d_privacy.php'));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = json.decode(finalResponse);
      print("final json response here ${jsonResponse}");
      setState(() {
        privacyData = jsonResponse['data'];
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
      return getPrivacy();
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
          'Privacy policy',
          style: TextStyle(
            color: primary,
          ),
        ),

        backgroundColor: white,
      ),
      body: Container(
        padding: EdgeInsets.all(14),
        child: privacyData == null || privacyData == "" ? Center(child: CircularProgressIndicator(),) : Text("${privacyData}",style: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.w500),),
      ),
    );
  }
}
