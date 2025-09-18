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
//
// এই HomeController ক্লাসটি GetX Controller, যা মূলত API কল করে প্রোডাক্ট, ক্যাটেগরি এবং নির্দিষ্ট ক্যাটেগরির প্রোডাক্ট ম্যানেজ করে।
//
// সারসংক্ষেপঃ
// 🔹 ভ্যারিয়েবলসমূহ
//
// homeService 👉 API কল করার জন্য সার্ভিস ক্লাস।
//
// products 👉 সব প্রোডাক্টের লিস্ট।
//
// categories 👉 সব ক্যাটেগরির লিস্ট।
//
// productsByCategory 👉 নির্দিষ্ট ক্যাটেগরির প্রোডাক্টের লিস্ট।
//
// isLoading, isCategoriesLoading, isProductsByCategoryLoading 👉 ডেটা লোডিং ট্র্যাক করার জন্য ফ্ল্যাগ।
//
// 🔹 onInit()
//
// কন্ট্রোলার তৈরি হলে প্রথমেই getCategories() এবং getProducts() কল হয়।
//
// 🔹 getProducts()
//
// সব প্রোডাক্ট API থেকে ফেচ করে।
//
// jsonDecode করে প্রতিটি প্রোডাক্টকে ProductModel এ কনভার্ট করে products লিস্টে যোগ করে।
//
// update() দিয়ে UI রিফ্রেশ করে।
//
// 🔹 getProductsByCategory(String category)
//
// নির্দিষ্ট ক্যাটেগরির প্রোডাক্ট API থেকে নিয়ে আসে।
//
// ডেটা ProductModel এ কনভার্ট করে productsByCategory লিস্টে রাখে।
//
// লোডিং শেষ হলে update() কল হয়।
//
// 🔹 getCategories()
//
// ক্যাটেগরির লিস্ট API থেকে ফেচ করে।
//
// প্রতিটি ক্যাটেগরি categories লিস্টে যোগ হয়।
//
// লোডিং স্টেট পরিবর্তন হলে update() কল হয়।
//
// 👉 সহজভাবে বললে, এই HomeController হলো স্টেট ম্যানেজমেন্টের মস্তিষ্ক – এটা API থেকে ডেটা আনে, মডেল এ কনভার্ট করে রাখে, আর UI-কে আপডেট করার নির্দেশ দেয়।
