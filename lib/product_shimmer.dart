import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key});

  @override
  Widget build(BuildContext context) {
    double itemHeight = 200; // আপনার product card এর height

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            shimmerRow(itemHeight),
            const SizedBox(height: 20),
            shimmerRow(itemHeight),
            const SizedBox(height: 20),
            shimmerRow(itemHeight),
            const SizedBox(height: 20),
            shimmerRow(itemHeight),
          ],
        ),
      ),
    );
  }

  Widget shimmerRow(double height) {
    return Row(
      children: [
        Expanded(child: shimmerBox(height)),
        const SizedBox(width: 10),
        Expanded(child: shimmerBox(height)),
      ],
    );
  }

  Widget shimmerBox(double height) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[200]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
      ),
    );
  }
}
