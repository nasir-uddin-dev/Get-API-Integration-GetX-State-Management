import 'package:api_getx_state_management/action_page.dart';
import 'package:api_getx_state_management/categories_shimmer.dart';
import 'package:api_getx_state_management/home_controller.dart';
import 'package:api_getx_state_management/product_shimmer.dart';
import 'package:api_getx_state_management/products_view_by_category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'product_card.dart'; // নতুন ফাইল ইমপোর্ট

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Online Shop",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        actions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: InkWell(
            onTap: (){
              Get.to(ActionPage());
            },
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.deepOrangeAccent,
              child: Icon(Icons.add, color: Colors.white,),),
          ),
        )
        ],
      ),
      body: Column(
        children: [
          /// Categories Section
          SizedBox(
            height: 40,
            child: GetBuilder<HomeController>(
              builder: (_) {
                if (homeController.isCategoriesLoading) {
                  return const CategoriesShimmer();
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.categories.length,
                  itemBuilder: (context, index) {
                    final category = homeController.categories[index];
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: () {
                          homeController.getProductsByCategory(
                              homeController.categories[index]);
                          Get.to(ProductsViewByCategory(homeController.categories[index].toUpperCase()));
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              homeController.categories[index].toUpperCase(),
                              style: const TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 10),

          /// Products Section
          Expanded(
            child: GetBuilder<HomeController>(
              builder: (_) {
                if (homeController.isLoading) {
                  return const ShimmerEffect();
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: homeController.products.length,
                  itemBuilder: (context, index) {
                    final product = homeController.products[index];
                    return ProductCard(product: product); // আলাদা Widget ব্যবহার
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
