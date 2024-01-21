import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/fonts_and_sizes.dart';

class PopularPackageWidget extends StatelessWidget {
  const PopularPackageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 265,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.75,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFDBDDE0),
          ),
          borderRadius: BorderRadius.circular(6),
        ),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: ShapeDecoration(
                    color: Color(0xFF2F80ED).withOpacity(0.2),
                    shape: const OvalBorder(),
                  ),
                  child: Center(child: SvgPicture.asset("assets/svg/012-medicine.svg")),
                ),
                const SizedBox(
                  height: 18,
                ),
                Text(
                  "Full Body checkup",
                  style: TextStyles.urbanistMedium.black.f20,
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  "Includes 92 tests\n \u2022 Blood Glucose Fasting\n \u2022 Liver Function Test\nView more",
                  style: TextStyles.urbanistRegular.lightBlueColor.f10,
                ),
                const SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹ 2000/-",
                      style: TextStyles.urbanistRegular.skyBlueColor.f18,
                    ),
                    Container(
                      width: 114,
                      height: 33,
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 9),
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 0.75, color: Color(0xFF10217D)),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                      child: Text(
                        'Add to cart',
                        style: TextStyles.urbanistRegular.primaryColor.f10,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              right: 10,
              top: 20,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                decoration: ShapeDecoration(
                  color: FontColors.skyBlueColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
                ),
                child: Row(children: [
                  SvgPicture.asset("assets/svg/teenyicons_shield-tick-solid.svg"),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('Safe', style: TextStyles.urbanistBold.white.f10),
                ]),
              ))
        ],
      ),
    );
  }
}
