
import '../../model/usermodel.dart';

abstract class RegisterStates {}

class RegisterInitialStates extends RegisterStates {}

class RegisterChangeDrop extends RegisterStates {}
class ShopRegisterLoadState extends RegisterStates{}
class ShopRegisterSuccessState extends RegisterStates{
  final UserData loginModel;

  ShopRegisterSuccessState(this.loginModel);
}
class ShopRegisterErrorState extends RegisterStates{
  final String Error;

  ShopRegisterErrorState(this.Error);
}
class ShopChangePasswordState extends RegisterStates{}


