
import 'package:get/get.dart';


class VisibilityController extends GetxController {



  RxBool _isPasswordVisible = true.obs;
  RxBool get PasswordVisible => _isPasswordVisible;

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }
}

