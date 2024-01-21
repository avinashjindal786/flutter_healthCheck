import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/fonts_and_sizes.dart';
import '../../../services/provider/cart_provider.dart';

class ProfileCardWidget extends StatelessWidget {
  String testName;
  int totalTests;
  int price;
  int actualPrice;
  VoidCallback onTap;
  Map<String, dynamic> testKey;
  ProfileCardWidget({
    required this.actualPrice,
    required this.price,
    required this.testName,
    required this.totalTests,
    required this.onTap,
    required this.testKey,
    super.key,
  });

  bool addCart = false;

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    addCart = cartProvider.cart.contains(testKey);
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFD2D2D2)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 32,
          decoration: ShapeDecoration(
            color: FontColors.lightPrimaryColor,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
          ),
          child: Center(
            child: Text(testName, textAlign: TextAlign.center, style: TextStyles.urbanistBold.white.f10),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Includes $totalTests tests', maxLines: 1, style: TextStyles.urbanistRegular.black.f12),
              Container(
                width: 27,
                height: 24,
                padding: const EdgeInsets.only(top: 6, left: 7, right: 8, bottom: 6),
                decoration: ShapeDecoration(
                  color: Color(0xFF16C2D5),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                ),
                child: SvgPicture.asset("assets/svg/teenyicons_shield-tick-solid.svg"),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('Get reports in 24 hours', maxLines: 1, style: TextStyles.urbanistRegular.black.f10),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('₹ $price', maxLines: 1, style: TextStyles.urbanistBold.primaryColor.f16),
              const SizedBox(
                width: 10,
              ),
              Text(actualPrice.toString(), maxLines: 1, style: TextStyles.urbanistRegular.black.f12.copyWith(decoration: TextDecoration.lineThrough)),
            ],
          ),
        ),
        Center(
          child: InkWell(
            onTap: onTap,
            child: Container(
              width: MediaQuery.sizeOf(context).width - 250,
              height: 36,
              decoration: ShapeDecoration(
                color: addCart ? FontColors.skyBlueColor : FontColors.primaryColor,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              child: Center(
                  child: Text(
                addCart ? "Added to cart" : "Add to cart",
                style: TextStyles.urbanistBold.f12.white,
              )),
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Center(
          child: Container(
            width: MediaQuery.sizeOf(context).width - 250,
            height: 36,
            decoration: ShapeDecoration(
              color: FontColors.white78,
              shape: RoundedRectangleBorder(side: BorderSide(color: FontColors.primaryColor), borderRadius: BorderRadius.circular(5)),
            ),
            child: Center(
                child: Text(
              "View Details",
              style: TextStyles.urbanistBold.f12.primaryColor,
            )),
          ),
        ),
      ]),
    );
  }
}
