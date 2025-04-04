import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:solana_wallet_adapter/solana_wallet_adapter.dart';
import 'package:solano_app/features/browser/browser_screen.dart';
import 'package:solano_app/app/widgets/buttons/add_button.dart';
import 'package:solano_app/app/widgets/buttons/custom_home_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Object? _output;
  final adapter = SolanaWalletAdapter(
    const AppIdentity(),
    cluster: Cluster.devnet,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        resizeToAvoidBottomInset:
            false, // Bu, klavye açıldığında ekranın yeniden boyutlanmasını engeller

        endDrawer: _buildDrawer(),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF19FB9B),
                  Color(0xFF331A80),
                  Color(0xFF000000),
                ],
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(width: 48), // Placeholder for alignment
                    Text(
                      "SOL Browser",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(
                        color: Theme.of(context).colorScheme.onInverseSurface,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                        fontFamily: "Montserrat",
                      ),
                    ),
                    Builder(
                      builder:
                          (context) => IconButton(
                            icon: Icon(
                              Icons.menu,
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onInverseSurface,
                            ),
                            onPressed:
                                () => Scaffold.of(context).openEndDrawer(),
                          ),
                    ),
                  ],
                ),
                SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 500),
                          pageBuilder:
                              (_, __, ___) =>
                                  BrowserScreen(open: false, openUrl: ''),
                          transitionsBuilder: (_, animation, __, child) {
                            return FadeTransition(
                              opacity: animation,
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFF000000),
                            Color(0xFF331A80),
                            Color.fromARGB(255, 40, 20, 100),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextFormField(
                        enabled: false,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onInverseSurface,
                        ),
                        cursorColor:
                            Theme.of(context).colorScheme.onInverseSurface,
                        decoration: InputDecoration(
                          hintText: 'Search or enter address',
                          hintStyle: TextStyle(
                            color:
                                Theme.of(context).colorScheme.onInverseSurface,
                            fontWeight: FontWeight.w500,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Icon(
                              Icons.search,
                              size: 32,
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onInverseSurface,
                            ),
                          ),

                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding FavoritesView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Favorites',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            spacing: 16,
            children: [
              CustomHomeButton(
                assetsPath: 'assets/solana-sol-logo.png',
                label: 'Explore Solana',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://explorer.solana.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
              CustomHomeButton(
                assetsPath: 'assets/google.jpg',
                label: 'Google',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://www.google.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
              CustomHomeButton(
                assetsPath: 'assets/tv_logo.png',
                label: 'TradingView',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://www.tradingview.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
              CustomHomeButton(
                assetsPath: 'assets/plus.png',
                label: 'Add',
                isAddButton: true,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) =>
                              BrowserScreen(open: false, openUrl: ''),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding ExtensionView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Extensions',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            spacing: 16,
            children: [
              CustomHomeButton(
                assetsPath: 'assets/phantom.png',
                label: 'Phantom',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://phantom.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
              CustomHomeButton(
                assetsPath: 'assets/solflare.png',
                label: 'Solflare',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://www.solflare.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),

              CustomHomeButton(
                assetsPath: 'assets/metamask.png',
                label: 'MetaMask',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://metamask.io/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
              CustomHomeButton(
                assetsPath: 'assets/plus.png',
                label: 'Add',
                isAddButton: true,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) =>
                              BrowserScreen(open: false, openUrl: ''),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding LastVisited(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Last Visited',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.onInverseSurface,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            spacing: 16,
            children: [
              CustomHomeButton(
                assetsPath: 'assets/solana-sol-logo.png',
                label: 'Explore Solana',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://explorer.solana.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
              CustomHomeButton(
                assetsPath: 'assets/google.jpg',
                label: 'Google',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://www.google.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),
              CustomHomeButton(
                assetsPath: 'assets/tv_logo.png',
                label: 'TradingView',
                isAddButton: false,
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 500),
                      pageBuilder:
                          (_, __, ___) => BrowserScreen(
                            open: true,
                            openUrl: 'https://www.tradingview.com/',
                          ),
                      transitionsBuilder: (_, animation, __, child) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                    ),
                  );
                },
              ),

              // AddButton(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF19FB9B), Color(0xFF331A80), Color(0xFF000000)],
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.transparent),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  Image.asset('assets/wallet.png', height: 64),
                  SizedBox(height: 10),
                  Text(
                    "SOL Browser",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      color: Theme.of(context).colorScheme.onInverseSurface,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            _drawerItem(
              "Connect with Phantom",
              "phantom",
              'assets/phantom.png',
              () async {
                Navigator.pop(context);
                final result = await _connectToWallet('phantom');
                if (!result) {
                  //     return errorShowDialog();
                } else {
                  //  return successShowDialog();
                }
              },
            ),
            SizedBox(height: 16),
            _drawerItem(
              "Connect with Solflare",
              "solflare",
              'assets/solflare.png',
              () async {
                Navigator.pop(context);
                final result = await _connectToWallet('solpay');
                if (!result) {
                  //   return errorShowDialog();
                } else {
                  //();
                }
              },
            ),
            SizedBox(height: 16),
            _drawerItem(
              "Pay with SOL",
              "solpay",
              'assets/pay-with-SOL.png',
              () async {
                Navigator.pop(context);
                final result = await _connectToWallet('solpay');
                if (!result) {
                  //     return errorShowDialog();
                } else {
                  // return successShowDialog();
                }
              },
            ),
            SizedBox(height: 16),
            _drawerItem(
              "Explorer",
              "pay",
              'assets/solana-sol-logo.png',
              () async {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 500),
                    pageBuilder:
                        (_, __, ___) => BrowserScreen(
                          open: true,
                          openUrl: 'https://explorer.solana.com/',
                          isExplorer: true,
                        ),
                    transitionsBuilder: (_, animation, __, child) {
                      return FadeTransition(opacity: animation, child: child);
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 16),

            _drawerItem(
              "Notifications",
              "",
              'assets/notification.png',
              () async {},
            ),
            SizedBox(height: 16),

            _drawerItem("Support", "", 'assets/help.png', () async {}),
            SizedBox(height: 16),

            _drawerItem("DAPP", "", 'assets/dapp.png', () async {}),
            _drawerItem("Logout", "", 'assets/logout.png', () async {}),
          ],
        ),
      ),
    );
  }

  Widget _drawerItem(
    String text,
    String walletType,
    String path,
    void Function()? onTap,
  ) {
    return ListTile(
      title: Text(
        text,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).colorScheme.onInverseSurface,
        ),
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          path,
          color:
              walletType == ""
                  ? Theme.of(context).colorScheme.inversePrimary
                  : null,
          height: 36,
        ),
      ),
      onTap: onTap,
    );
  }

  Future<void> errorShowDialog() async {
    return showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Center(child: Text('!')),
          content: const Text(
            'Please install a wallet application. \n (Phantom Wallet, Solflare Wallet)',
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
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
          title: const Center(child: Text('🌟')),
          content: const Text('Successfully installed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
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
      setState(() => _output = result.toJson());
      return true;
    } catch (e) {
      return false;
    }
  }
}
