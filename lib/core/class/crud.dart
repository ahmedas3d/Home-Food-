import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:home_food/core/class/statusrequest.dart';
import 'package:path/path.dart';

import '../functions/checkinterner.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postData(String linkurl, Map data) async {
      try{
        if (await checkInternet()) {
          var response = await http.post(Uri.parse(linkurl), body: data);
          print(response.statusCode);
          if (response.statusCode == 200 || response.statusCode == 201) {
            Map responsebody = jsonDecode(response.body);
            print(responsebody);
            return Right(responsebody);
          } else {
            return const Left(StatusRequest.serverFailure);
          }
        } else {
          return const Left(StatusRequest.offlineFailure);
        }
      }catch(_){
        return const Left(StatusRequest.serverFailure);
      }
  }


  postRequestWithImage(String url, Map data, File file, String filename) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));
    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var multipartFile = http.MultipartFile(filename, stream, length, filename: basename(file.path));
    request.files.add(multipartFile);
    data.forEach((key, value) {
      request.fields[key] = value;
    });
    var myRequest = await request.send();

    var response = await http.Response.fromStream(myRequest);
    if (myRequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      log("Error${myRequest.statusCode}");
    }
  }
}
