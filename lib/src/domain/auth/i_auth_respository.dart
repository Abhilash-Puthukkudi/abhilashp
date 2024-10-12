import 'package:machine_test/src/domain/core/models/pm_models/pm_login_model/pm_login_model.dart';
import 'package:machine_test/src/domain/core/models/response_models/login_model/login_model.dart';

abstract class IAuthRespository {
  Future<LoginModel> login({required PmLoginModel loginModel});
}
