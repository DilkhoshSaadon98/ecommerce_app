import 'package:dartz/dartz.dart';
import 'package:econmerac_app/core/class/status_request.dart';
import 'package:econmerac_app/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Curd {
  getrequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        if (responsebody.containsKey('error')) {
          // Display the error message to the user
          var errorMessage = responsebody['error'];
          print(errorMessage);
        }
        return responsebody;
      }
    } catch (e) {
      print("Eroor catch $e");
    }
  }

  Future<Either<StatusRequest, Map>> postrequest(String url, Map data) async {
    try {
      if (await checkInternet()) {
        var response = await http.post(Uri.parse(url), body: data);
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          return Right(responsebody);
        } else {
          return const Left(StatusRequest.serverFaliure);
        }
      } else {
        return const Left(StatusRequest.offline);
      }
    } catch (_) {
      print('catch ------------------------');
      return const Left(StatusRequest.serverExeption);
    }
  }
}
