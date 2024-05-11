import '../../../../core/class/crud.dart';
import '../../../../likeapi.dart';


class SignUpData {
  Crud crud;
  SignUpData(this.crud);
  postData(String username, String password, String email, String phone , String userApprove) async {
    var response = await crud.postData(AppLink.signUp, {
      "username": username,
      "password": password,
      "email": email,
      "phone": phone,
      "admin": userApprove
    });
    return response.fold((l) => l, (r) => r);
  }
}
