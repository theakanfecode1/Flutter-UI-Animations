import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:testteamapt/category_details_screen.dart';
import 'package:testteamapt/flip_route.dart';
import 'package:testteamapt/gen/assets.gen.dart';

import 'app_colors.dart';

class HomePageView extends StatefulWidget {

  final VoidCallback onTap;

  const HomePageView({Key key, this.onTap}) : super(key: key);


  @override
  _HomePageViewState createState() => _HomePageViewState();
}

class _HomePageViewState extends State<HomePageView>
    with TickerProviderStateMixin {
  AnimationController _gmController;
  Animation<Offset> _gmAnimation;

  AnimationController _searchController;
  Animation<Offset> _searchAnimation;

  AnimationController _greenContainerController;
  Animation<Offset> _greenContainerAnimation;

  AnimationController _plumberController;
  Animation<Offset> _plumberAnimation;

  AnimationController _categoryController;
  Animation<Offset> _categoryAnimation;

  AnimationController _navController;
  Animation<Offset> _navAnimation;

  AnimationController _notificationController;
  Animation<double> _notificationAnimation;

  List<Category> categoryListOne = [
    Category('Cleaning', Assets.images.sponge.path),
    Category('Repair', Assets.images.carRepair.path),
    Category('Delivery', Assets.images.deliveryTruck.path),
    Category('Dog walking', Assets.images.dogWalking.path),
    Category('Labour', Assets.images.worker.path),
    Category('Nurse', Assets.images.nurse.path),
  ];

  List<Category> categoryListTwo = [
    Category('Dog walking', Assets.images.dogWalking.path),
    Category('Labour', Assets.images.worker.path),
    Category('Nurse', Assets.images.nurse.path),
  ];

  @override
  void initState() {
    super.initState();

    _gmController = AnimationController(
      duration: const Duration(milliseconds: 700),
      vsync: this,
    )..forward();
    _gmAnimation = Tween<Offset>(
      begin: const Offset(-0.2, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _gmController,
      curve: Curves.easeIn,
    ));

    _categoryController = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..forward();
    _categoryAnimation = Tween<Offset>(
      begin: const Offset(-0.15, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _categoryController,
      curve: Curves.fastLinearToSlowEaseIn,
    ));

    _searchController = AnimationController(
      duration: const Duration(milliseconds: 1050),
      vsync: this,
    )..forward();
    _searchAnimation = Tween<Offset>(
      begin: const Offset(-0.9, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _searchController,
      curve: Curves.easeIn,
    ));

    _plumberController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..forward();
    _plumberAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.9),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _plumberController,
      curve: Curves.easeIn,
    ));

    _navController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    _navAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.7),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _navController,
      curve: Curves.easeIn,
    ));

    _greenContainerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
    _greenContainerAnimation = Tween<Offset>(
      begin: const Offset(-0.9, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _greenContainerController,
      curve: Curves.easeIn,
    ));

    _notificationController = AnimationController(
      duration: const Duration(
        seconds: 3,
      ),
      vsync: this,
    );
    _notificationAnimation = Tween(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _notificationController,
      curve: Curves.bounceIn,
    ));
  }

  @override
  void dispose() {
    _gmController.dispose();
    _navController.dispose();
    _categoryController.dispose();
    _plumberController.dispose();
    _greenContainerController.dispose();
    _searchController.dispose();
    _notificationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [
              0.1,
              0.8,
            ],
            colors: [
              Color(0xFFFAFAFA),
              Color(0xFFF9F9F9),
            ],
          )),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 10),
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SlideTransition(
                            position: _gmAnimation,
                            textDirection: TextDirection.rtl,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Good morning!',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 23,
                                      color: AppColors.secondary),
                                ),
                                Gap(2),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.location_on,
                                          color: AppColors.grey,
                                          size: 17,
                                        ),
                                        Gap(2),
                                        Text(
                                          'London',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16,
                                              color: AppColors.grey),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          AnimationLimiter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: AnimationConfiguration.toStaggeredList(
                                duration: const Duration(milliseconds: 1000),
                                childAnimationBuilder: (widget) => ScaleAnimation(
                                  scale: 0.5,
                                  child: widget,
                                ),
                                children: [
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15.0),
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 15,
                                            offset: Offset(0, 10),
                                            color: AppColors.black.withOpacity(.05),
                                            spreadRadius:
                                                -9 // changes position of shadow
                                            ),
                                      ],
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      // child: Icon(Icons.notifications_none_outlined,color: AppColors.grey,size: 28,)
                                      child: Assets.images.notification
                                          .image(width: 25, color: AppColors.grey),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                      Gap(10),
                      SlideTransition(
                        position: _greenContainerAnimation,
                        textDirection: TextDirection.rtl,
                        child: Stack(
                          // clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 220,
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              left: 0,
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 185,
                                decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Gap(20),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '20% OFF',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 25,
                                              color: AppColors.white),
                                        ),
                                        Gap(1),
                                        Text(
                                          'for the first order',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 15,
                                              color: AppColors.white),
                                        ),
                                        Gap(18),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 28.0, vertical: 8.0),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          child: Text(
                                            'Hire Now',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 14,
                                                color: AppColors.primary),
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 0,
                                right: 15,
                                child: SlideTransition(
                                  position: _plumberAnimation,
                                  textDirection: TextDirection.rtl,
                                  child: Assets.images.plumber
                                      .image(height: 235, fit: BoxFit.fill),
                                )),
                          ],
                        ),
                      ),
                      Gap(30),
                      SlideTransition(
                        position: _searchAnimation,
                        textDirection: TextDirection.rtl,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 15,
                                  offset: Offset(0, 10),
                                  color: AppColors.black.withOpacity(.05),
                                  spreadRadius: -9 // changes position of shadow
                                  ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 6.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColors.grey,
                                  size: 25,
                                ),
                                Gap(8),
                                Expanded(
                                  child: TextField(
                                    cursorColor: AppColors.secondary,
                                    textInputAction: TextInputAction.done,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17.5,
                                        color: AppColors.secondary),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'Search',
                                        hintStyle:TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17.5,
                                            color: AppColors.grey),
                                    ),
                                  )

                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(30),
                      AnimationLimiter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: AnimationConfiguration.toStaggeredList(
                            duration: const Duration(milliseconds: 1900),
                            childAnimationBuilder: (widget) => SlideAnimation(
                              horizontalOffset:
                              MediaQuery.of(context).size.width / 8,
                              child: FadeInAnimation(
                                  curve : Curves.easeIn,
                                  child: widget),
                            ),
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 21,
                                    color: AppColors.secondary),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Gap(7),
                      AnimationLimiter(
                        child: GridView.count(
                          crossAxisCount: 3,
                          crossAxisSpacing: 15.0,
                          mainAxisSpacing: 15.0,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          childAspectRatio:
                              (MediaQuery.of(context).size.width / 3) / 145,
                          padding: const EdgeInsets.symmetric(vertical:8.0),
                          children: List.generate(
                            6,
                            (int index) {
                              return GestureDetector(
                                onTap: (){
                                   FocusScope.of(context).unfocus();
                                  widget.onTap();
                                },
                                child: AnimationConfiguration.staggeredGrid(
                                  columnCount: 3,
                                  position: index,
                                  duration: Duration(milliseconds: 1700),
                                  child: ScaleAnimation(
                                    scale: 0.5,
                                    curve: Curves.easeInOut,
                                    child: FadeInAnimation(
                                      curve: Curves.easeIn,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(15.0),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 15,
                                                offset: Offset(0, 10),
                                                color: AppColors.black
                                                    .withOpacity(.05),
                                                spreadRadius:
                                                    -9 // changes position of shadow
                                                ),
                                          ],
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0, vertical: 10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.asset(
                                                categoryListOne[index].imagePath,
                                                width: index == 1 ? 32 : 38,
                                              ),
                                              Gap(8),
                                              Text(
                                                categoryListOne[index].title,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 14,
                                                    color: AppColors.secondary),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      Gap(80),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
                    width: double.infinity,
                    color: Color(0xFFFAFAFA),
                    padding: EdgeInsets.only(top: 10),
                    child: SlideTransition(
                      position: _navAnimation,
                      textDirection: TextDirection.rtl,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25.0),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 15,
                                offset: Offset(0, 10),
                                color: AppColors.black.withOpacity(.05),
                                spreadRadius: -9 // changes position of shadow
                                ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.home,
                                color: AppColors.primary,
                                size: 27,
                              ),
                              Icon(
                                Icons.favorite,
                                color: AppColors.grey,
                                size: 27,
                              ),
                              Icon(
                                Icons.person,
                                color: AppColors.grey,
                                size: 27,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Category {
  final String title;
  final String imagePath;

  Category(this.title, this.imagePath);
}






