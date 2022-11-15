import 'package:http/http.dart';

class RestAPI{
  final url = 'http://api.olhovivo.sptrans.com.br/v2.1';
  final apiToken = 'f6224b54281fc9884a6c2024c015eb83da3280f634c8ed175ed068d0798e38cb';

  Future<bool> login() async {
    final response = await post(
      '$url/Login/Autenticar?token=$apiToken'
    );
    return response.body == 'true';
  }
}