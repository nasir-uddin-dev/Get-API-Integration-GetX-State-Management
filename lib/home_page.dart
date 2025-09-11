import 'package:api_getx_state_management/categories_shimmer.dart';
import 'package:api_getx_state_management/home_controller.dart';
import 'package:api_getx_state_management/product_model.dart';
import 'package:api_getx_state_management/shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Online Shop",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 40,
            child: GetBuilder<HomeController>(builder: (_) {
              return homeController.isProductsByCategoryLoading? CategoriesShimmer() : ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.categories.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: GestureDetector(
                        onTap: (){
                          homeController.getProductsByCategory(homeController.categories[index]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Text(
                              homeController.categories[index].toUpperCase(),
                              style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
                            ),
                          )),
                        ),
                      ),
                    );
                  });
            }),
          ),
          SizedBox(height: 10,),
          Expanded(
            child: GetBuilder<HomeController>(builder: (_) {
              return homeController.isLoading
                  ? ShimmerEffect()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                            ),
                            shrinkWrap: true,
                            itemCount: homeController.products.length,
                            itemBuilder: (context, index) {
                              ProductModel product =
                                  homeController.products[index];
                              return Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Card(
                                  shadowColor: Colors.grey.shade600,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(30),
                                    bottomLeft: Radius.circular(30),
                                    bottomRight: Radius.circular(10),
                                  )),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          product.image.toString(),
                                          width: 80,
                                          height: 80,
                                          fit: BoxFit.cover,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Text(
                                          'Product',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                        ),
                                        Text(
                                          product.description.toString(),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Tk 500"),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.orange,
                                                  size: 20,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.grey,
                                                  size: 20,
                                                ),
                                                Text("3")
                                              ],
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    );
            }),
          ),
        ],
      ),
    );
  }
}
