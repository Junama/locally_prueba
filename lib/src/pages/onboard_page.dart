import 'package:flutter/material.dart';
import 'package:locally/src/pages/home_page.dart';
import 'package:locally/src/utils/text_styles.dart';

import '../utils/text_styles.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
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
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xff6969ff) : Colors.grey,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                height: 500,
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
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/calendarColour.png',
                              ),
                              height: 200.0,
                              width: 200.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text("Revisa toda la oferta local.",style: signInMailBlue,
                          ),
                          SizedBox(height: 15.0),
                          Text("Agenda eventos y compartelos con tus cercanos.",style: normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/ticket-colour.png',
                              ),
                              height: 200.0,
                              width: 200.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text("Descubre tu entorno.",style: signInMailBlue,
                          ),
                          SizedBox(height: 15.0),
                          Text("Recibe ofertas, cupones e invitaciones basadas en tu ubicación.",
                               style: normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(40.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Image(
                              image: AssetImage(
                                'assets/images/photographer-colour.png',
                              ),
                              height: 200.0,
                              width: 200.0,
                            ),
                          ),
                          SizedBox(height: 30.0),
                          Text('¡Bienvenid@! ve a descubrir Locally.',style: signInMailBlue,
                          ),
                          SizedBox(height: 15.0),
                          Text("Devolvamosle el foco a lo local.",style: normalTextStyle,
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
              _currentPage != _numPages - 1
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
                              Text('Next',style: TextStyle(color: Color(0xff6969ff),
                                   fontSize: 22.0),
                              ),
                              SizedBox(width: 10.0),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xff6969ff),
                                size: 30.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : Text(''),
            ],
          ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
          ? Container(
              height: 100.0,
              width: double.infinity,
              color: Color(0xff6969ff),
              child: GestureDetector(
                onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage())),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: Text('Comenzar',style: TextStyle(color: Colors.white,fontSize: 20.0,
                                 fontWeight: FontWeight.bold),
                           ),
                    ),
                  ),
                ),
            )
          : Text(''),
    );
  }
}
