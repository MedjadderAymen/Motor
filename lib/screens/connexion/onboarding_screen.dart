import 'package:flutter/material.dart';
import 'package:motar/shared/OnBoard.dart';
import 'package:motar/shared/constants.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: kPrimaryColor,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: const Text(
                    "تخطي",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                height: 300,
                child: PageView.builder(
                    controller: _pageController,
                    itemCount: demo_data.length,
                    onPageChanged: (index){
                      setState(() {
                        _pageIndex = index;
                      });
                    },
                    itemBuilder: (context, index) => OnBoardingWidget(
                        size: size,
                        image: demo_data[index].image,
                        title: demo_data[index].title,
                        description: demo_data[index].description)),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...List.generate(demo_data.length,
                      (index) => Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2),
                        child: DotIndicator(isActive: index == _pageIndex),
                      ))
                ],
              ),
              const SizedBox(
                height: 35,
              ),
              InkWell(
                onTap: () {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kPrimaryColor,
                  ),
                  child: const Text(
                    "التالي",
                    style: TextStyle(
                        color: kWhiteTextColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: kPrimaryColor,
                          width: 2,
                          style: BorderStyle.solid)),
                  child: const Text(
                    "تخطي",
                    style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w300),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isActive ? 20 : 10,
      height: 10,
      decoration: BoxDecoration(
          color: isActive ? kPrimaryColor : kGray,
          borderRadius: BorderRadius.circular(25)),
    );
  }
}

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    Key? key,
    required this.size,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  final Size size;
  final String image, title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(image),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: size.width * 0.75,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: title,
                style: const TextStyle(
                    color: kTextColor,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: size.width * 0.5,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: description,
                style: const TextStyle(
                    color: kLightTextColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    height: 1),
              ),
            ]),
          ),
        )
      ],
    );
  }
}
