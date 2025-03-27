import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BrowserScreen(),
    );
  }
}

final adapter = SolanaWalletAdapter(
  const AppIdentity(),
  cluster: Cluster.devnet,
);

class BrowserScreen extends StatefulWidget {
  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  InAppWebViewController? webViewController;
  String url = 'https://explorer.solana.com/';
  Object? _output;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xFF9945FF), // Solana Moru
                Color(0xFF19FB9B), // Solana Yeşili
                Color(0xFF627EEA), // Solana Mavisi
              ],
            ),
          ),
        ),
        title: const Text(
          "Wallet DApp",
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () async {
            if (webViewController != null) {
              bool canGoBack = await webViewController!.canGoBack();
              if (canGoBack) {
                webViewController!.goBack();
              }
            }
          },
        ),
      ),
      endDrawer: _buildDrawer(), // ✅ Drawer (Yan Menü)
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF9945FF),
              Color(0xFF19FB9B),
              Color(0xFF627EEA),
            ],
          ),
        ),
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(url)),
          onWebViewCreated: (controller) {
            webViewController = controller;
          },
          onConsoleMessage: (controller, consoleMessage) {
            print(consoleMessage
                .message); // Webview içindeki konsol mesajlarını loglar
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

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF9945FF),
              Color(0xFF19FB9B),
              Color(0xFF627EEA),
            ],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_balance_wallet,
                      size: 50, color: Colors.white),
                  SizedBox(height: 10),
                  Text(
                    "Select Wallet",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ],
              ),
            ),
            _drawerItem("Connect with Phantom", "phantom"),
            _drawerItem("Connect with Solflare", "solflare"),
            _drawerItem("Connect with Sol Pay", "solpay"),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(String text, String walletType) {
    return ListTile(
      title: Text(
        text,
        style: const TextStyle(fontSize: 18, color: Colors.white),
      ),
      leading: const Icon(Icons.wallet, color: Colors.white),
      onTap: () async {
        Navigator.pop(context);

        final result = await _connectToWallet(walletType);
        if (!result) {
          return errorShowDialog();
        } else {
          return successShowDialog();
        }
      },
    );
  }

  Future<void> errorShowDialog() async {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('!')),
          content: Text(
              'Please install a wallet application. \n (Phantom Wallet, Solflare Wallet)'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'))
          ],
        );
      },
    );
  }

  Future<void> successShowDialog() async {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('🌟')),
          content: Text('Successfully installed.'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Tamam'))
          ],
        );
      },
    );
  }

  Future<bool> _connectToWallet(String walletType) async {
    try {
      Uri? walletUriBase;

      switch (walletType) {
        case 'phantom':
          walletUriBase = adapter.store.apps[0].walletUriBase;
          break;
        case 'solflare':
          walletUriBase = adapter.store.apps[1].walletUriBase;
          break;
        case 'solpay':
          walletUriBase = adapter.store.apps[1].walletUriBase;
          break;
      }
      if (walletUriBase == null) {
        return false;
      }

      final result = await adapter.authorize(
        walletUriBase: walletUriBase,
        type: AssociationType.local,
      );
      print('$walletType ile bağlandı: $result');
      setState(() => _output = result.toJson());
      print('objectobjectobjectobjectobject : ${_output}');
      return true;
    } catch (e) {
      print("$walletType Bağlantı Hatası: $e");
      return false;
    }
  }

  Future<void> _connectPhantom() async {
    try {
      final result = await adapter.authorize();
      print('Phantom ile bağlandı: $result');
      setState(() => _output = result.toJson());
    } catch (e) {
      print("Phantom Bağlantı Hatası: $e");
    }
  }

  Future<void> _connectSolflare() async {
    try {
      final result = await adapter.authorize();
      print('Solflare ile bağlandı: $result');
      setState(() => _output = result.toJson());
    } catch (e) {
      print("Solflare Bağlantı Hatası: $e");
    }
  }

  Future<void> _connectSolPay() async {
    try {
      final result = await adapter.authorize();
      print('Sol Pay ile bağlandı: $result');
      setState(() => _output = result.toJson());
    } catch (e) {
      print("Sol Pay Bağlantı Hatası: $e");
    }
  }
}
