import 'package:chef_kart/utils/common_import.dart';
import 'package:http/http.dart' as http;

class SelectDishController extends GetxController{

  Simple? selectedDishType;
  bool isLoading = false;

  DishesModel? dishesModel;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedDishType = AppConst.dishTypeList.first;
    super.onInit();
    fetchDishes();
  }

  loading(bool value){
    isLoading = value;
    update();
  }

  onChangeDishType(Simple value){
    selectedDishType = value;
    update(['dishType']);
  }

  fetchDishes() async{
    loading(true);
    try{
      final response = await http.get(Uri.parse(AppApi.dishes));
      debugPrint('request ${response.request}');
      debugPrint('request ${response.body}');
      if (response.statusCode == 200) {
        dishesModel = dishesModelFromJson(response.body);
        loading(false);
      }else{
        CommonMethod.showToast('Something went to wrong');
        loading(false);
      }
    }catch(e){
      loading(false);
      debugPrint('error is $e');
    }
  }

}