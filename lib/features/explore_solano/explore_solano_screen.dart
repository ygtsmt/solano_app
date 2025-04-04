import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ExploreSolanoScreen extends StatefulWidget {
  @override
  _ExploreSolanoScreenState createState() => _ExploreSolanoScreenState();
}

class _ExploreSolanoScreenState extends State<ExploreSolanoScreen> {
  InAppWebViewController? webViewController;
  String url = 'https://explorer.solana.com/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF19FB9B), Color(0xFF331A80), Color(0xFF000000)],
          ),
        ),
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(url)),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onConsoleMessage: (controller, consoleMessage) {
            print(
              consoleMessage.message,
            ); // Webview içindeki konsol mesajlarını loglar
          },
          onLoadStart: (controller, url) {
            print("WebView started loading: $url");
          },
          onLoadStop: (controller, url) {
            print("WebView stopped loading: $url");
          },
        ),
      ),
    );
  }
}
