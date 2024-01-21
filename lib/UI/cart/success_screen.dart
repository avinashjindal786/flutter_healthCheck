import 'package:flutter/material.dart';
import 'package:flutter_assignment/app/app.router.dart';
import 'package:flutter_assignment/core/utils/fonts_and_sizes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/widgets/AppBar/appbar_with_icon.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationService _navigationService = NavigationService();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size(MediaQuery.sizeOf(context).width, 60),
            child: CommonAppBar(
              name: "Success",
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
              _navigationService.clearStackAndShow(Routes.homeScreen);
            },
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 55,
              decoration: BoxDecoration(color: FontColors.primaryColor, borderRadius: BorderRadius.circular(12)),
              child: Center(
                  child: Text(
                "Back to home",
                style: TextStyles.urbanistBold.white.f14,
              )),
            ),
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Image.asset("assets/images/Group 1000004154.png"),
          ),
        ));
  }
}
