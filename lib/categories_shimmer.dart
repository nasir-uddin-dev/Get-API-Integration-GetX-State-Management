import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoriesShimmer extends StatelessWidget {
  const CategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Row(
        children: [
          Shimmer.fromColors(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 40,
              width: 70,
            ),
            baseColor: Colors.grey[200]!,
            highlightColor: Colors.grey[50]!,
          ),
          SizedBox(
            width: 40,
          ),
          Shimmer.fromColors(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              height: 150,
              width: 150,
            ),
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
              ),
              SizedBox(
                width: 40,
              ),
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
              ),
              SizedBox(
                width: 40,
              ),
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
              ),
              SizedBox(
                width: 40,
              ),
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
