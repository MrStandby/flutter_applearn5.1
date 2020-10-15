import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  // it should be the first line in main method
  WidgetsFlutterBinding.ensureInitialized();

  // rest of your app code
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyApp extends StatelessWidget {
  InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to Halgoom',
      home: WillPopScope(
        onWillPop: _onBack,
        child: Scaffold(
          body: InAppWebView(
            initialUrl: "https://www.halgoom.com",
            onWebViewCreated: (InAppWebViewController controller) {
              _webViewController = controller;
            },
          ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(.02),
            child: AppBar(
              backgroundColor: Hexcolor('#e67e22'),
              title: Text(''),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onBack() async {
    if (await _webViewController.canGoBack()) {
      _webViewController.goBack(); // perform webview back operation
      return false;
    } else {
      // Webpage in home page
      return true; // Close App
    }
  }
}

// splash2 class for splash screen
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(backgroundColor: Colors.orangeAccent, title: Text('')),
      body: Center(
        child: SplashScreen(
          seconds: 3,

          navigateAfterSeconds: new MyApp(),
          image: new Image.asset('images/splash.png'),
          //loadingText: Text("خليك مع الي بوفر عليك"),
          loaderColor: Colors.blue,

          photoSize: 82.0,
          backgroundColor: Colors.orangeAccent,
          //loaderColor: Colors.black87,
        ),
      ),
    );
  }
}
