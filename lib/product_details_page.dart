import 'package:api_getx_state_management/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetailsPage extends StatelessWidget {
  ProductModel product;

  ProductDetailsPage(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            children: [
              Image.network(
                product.image,
                width: Get.width,
                height: 200,
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                 Expanded(
                      flex: 8,
                      child:  Text(
                        product.title,
                        style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      )),
                  Expanded(flex: 1, child:Text(product.price.toString())),
                ],
              ),
             const SizedBox(height: 10,),
              Text(product.description),
            ],
          ),
        ),
      ),
    );
  }
}
