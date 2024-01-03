abstract class BaseAPI {
  Future<dynamic> GETRequest(String url);
  Future<dynamic> POSTRequest(String url, dynamic data);
}
