import 'dart:convert';

import 'package:api_getx_state_management/home_service.dart';
import 'package:api_getx_state_management/product_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //HomeService homeService = HomeService();
  late HomeService homeService;

  List<ProductModel> products = [];
  List<String> categories = [];
  List<ProductModel> productsByCategory = [];

  bool isCategoriesLoading = false;
  bool isLoading = false;

  bool isProductsByCategoryLoading = false;

  @override
  void onInit() {
    homeService = HomeService();
    getCategories();
    getProducts();

    // TODO: implement onInit
    super.onInit();
  }

  void getProducts() async {
    try {
      isLoading = true;
      http.Response response = await homeService.getProducts();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        for (int i = 0; i < data.length; i++) {
          products.add(ProductModel.fromJson(data[i]));
        }
        isLoading = false;
        update();
        // print(products);
      }
    } catch (e) {
      print(e);
    }
  }

  void getProductsByCategory(String category) async {
    try {
      isProductsByCategoryLoading = true;
      update();
      http.Response response =
          await homeService.getProductsByCategory(category);
      var data = jsonDecode(response.body);

      for (int i = 0; i < data.length; i++) {
        productsByCategory.add(ProductModel.fromJson(data[i]));
      }
      
    print(productsByCategory);
      isProductsByCategoryLoading = false;
      update();
    } catch (e) {
      print(e);
      isProductsByCategoryLoading = false;
      update();
    }
  }

  void getCategories() async {
    try {
      isCategoriesLoading = true;
      update();
      http.Response response = await homeService.getCategories();
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (int i = 0; i < data.length; i++) {
          categories.add(data[i]);
          isCategoriesLoading = false;
          update();
        }
      } else {
        print("Something went wrong");
        isCategoriesLoading = false;
        update();
      }
    } catch (e) {
      isCategoriesLoading = false;
      update();
      print(e);
    }
  }
}
