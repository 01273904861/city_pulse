import 'package:city_pulse/core/routing/routes.dart';
import 'package:city_pulse/core/widgets/custom_elevated_button.dart';
import 'package:city_pulse/features/on%20boarding/widgets/welocome_widget.dart';
import 'package:city_pulse/features/on%20boarding/widgets/what_we_track_widget.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: PageView.builder(
                controller: pageController,
                itemCount: 2,
                itemBuilder:
                    (context, index) =>
                        index == 0
                            ? const WelcomeWidget()
                            : const WhatWeTrackWidget(),
                onPageChanged: (index) {
                  currentIndex = index;
                  setState(() {});
                },
              ),
            ),
            CustomElevatedButton(
              title: "Next",
              onPressed: () {
                if (currentIndex <= 0) {
                  setState(() {
                    currentIndex++;
                    pageController.nextPage(
                      duration: Duration(microseconds: 500),
                      curve: Curves.bounceIn,
                    );
                  });
                } else {
                  currentIndex++;
                  Navigator.pushNamed(context, Routes.locationAccessScreen);
                }
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
