import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/cart/widget/button_widget.dart';
import 'package:flutter_assignment/UI/cart/widget/card_widget.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:flutter_assignment/core/utils/fonts_and_sizes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/widgets/AppBar/appbar_with_icon.dart';
import '../../services/provider/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final NavigationService _navigationService = NavigationService();

  Type selectHartCopy = Type.FALSE;

  String selectDate = "Select date";

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
          child: CommonAppBar(
            name: "My Cart",
            backButton: true,
            action: Padding(
              padding: const EdgeInsets.only(right: 18),
              child: Icon(
                Icons.more_vert,
                color: FontColors.skyBlueColor,
              ),
            ),
          )),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 18),
        child: InkWell(
          onTap: () {
            cartProvider.clearCart();
            _navigationService.navigateTo(Routes.successScreen);
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            height: 55,
            decoration: BoxDecoration(color: selectDate != "Select date" ? FontColors.primaryColor : Colors.grey, borderRadius: BorderRadius.circular(12)),
            child: Center(
                child: Text(
              "Schedule",
              style: TextStyles.urbanistBold.white.f14,
            )),
          ),
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order review",
              style: TextStyles.urbanistBold.primaryColor.f20,
            ),
            const SizedBox(
              height: 12,
            ),
            Column(
              children: List.generate(
                cartProvider.cart.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: OrderReviewCardWidget(
                    data: cartProvider.cart[index],
                    removeOnTap: () {
                      cartProvider.removeToCart(cartProvider.cart[index]);
                    },
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.sizeOf(context).width,
              height: 84,
              margin: const EdgeInsets.symmetric(vertical: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(
                    width: 0.74,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFFDBDDE0),
                  ),
                  borderRadius: BorderRadius.circular(5.89),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset("assets/svg/clarity_date-line.svg"),
                  InkWell(
                    onTap: () async {
                      final data = await _navigationService.navigateTo(Routes.bookAppointmentScreen);
                      if (data != null) {
                        String date = DateFormat.yMd().format(data[0]);
                        String time = data[1];
                        setState(() {
                          selectDate = "$date ($time)";
                        });
                      }
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.75,
                      height: 40.74,
                      padding: const EdgeInsets.symmetric(horizontal: 10.32, vertical: 10),
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 0.74, color: Color(0xFFCFD4DC)),
                          borderRadius: BorderRadius.circular(5.89),
                        ),
                        shadows: const [
                          BoxShadow(
                            color: Color(0x0C101828),
                            blurRadius: 1.47,
                            offset: Offset(0, 0.74),
                            spreadRadius: 0,
                          )
                        ],
                      ),
                      child: Text(
                        selectDate,
                        style: const TextStyle(
                          color: Color(0xFF667084),
                          fontSize: 16,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const StaticBillCardWidget(),
            RadioButtonReportWidget(
              onTap: (p0) {
                setState(() {
                  selectHartCopy = p0 ?? Type.FALSE;
                });
              },
              value: selectHartCopy,
            ),
          ],
        ),
      )),
    );
  }
}
