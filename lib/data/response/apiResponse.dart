import 'package:mvvm/data/response/status.dart';

class APIResponse<T> {
  STATUS? status;
  T? data;
  String? message;
  APIResponse(this.status, this.data, this.message);
  APIResponse.loading() : status = STATUS.LOADING;
  APIResponse.completed() : status = STATUS.COMPLETED;
  APIResponse.error() : status = STATUS.ERROR;
  @override
  String toString() {
    return 'Status:$status\n Message:$message\ndata:$data';
  }
}
