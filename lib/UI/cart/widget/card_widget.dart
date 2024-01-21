import 'package:flutter/material.dart';

import '../../../core/utils/fonts_and_sizes.dart';

class OrderReviewCardWidget extends StatelessWidget {
  Map<String, dynamic> data;
  VoidCallback removeOnTap;
  OrderReviewCardWidget({
    required this.data,
    required this.removeOnTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 175,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 1,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFDBDDE0),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width,
            height: 39,
            decoration: ShapeDecoration(
              color: FontColors.lightPrimaryColor,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
            ),
            child: Center(
              child: Text(
                'Pathology tests',
                style: TextStyles.urbanistBold.white.f16,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  data["testName"],
                  style: TextStyles.urbanistBold.black.f16,
                ),
                Text('₹ ${data["currentAmount"]}/-', maxLines: 1, style: TextStyles.urbanistBold.skyBlueColor.f16),
              ],
            ),
          ),
          InkWell(
            onTap: removeOnTap,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              margin: const EdgeInsets.symmetric(horizontal: 12),
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 2, color: Color(0xFF10217D)),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.delete,
                    color: FontColors.primaryColor,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('Remove', style: TextStyles.urbanistMedium.primaryColor.f12),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            margin: const EdgeInsets.symmetric(horizontal: 12),
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 2, color: Color(0xFF10217D)),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.upload,
                  color: FontColors.primaryColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text('Upload prescription (optional)', style: TextStyles.urbanistMedium.primaryColor.f12),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StaticBillCardWidget extends StatelessWidget {
  const StaticBillCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 169,
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 0.74,
            strokeAlign: BorderSide.strokeAlignCenter,
            color: Color(0xFFDBDDE0),
          ),
          borderRadius: BorderRadius.circular(5.90),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.65, child: Text('M.R.P Total', style: TextStyles.urbanistMedium.f14.copyWith(color: const Color(0xFF475569)))),
              Text('1400', style: TextStyles.urbanistMedium.f14.copyWith(color: const Color(0xFF475569))),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            children: [
              SizedBox(width: MediaQuery.sizeOf(context).width * 0.65, child: Text('Discount', style: TextStyles.urbanistMedium.f14.copyWith(color: const Color(0xFF475569)))),
              Text('400', style: TextStyles.urbanistMedium.f14.copyWith(color: const Color(0xFF475569))),
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Amount to be paid', style: TextStyles.urbanistMedium.f18.primaryColor),
              Text('₹ 1000/-', style: TextStyles.urbanistMedium.f20.primaryColor),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.4,
                child: Text('Total savings ', style: TextStyles.urbanistMedium.f18.copyWith(color: const Color(0xFF475569))),
              ),
              Text('₹ 400/-', style: TextStyles.urbanistMedium.f18.primaryColor),
            ],
          ),
        ],
      ),
    );
  }
}
