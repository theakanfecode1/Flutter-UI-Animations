import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:gap/gap.dart';
import 'package:testteamapt/app_colors.dart';
import 'package:testteamapt/gen/assets.gen.dart';
import 'package:testteamapt/home_page_view.dart';

class CleanerDetailsScreen extends StatefulWidget {
  final String index;

  const CleanerDetailsScreen({Key key, this.index}) : super(key: key);

  @override
  _CleanerDetailsScreenState createState() => _CleanerDetailsScreenState();
}

class _CleanerDetailsScreenState extends State<CleanerDetailsScreen> with TickerProviderStateMixin{
  List<Category> categoryListTwo = [
    Category('Home cleaning', Assets.images.house.path),
    Category('Laundry', Assets.images.laundryBasket.path),
    Category('Building', Assets.images.officeBuilding.path),
    
    
  ];

  AnimationController _firstController;
  Animation<Offset> _firstAnimation;

  AnimationController _secondController;
  Animation<Offset> _secondAnimation;

  AnimationController _thirdController;
  Animation<Offset> _thirdAnimation;

  @override
  void dispose() {
    _thirdController.dispose();
    _secondController.dispose();
    _firstController.dispose();


    super.dispose();
  }

  @override
  void initState() {
    _firstController = AnimationController(
      duration: const Duration(milliseconds: 900),
      vsync: this,
    )..forward();
    _firstAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.8),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _firstController,
      curve: Curves.easeIn,
    ));

    _secondController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..forward();
    _secondAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.9),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _secondController,
      curve: Curves.easeIn,
    ));

    _thirdController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward();
    _thirdAnimation = Tween<Offset>(
      begin: const Offset(0.0, 0.99),
      end: const Offset(0.0, 0.0),
    ).animate(CurvedAnimation(
      parent: _thirdController,
      curve: Curves.easeIn,
    ));


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFAFA),
      body: Container(
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
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    color: AppColors.black.withOpacity(0.017),
                    child: Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AnimationLimiter(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration:
                                        const Duration(milliseconds: 1100),
                                    childAnimationBuilder: (widget) =>
                                        ScaleAnimation(
                                      scale: 0.7,
                                      child: widget,
                                    ),
                                    children: [
                                      GestureDetector(
                                        onTap: () =>
                                            Navigator.of(context).pop(),
                                        child: Container(
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
                                            padding: const EdgeInsets.all(12.0),
                                            // child: Icon(Icons.notifications_none_outlined,color: AppColors.grey,size: 28,)
                                            child: Icon(
                                                Icons.arrow_back_ios_outlined,
                                                size: 20,
                                                color: AppColors.grey),
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
                                  children:
                                      AnimationConfiguration.toStaggeredList(
                                    duration:
                                        const Duration(milliseconds: 1100),
                                    childAnimationBuilder: (widget) =>
                                        ScaleAnimation(
                                      scale: 0.2,
                                      child: widget,
                                    ),
                                    children: [
                                      Container(
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
                                          padding: const EdgeInsets.all(10.0),
                                          // child: Icon(Icons.notifications_none_outlined,color: AppColors.grey,size: 28,)
                                          child: Icon(Icons.favorite,
                                              size: 25,
                                              color: AppColors.grey
                                                  .withOpacity(0.6)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Hero(
                              tag: 'nurse' + widget.index,
                              child: Assets.images.nurseWoman
                                  .image(height: 270, fit: BoxFit.fill)),
                        ),
                      ],
                    ),
                  ),
                  Gap(30),
                  SlideTransition(
                    position: _firstAnimation,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Miranda Olsen',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 23,
                                    color: AppColors.secondary),
                              ),
                              Gap(4),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 21,
                                  ),
                                  Gap(3),
                                  Text(
                                    '4.7(17)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                        color: AppColors.grey),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Gap(20),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
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
                                                            -9 // changes position of shadow
                                                        ),
                                                      ],
                                                    ),
                                                    child: Padding(
                                                        padding:
                                                        const EdgeInsets.symmetric(
                                                            horizontal: 25.0),
                                                        child: Row(
                                                          children: [
                                                            Image.asset(
                                                                categoryListTwo[index]
                                                                    .imagePath,
                                                                height: 20),
                                                            Gap(8),
                                                            Text(
                                                              categoryListTwo[index]
                                                                  .title,
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  fontSize: 14,
                                                                  color: AppColors
                                                                      .secondary),
                                                            ),
                                                          ],
                                                        )),
                                                  ),
                                                ))),
                                      ),
                                ),
                              )),
                        ),
                        Gap(25),
                      ],
                    ),
                  ),

                  SlideTransition(
                    position: _secondAnimation,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  'About',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21,
                                      color: AppColors.secondary),
                                ),
                              ],
                            ),
                        ),
                        Gap(10),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Text(
                            'I work with an individual approach to each client! I guarantee a best result',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                                color: Colors.grey[500]),
                          ),
                        ),
                        Gap(25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                'Work area',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 21,
                                    color: AppColors.secondary),
                              ),
                            ],
                          ),
                        ),
                        Gap(15),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Assets.images.map.image()),
                        ),
                        Gap(130),
                      ],
                    ),
                  ),

                ],
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: SlideTransition(
                position: _thirdAnimation,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.only(
                        topLeft: Radius
                            .circular(
                            30.0),
                        topRight: Radius
                            .circular(
                            30.0)),
                    color: AppColors.white,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left:25.0,right:25.0,bottom: 20.0,top: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Price',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                    color: Colors.grey[400]),
                              ),
                              Row(
                                children: [
                                  Text(
                                    '\$20',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight
                                            .w600,
                                        fontSize: 25,
                                        color: AppColors
                                            .secondary),
                                  ),
                                  Text(
                                    '/hour',
                                    style: TextStyle(
                                        fontWeight:
                                        FontWeight
                                            .w600,
                                        fontSize: 12.5,
                                        color: AppColors
                                            .secondary),
                                  ),

                                ],
                              ),

                            ],
                          ),
                          Container(
                            width: 170,
                            height: 55,
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
                                'Hire now',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 17,
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
          ],
        ),
      ),
    );
  }
}
