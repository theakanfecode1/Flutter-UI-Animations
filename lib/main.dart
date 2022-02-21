import 'dart:io';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testteamapt/anim.dart';
import 'package:testteamapt/app_colors.dart';
import 'package:testteamapt/category_details_screen.dart';
import 'package:testteamapt/home_page_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Color(0xFFFAFAFA), // navigation bar color
    statusBarColor: Color(0xFFFAFAFA), // status bar color
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarIconBrightness: Brightness.dark
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyAppTest());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: HomePageView(),
      // home: Scaffold(
      //   body: CustomPaint(
      //     painter: CustomWave(),
      //     child: Container(
      //       height: 500,
      //       width: 500,
      //     ),
      //   ),
      // ),
    );
  }
}

class CustomWave extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // var paint = Paint();
    //
    // paint.color = Colors.lightBlue;
    // paint.style = PaintingStyle.stroke;
    // paint.strokeWidth = 3;
    //
    // var startPoint = Offset(0, size.height / 2);
    // var controlPoint1 = Offset(size.width / 4, size.height / 3);
    // var controlPoint2 = Offset(3 * size.width / 4, size.height / 3);
    // var endPoint = Offset(size.width, size.height / 2);
    //
    // var path = Path();
    // path.moveTo(startPoint.dx, startPoint.dy);
    // path.cubicTo(controlPoint1.dx, controlPoint1.dy,
    //     controlPoint2.dx, controlPoint2.dy,
    //     endPoint.dx, endPoint.dy);
    //
    // path.moveTo(startPoint.dx, startPoint.dy);
    // path.cubicTo(controlPoint1.dx, controlPoint1.dy,
    //     controlPoint2.dx, controlPoint2.dy,
    //     endPoint.dx, endPoint.dy);

    // canvas.translate(0, size.height / 2);
    // final Paint wavePainter = Paint()
    //   ..color = Color(0xFF1f58a1)
    //   ..strokeWidth = 2
    //   ..style = PaintingStyle.stroke;
    // double high = size.height;
    // double offset = size.width / 13;
    // Path path = Path()
    //   ..moveTo(0, 0)
    //   ..quadraticBezierTo(offset, -high / 3, 2 * offset, 0)
    //   ..quadraticBezierTo(4 * offset, high / 2, 5 * offset, 0)
    //   ..quadraticBezierTo(offset * 7, -high, offset * 8, 2)
    //   ..quadraticBezierTo(offset * 9, high / 2, offset * 11, 0)
    //   ..quadraticBezierTo(offset * 12, -high / 3, offset * 13, 0);
    // canvas.drawPath(path, wavePainter);

    final angle = pi / 5;
    Color paintColor = Color.fromRGBO(250, 154, 210, 1);
    Paint circlePaint = Paint()
      ..color = paintColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.save();
    canvas.translate(size.width * 0.5, size.height * 0.5);
    canvas.rotate(angle);
    canvas.drawOval(
        Rect.fromCenter(center: Offset.zero, width: 90, height: 160),
        circlePaint);
    canvas.drawOval(
        Rect.fromCenter(center: Offset(1.0, 1.0), width: 50, height: 160),
        circlePaint);
    canvas.restore();

    // canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class MyAppTest extends StatelessWidget {
  const MyAppTest({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      builder: (BuildContext context, Widget child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          data: data.copyWith(
              textScaleFactor: 0.95),
          child: child,
        );
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
        count: 0,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final int count;

  const MyHomePage({Key key, @required this.title, @required this.count})
      : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  AnimationController x;

  @override
  void initState() {
    x = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
      lowerBound: -1.0,
      upperBound: 1.0,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageFlipBuilder(
        controller: x,
        back: CategoryDetailsScreen(
          onBackPressed: () {
            x.forward();
          },
          onInit: (action) {
            x.addStatusListener((s) {
              if (s == AnimationStatus.dismissed) {
                action();
              }
            });
          },
        ),
        front: HomePageView(
          onTap: () {
            x.reverse();
          },
        ),
      ),
    );
  }
}
