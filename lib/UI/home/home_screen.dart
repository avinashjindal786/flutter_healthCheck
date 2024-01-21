import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/home/widgets/package_widget.dart';
import 'package:flutter_assignment/UI/home/widgets/profile_card_widget.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:flutter_assignment/services/provider/cart_provider.dart';
import 'package:flutter_assignment/services/provider/home_provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/utils/fonts_and_sizes.dart';
import '../../core/widgets/AppBar/appbar_with_icon.dart';

class HomeScreen extends StatefulWidget {
  final List<String> imagepaths;
  const HomeScreen({super.key, this.imagepaths = const ["assets/images/image1.jpeg", "assets/images/image2.jpeg", "assets/images/image3.jpeg"]});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NavigationService _navigationService = NavigationService();
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context);
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
          child: CommonAppBar(
            name: "Logo",
            action: SizedBox(
              width: 60,
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 18,
                  top: 12,
                ),
                child: InkWell(
                  onTap: () {
                    _navigationService.navigateTo(Routes.cartScreen);
                  },
                  child: Stack(
                    children: [
                      SvgPicture.asset(
                        "assets/svg/mdi_cart.svg",
                        width: 25,
                        height: 25,
                      ),
                      cartProvider.cart.isNotEmpty
                          ? Positioned(
                              right: 9,
                              child: Container(
                                width: 18,
                                height: 18,
                                decoration: const ShapeDecoration(
                                  color: Color(0xFF16C2D5),
                                  shape: OvalBorder(),
                                ),
                                child: Center(
                                    child: Text(
                                  cartProvider.cart.length.toString(),
                                  style: TextStyles.urbanistRegular.black.f10,
                                )),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ),
              ),
            ),
          )),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular lab tests",
                  style: TextStyles.urbanistBold.primaryColor.f20,
                ),
                Row(
                  children: [
                    Text(
                      "View more ",
                      style: TextStyles.urbanistRegular.primaryColor.f12.copyWith(decoration: TextDecoration.underline),
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            GridView.builder(
              itemCount: homeProvider.labTextList.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 220, crossAxisCount: 2, crossAxisSpacing: 15.0, mainAxisSpacing: 15.0),
              itemBuilder: (context, index) => ProfileCardWidget(
                onTap: () {
                  if (cartProvider.cart.contains(homeProvider.labTextList[index])) {
                    cartProvider.removeToCart(homeProvider.labTextList[index]);
                  } else {
                    cartProvider.addedToCart(homeProvider.labTextList[index]);
                  }
                },
                testName: homeProvider.labTextList[index]["testName"],
                testKey: homeProvider.labTextList[index],
                totalTests: homeProvider.labTextList[index]["includes"],
                price: homeProvider.labTextList[index]["currentAmount"],
                actualPrice: homeProvider.labTextList[index]["actualAmount"],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
            Text(
              "Popular Packages",
              style: TextStyles.urbanistBold.primaryColor.f20,
            ),
            const SizedBox(
              height: 12,
            ),
            const PopularPackageWidget(),
          ]),
        ),
      ),
    );
  }
}
