import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Row(
          children: [
            Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                height: 40,
                width: 70,
              ),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[50]!,
            ),
            SizedBox(
              width: 10,
            ),
            Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                height: 40,
                width: 70,
              ),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[50]!,
            ),
            SizedBox(
              width: 10,
            ),
            Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                height: 40,
                width: 70,
              ),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[50]!,
            ),
            SizedBox(
              width: 10,
            ),
            Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                height: 40,
                width: 70,
              ),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[50]!,
            ),
            Shimmer.fromColors(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white),
                height: 40,
                width: 70,
              ),
              baseColor: Colors.grey[200]!,
              highlightColor: Colors.grey[50]!,
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }
}
