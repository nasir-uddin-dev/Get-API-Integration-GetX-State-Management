import 'package:flutter/material.dart';
import 'package:api_getx_state_management/product_model.dart';

class ProductCard extends StatelessWidget {
  final ProductModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.grey.shade600,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(10),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Product Image
            Center(
              child: Image.network(
                product.image ?? "",
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.image, size: 50),
              ),
            ),
            const SizedBox(height: 6),

            /// Product Title
            Text(
              product.title ?? "No Title",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            /// Product Description
            Text(
              product.description ?? "",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 12),
            ),

            const Spacer(),

            /// Price & Rating
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Tk ${product.price ?? 0}"),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 18),
                    Text("${product.rating?.rate ?? 0}"),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
