import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(

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
          SizedBox(height: 10,),
          Row(
            children: [
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[200]!,
                highlightColor: Colors.grey[50]!,
              ),
      
              SizedBox(width: 40,),
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
      
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
      
              SizedBox(width: 40,),
              Shimmer.fromColors(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                  ),
                  height: 150,
                  width: 150,
                ),
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
              ),
      
            ],
          ),
        ]
        ),
      ),
    );
  }
}
