import 'package:mvvm/data/network/networkApi.dart';
import 'package:mvvm/resources/appURL.dart';

class AuthRepository {
  final NetworkAPI _networkAPI = NetworkAPI();
  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response = await _networkAPI.POSTRequest(APPURL.loginURL, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
