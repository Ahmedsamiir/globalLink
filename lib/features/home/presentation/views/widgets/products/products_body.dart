import 'package:flutter/material.dart';
import 'package:globelink/features/home/presentation/views/widgets/products/item_product.dart';

class ProductsBody extends StatelessWidget {
  const ProductsBody({super.key});

  static List<Color> backgroundColor = [
    const Color(0xff55A9FF),
    const Color(0xff3A7FE8),
    const Color(0xff286EDA),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
      child: Column(
        children: [
          SizedBox(
            width: 300,
            child: Text(
              "Pick any of our high-quality policies to know you have Globelink with you on your trip",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(color: Colors.white),
            ),
          ),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
          const ItemProduct(),
        ],
      ),
    );
  }
}
