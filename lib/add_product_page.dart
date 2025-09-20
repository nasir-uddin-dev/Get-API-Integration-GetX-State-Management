import 'package:api_getx_state_management/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final TextEditingController productTEController = TextEditingController();
  final TextEditingController priceTEController = TextEditingController();
  final TextEditingController descriptionTEController = TextEditingController();

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                controller: productTEController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Product Name",
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                controller: priceTEController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Price Name",
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                controller: descriptionTEController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Description Name",
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                Map<String, dynamic> product = {
                  'name': productTEController.text,
                  'price': priceTEController.text,
                  'description': descriptionTEController.text,
                };
                homeController.postProduct(product);
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                width: Get.width,
                height: 45,
                child: Center(
                  child: Text(
                    "Add Product",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
