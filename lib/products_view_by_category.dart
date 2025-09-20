import 'package:api_getx_state_management/home_controller.dart';
import 'package:api_getx_state_management/product_card.dart';
import 'package:api_getx_state_management/product_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductsViewByCategory extends StatelessWidget {
  String category = " ";

  ProductsViewByCategory(this.category);

  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: Container(
        child: GetBuilder<HomeController>(builder: (_) {
          return homeController.isProductsByCategoryLoading
              ? ShimmerEffect()
              : GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: homeController.productsByCategory.length,
                  itemBuilder: (context, index) {
                    final product = homeController.productsByCategory[index];
                    return ProductCard(
                        product: product); // আলাদা Widget ব্যবহার
                  },
                );
        }),
      ),
    );
  }
}
