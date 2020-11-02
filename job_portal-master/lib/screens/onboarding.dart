import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_portal/screens/styles.dart';
import 'package:job_portal/screens/choose.dart';


class OnBoarding extends StatefulWidget {
  final String title;
  OnBoarding({this.title});
  @override
  OnBoardingState createState() {
    return new OnBoardingState();
  }
}

class OnBoardingState extends State<OnBoarding> {
  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return Expanded(
      child: AnimatedContainer(
        duration: Duration(milliseconds: 150),
        margin: EdgeInsets.symmetric(horizontal: 10.0 ),
        height: 1.0,
        width: 10,
        decoration: BoxDecoration(
          color: isActive ? Colors.white : Color(0xFF7B51D3),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.7, 0.9],
              colors: [
                Color(0xFFE0F7FA),
                Color(0xFF80DEEA),
                Color(0xFF26C6DA),
                Color(0xFF0097A7),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 50.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: (){ Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (BuildContext context) => Choose()));
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 480.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/uu.png',
                                ),
                                height: 250.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Text(
                              'Hire Candidates!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'All you need to login in the app and hire the best employees through this platform.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/uu1.png',
                                ),
                                height: 250.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Text(
                              'Search For Job',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'For all those who want to have a job that they love, just get registered in the app and find your soul job.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/uu2.png',
                                ),
                                height: 250.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Text(
                              'Manage Employees',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'You can see who all have applied for your job and can manage the applicants through just one click.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/uu3.png',
                                ),
                                height: 250.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 25.0),
                            Text(
                              'Get Placed!',
                              style: kTitleStyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'Have fun while doing the job you are in love with.',
                              style: kSubtitleStyle,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                /*_currentPage != _numPages - 1
                    ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            'Next',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22.0,
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 25.0,
                          ),
                        ],
                      ),
                    ),
                  ),
                )
                    : Text(''),*/
              ],
            ),
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
        height: 70.0,
        width: double.infinity,
        color: Colors.white,
        child: GestureDetector(
          onTap: ()  {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => Choose()));
          },
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'Get started',
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      )
          : Text(''),
    );
  }
}
//COMPLETE

/*
  int _slideIndex = 0;

  final List<String> images = [
    "images/uu.png",
    "images/uu1.png",
    "images/uu2.png",
    "images/uu3.png"
  ];

  final List<String> text0 = [
    "Hire Candidates",
    "Search For Job",
    "Manage Employees",
    "Get Placed!"
  ];

  final List<String> text1 = [
    "All you need is to login in the app and hire the best employees through this platform.",
    "For all those who want to have a job that they love, just get registered in the app and find your soul job.",
    "You can see who all have applied for your job and can manage the applicants through just one click.",
    "Have fun while doing the job you are in love with."
  ];

  final IndexController controller = IndexController();

  @override
  Widget build(BuildContext context) {

    TransformerPageView transformerPageView = TransformerPageView(
        pageSnapping: true,
        onPageChanged: (index) {
          setState(() {
            this._slideIndex = index;
          });
        },
        loop: false,
        controller: controller,
        transformer: new PageTransformerBuilder(
            builder: (Widget child, TransformInfo info) {
              return new Material(
                color: Colors.white,
                elevation: 8.0,
                textStyle: new TextStyle(color: Colors.white),
                borderRadius: new BorderRadius.circular(12.0),
                child: new Container(
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Padding(
                   padding: const EdgeInsets.all(0.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        new ParallaxContainer(

                          child: new Image.asset(
                            images[_slideIndex],
                            height: 450.0,
                            width: 500.0,
                          ),
                          position: info.position,
                          opacityFactor: .8,
                          translationFactor: 400.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 0.0),
                          child: new ParallaxContainer(
                            child: new Text(
                              text0[info.index],
                              style: new TextStyle(
                                  color: Colors.cyan[800],
                                  fontSize: 20.0,
                                  fontFamily: 'Pacifico',
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            position: info.position,
                            opacityFactor: .8,
                            translationFactor: 400.0,
                          ),
                        ),
                        SizedBox(
                          height:5.0,
                        ),

                        SizedBox(
                          height: 15.0,
                        ),
                        new ParallaxContainer(
                          child: new Text(
                            text1[info.index],
                            textAlign: TextAlign.center,
                            style: new TextStyle(
                                color: Colors.blueGrey,
                                fontSize: 16.0,
                                fontFamily: 'Satisfy',
                                fontWeight: FontWeight.bold),
                          ),
                          position: info.position,
                          translationFactor: 300.0,
                        ),
                        SizedBox(
                          height: 55.0,
                        ),
                        new ParallaxContainer(
                          position: info.position,
                          translationFactor: 500.0,
                          child: Dots(
                            controller: controller,
                            slideIndex: _slideIndex,
                            numberOfDots: images.length,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }),
        itemCount: 4
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: transformerPageView,
    );
  }
}
class Dots extends StatelessWidget {

  final IndexController controller;
  final int slideIndex;
  final int numberOfDots;
  Dots({this.controller, this.slideIndex, this.numberOfDots});

  List<Widget> _generateDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; i++) {
      dots.add(i == slideIndex ? _activeSlide(i) : _inactiveSlide(i));
    }
    return dots;
  }

  Widget _activeSlide(int index) {
    return GestureDetector(
      onTap: () {
        print('Tapped');
      },
      child: new Container(
        child: Padding(
          padding: EdgeInsets.only(left: 0.0, right:0.0),
          child: Container(
            width: 12.0,
            height:12.0,
            decoration: BoxDecoration(
              color: Colors.orangeAccent.withOpacity(.3),
              borderRadius: BorderRadius.circular(70.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _inactiveSlide(int index) {
    return GestureDetector(
      onTap: () {
        controller.move(index);
      },
      child: new Container(
        child: Padding(

          padding: EdgeInsets.only(left: 0.0, right: 0.0),
          child: Container(
            width: 7.0,
            height: 7.0,
            decoration: BoxDecoration(
                color: Colors.blueGrey[300].withOpacity(0.7),
                borderRadius: BorderRadius.circular(50.0)),
          ),
        ),

      ),

    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _generateDots(),
        )
    );
  }
}*/
