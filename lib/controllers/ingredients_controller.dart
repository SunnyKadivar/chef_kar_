import 'package:chef_kart/utils/common_import.dart';
import 'package:http/http.dart' as http;

class IngredientsController extends GetxController{

  final int dishId;

  IngredientsController(this.dishId);

  bool isLoading = false;
  IngredientsModel? ingredientsModel;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchIngredients();
  }

  loading(bool value){
    isLoading = value;
    update();
  }

  fetchIngredients() async{
    loading(true);
    try{
      final response = await http.get(Uri.parse('${AppApi.dishes}$dishId'));
      debugPrint('request ${response.request}');
      debugPrint('request ${response.body}');
      if (response.statusCode == 200) {
        ingredientsModel = ingredientsModelFromJson(response.body);
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