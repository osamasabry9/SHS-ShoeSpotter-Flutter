import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  Future<Response> post({
    required String url,
    required Map<String, dynamic> body,
    required String token,
    Map<String, String>? header,
    String contentType = 'application/json',
  }) async {
    var response = await dio.post(
      url,
      data: body,
      options: Options(
        contentType: contentType,
        headers: header ??
            {
              'Authorization': 'Bearer $token',
            },
      ),
    );
    return response;
  }
}
