import '../../../core/class/crud.dart';
import '../../../likeapi.dart';

class CatProServicesData {
  Crud crud;
  CatProServicesData(this.crud);
  postData(String idSer) async {
    var response = await crud.postData(AppLink.catSerPage, {
      "cat_services": idSer,
    });
    return response.fold((l) => l, (r) => r);
  }
}
class GlusProServicesData {
  Crud crud;
  GlusProServicesData(this.crud);
  postData(String idSer) async {
    var response = await crud.postData(AppLink.glusSerPage, {
      "glus_ser": idSer,
    });
    return response.fold((l) => l, (r) => r);
  }
}
