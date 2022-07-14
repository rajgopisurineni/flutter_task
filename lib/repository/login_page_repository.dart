import 'package:flutter_task/services/base_service.dart';
import 'package:flutter_task/services/urls.dart';
import 'package:flutter_task/utils/models.dart';

class LoginPageRepository extends BaseService {

  Future<bool> loginResponse(Map body,) async {
    var responseData = false;

    var response = await makeRequest(Urls.loginUrl, body: body, method: RequestType.POST);

    if (response != null && response["result"] != null) {
      responseData = true;
    }

    return responseData;
  }
}