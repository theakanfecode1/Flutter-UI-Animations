import 'package:flutter/material.dart';
import 'package:flutter_scale_tap/flutter_scale_tap.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:testteamapt/app_colors.dart';
import 'package:testteamapt/cleaner_details_screen.dart';
import 'package:testteamapt/gen/assets.gen.dart';

import 'home_page_view.dart';

class CategoryDetailsScreen extends StatefulWidget {
  final Function(VoidCallback action) onInit;
  final VoidCallback onBackPressed;
  const CategoryDetailsScreen({Key key, this.onInit,this.onBackPressed}) : super(key: key);


  @override
  _CategoryDetailsScreenState createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen>
    with TickerProviderStateMixin {
  List<Category> categoryListTwo = [
    Category('High rating', Assets.images.star.path),
    Category('Verified', Assets.images.check.path),
    Category('Up to 10%', Assets.images.money.path),
  ];

  AnimationController _gmController;
  Animation<Offset> _gmAnimation;

  bool isShowing = false;



  @override
  void initState() {
    _gmController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    _gmAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.15),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _gmController,
      curve: Curves.easeIn,
    ));
    super.initState();
  }
  bool hasInited = false;

  void externalInit() {
    if (mounted) {
      setState(() {
        isShowing = true;
        _gmController.forward();
      });
    }
  }

  @override
  void dispose() {
    _gmController.dispose();


    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!hasInited) {
      widget.onInit(externalInit);
      hasInited = true;
    }
    return WillPopScope(
      onWillPop: () async{
        final returnValue = !isShowing;
        if(isShowing) {
          setState(() {
            isShowing = false;
            _gmController.reverse();
          });
          widget.onBackPressed();
        }
        return returnValue;
      },
      child: Scaffold(
        backgroundColor: Color(0xFFFAFAFA),
        body: isShowing ? SafeArea(
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
            child: Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0,right: 25.0,top:  10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AnimationLimiter(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 1100),
                                  childAnimationBuilder: (widget) =>
                                      ScaleAnimation(
                                    scale: 0.7,
                                    child: widget,
                                  ),
                                  children: [
                                    GestureDetector(
                                      onTap : () {
                                        setState(() {
                                          isShowing = false;
                                          _gmController.reverse();
                                        });
                                        widget.onBackPressed();
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(15.0),
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
                                          padding: const EdgeInsets.all(12.0),
                                          // child: Icon(Icons.notifications_none_outlined,color: AppColors.grey,size: 28,)
                                          child: Icon(Icons.arrow_back_ios_outlined,
                                              size: 20, color: AppColors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            AnimationLimiter(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: AnimationConfiguration.toStaggeredList(
                                  duration: const Duration(milliseconds: 1100),
                                  childAnimationBuilder: (widget) =>
                                      ScaleAnimation(
                                    scale: 0.2,
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
                                              color: AppColors.black
                                                  .withOpacity(.05),
                                              spreadRadius:
                                                  -9 // changes position of shadow
                                              ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        // child: Icon(Icons.notifications_none_outlined,color: AppColors.grey,size: 28,)
                                        child: Icon(Icons.more_horiz_outlined,
                                            size: 25, color: AppColors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AnimationLimiter(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration: const Duration(milliseconds: 1100),
                                    childAnimationBuilder: (widget) =>
                                        ScaleAnimation(
                                      scale: 0.8,
                                      child: widget,
                                    ),
                                    children: [
                                      Container(
                                        height: 90,
                                        width: 90,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(18.0),
                                          border: Border.all(
                                              color: AppColors.grey, width: 0.8),
                                          boxShadow: [
                                            BoxShadow(
                                                blurRadius: 1,
                                                offset: Offset(0, 10),
                                                color: AppColors.black
                                                    .withOpacity(.03),
                                                spreadRadius:
                                                    -10 // changes position of shadow
                                                ),
                                          ],
                                        ),
                                        child: Center(
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            // child: Icon(Icons.notifications_none_outlined,color: AppColors.grey,size: 28,)
                                            child: Assets.images.banner.image(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Gap(25),
                              AnimationLimiter(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children:
                                          AnimationConfiguration.toStaggeredList(
                                        duration:
                                            const Duration(milliseconds: 700),
                                        childAnimationBuilder: (widget) =>
                                            FadeInAnimation(
                                                curve: Curves.easeIn,
                                                child: widget),
                                        children: [
                                          Text(
                                            'Glorious Shine',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 22.5,
                                                color: AppColors.secondary),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children:
                                          AnimationConfiguration.toStaggeredList(
                                        duration:
                                            const Duration(milliseconds: 1000),
                                        childAnimationBuilder: (widget) =>
                                            FadeInAnimation(
                                                curve: Curves.easeIn,
                                                child: widget),
                                        children: [
                                          Text(
                                            'Cleaning Service',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 18.5,
                                                color: Colors.grey[500]),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children:
                                          AnimationConfiguration.toStaggeredList(
                                        duration:
                                            const Duration(milliseconds: 1300),
                                        childAnimationBuilder: (widget) =>
                                            FadeInAnimation(
                                                curve: Curves.easeIn,
                                                child: widget),
                                        children: [
                                          Row(
                                            children: [
                                              Row(
                                                children: List.generate(
                                                    5,
                                                    (index) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 4.0),
                                                          child: Icon(
                                                            Icons.star,
                                                            color: Colors.amber,
                                                            size: 18,
                                                          ),
                                                        )),
                                              ),
                                              Gap(3),
                                              Text(
                                                '5.0',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 17,
                                                    color: AppColors.grey),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Gap(35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: AnimationLimiter(
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
                                  'Description',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21,
                                      color: AppColors.secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: SlideTransition(
                          position: _gmAnimation,
                          child: Text(
                            'The company provides proven cleaners for your apartments and large areas. We select the most reliable candidates and think about your safety.',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.grey[500]),
                          ),
                        ),
                      ),
                      Gap(25),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 45,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(20.0),),
                            child: AnimationLimiter(
                              child: ListView.builder(
                                itemCount: categoryListTwo.length,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1200),
                                  child: SlideAnimation(
                                      horizontalOffset: 300.0,
                                      curve: Curves.easeInOut,

                                      child: FadeInAnimation(
                                          curve: Curves.easeIn,
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 15.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            boxShadow: [
                                              BoxShadow(
                                                  blurRadius: 10,
                                                  offset: Offset(0, 10),
                                                  color: AppColors.grey
                                                      .withOpacity(0.1),
                                                  spreadRadius:
                                                  -9// changes position of shadow
                                              ),
                                            ],
                                          ),
                                          child: Padding(
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 20.0),
                                              child: Row(
                                                children: [
                                                  Image.asset(
                                                      categoryListTwo[index]
                                                          .imagePath,
                                                      height: 20),
                                                  Gap(8),
                                                  Text(
                                                    categoryListTwo[index].title,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color:
                                                            AppColors.secondary),
                                                  ),
                                                ],
                                              )),
                                        ),
                                      ))),
                                ),
                              ),
                            )),
                      ),
                      Gap(35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: AnimationLimiter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 1900),
                              childAnimationBuilder: (widget) => SlideAnimation(
                                horizontalOffset:
                                MediaQuery.of(context).size.width / 8,
                                child: FadeInAnimation(
                                    curve: Curves.easeIn, child: widget),
                              ),
                              children: [
                                Text(
                                  'Cleaners',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21,
                                      color: AppColors.secondary),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Gap(20),
                      Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 225,
                          decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius.circular(10.0),),
                            child: AnimationLimiter(
                              child: ListView.builder(
                                itemCount: 3,
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) =>
                                    Hero(
                                      tag: 'nurse'+index.toString(),
                                      child: ScaleTap(
                                        scaleMinValue: 0.8,
                                        onPressed: (){
                                          Navigator.push(
                                              context,
                                              PageRouteBuilder(
                                                  transitionDuration: Duration(milliseconds: 900),
                                                  pageBuilder: (_, __, ___) => CleanerDetailsScreen(index: index.toString(),)));
                                          // Navigator.of(context).push(MaterialPageRoute( builder: (context) => CleanerDetailsScreen(index: index.toString(),)));
                                        },
                                        child: AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 1200),
                                  child: SlideAnimation(
                                          horizontalOffset: 300.0,
                                          curve: Curves.easeInOut,
                                          child: FadeInAnimation(
                                              curve: Curves.easeIn,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 15.0),
                                                child: Container(
                                                  width: 160,
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(10.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          blurRadius: 10,
                                                          offset: Offset(0, 1),
                                                          color: AppColors.grey
                                                              .withOpacity(.09),
                                                          spreadRadius:
                                                          2// changes position of shadow
                                                      ),
                                                    ],
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            10.0)),
                                                            color: AppColors.black
                                                                .withOpacity(0.04),
                                                          ),
                                                          width: double.infinity,
                                                          child: Image.asset(
                                                              Assets.images.nurseWoman
                                                                  .path,
                                                              height: 120)),
                                                      Padding(
                                                        padding: const EdgeInsets
                                                                .symmetric(
                                                            horizontal: 8.0),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Gap(10),
                                                            Text(
                                                              'Helen Lee',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight.w600,
                                                                  fontSize: 17,
                                                                  color: AppColors
                                                                      .secondary),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Icon(
                                                                  Icons.location_on,
                                                                  color:
                                                                      AppColors.grey,
                                                                  size: 15,
                                                                ),
                                                                Gap(4),
                                                                Text(
                                                                  'Camden',
                                                                  style: TextStyle(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize: 13,
                                                                      color: AppColors
                                                                          .grey),
                                                                ),
                                                              ],
                                                            ),
                                                            Gap(6),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      '\$27',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w600,
                                                                          fontSize: 15,
                                                                          color: AppColors
                                                                              .secondary),
                                                                    ),
                                                                    Text(
                                                                      '/hour',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                          fontSize: 13,
                                                                          color: AppColors
                                                                              .secondary),
                                                                    ),

                                                                  ],
                                                                ),
                                                                Gap(4),
                                                                Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons.star,
                                                                      color: Colors
                                                                          .amber,
                                                                      size: 18,
                                                                    ),
                                                                    Gap(3),
                                                                    Text(
                                                                      '4.7',
                                                                      style: TextStyle(
                                                                          fontWeight:
                                                                              FontWeight
                                                                                  .w500,
                                                                          fontSize:
                                                                              15,
                                                                          color: AppColors
                                                                              .grey),
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ))),
                                ),
                                      ),
                                    ),
                              ),
                            )),
                      ),
                      Gap(70),

                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom:10.0),
                    child: Container(
                      width: double.infinity,
                      color: Color(0xFFFAFAFA),
                      padding: EdgeInsets.only(top: 10),
                      child: AnimationLimiter(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: AnimationConfiguration.toStaggeredList(
                              duration: const Duration(milliseconds: 800),
                              childAnimationBuilder: (widget) => ScaleAnimation(
                                scale: 0.8,
                                curve: Curves.easeIn,
                                child: widget,
                              ),
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 60,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(19.0),
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
                                  child: Center(
                                    child: Text(
                                      'Contact now',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18,
                                          color: AppColors.white),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ) : Container(),
      ),
    );
  }
}
