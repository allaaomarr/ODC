import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class termsandconditions extends StatefulWidget {
  const termsandconditions({Key? key}) : super(key: key);

  @override
  State<termsandconditions> createState() => _termsandconditionsState();
}

class _termsandconditionsState extends State<termsandconditions> {
  static late Dio dio;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(title:  Text("Support",style: TextStyle(color: Colors.black),),centerTitle:  true,backgroundColor: Colors.white,),
body: Padding(
  padding: const EdgeInsets.all(20),
  child:   Text("Terms and conditions are the vital details that businesses put in place to ensure that they protect their rights. However, you should also ensure that they are legal, enforceable, and serve their intended purpose. ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
),
    );
  }
  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onReceiveProgress,
    String? token,
  }) async {


    try
    {
      dio.options.headers =
      {
        'Authorization': 'Bearer ${token ?? ''}',
      };
      final Response response = await dio.get(
        'terms',
        queryParameters: queryParameters,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    }

    catch (e)
    {
      rethrow;
    }
  }
}
