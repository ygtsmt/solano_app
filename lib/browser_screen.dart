// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BrowserScreen extends StatefulWidget {
  final bool open;
  final bool? isExplorer;
  final String openUrl;

  const BrowserScreen({
    super.key,
    required this.open,
    required this.openUrl,
    this.isExplorer,
  });

  @override
  _BrowserScreenState createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> {
  InAppWebViewController? _webViewController;
  TextEditingController _searchController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String? currentUrl;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!widget.open) {
        _focusNode.requestFocus();
      }
      if (widget.open) {
        _openBookmark(widget.openUrl);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Color(0xFF19FB9B), Color(0xFF331A80), Color(0xFF000000)],
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    color: Theme.of(context).colorScheme.onInverseSurface,
                    onPressed: () {
                      setState(() {
                        // Reset the current URL to null to show the search or last search view
                        currentUrl = null;
                        _searchController
                            .clear(); // Optionally clear the search field
                      });
                      _webViewController
                          ?.reload(); // Reload the web view (if needed)

                      Navigator.pop(context);
                    },
                  ),
                  if (!(widget.isExplorer ?? false))
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Hero(
                          tag: 'searchField',
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: TextFormField(
                              controller: _searchController,
                              focusNode: _focusNode,
                              onFieldSubmitted: (url) {
                                _loadUrl(url);
                              },
                              style: TextStyle(
                                color:
                                    Theme.of(
                                      context,
                                    ).colorScheme.onInverseSurface,
                              ),
                              cursorColor:
                                  Theme.of(
                                    context,
                                  ).colorScheme.onInverseSurface,
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                hintText: 'Search or enter address',
                                hintStyle: TextStyle(
                                  color:
                                      Theme.of(
                                        context,
                                      ).colorScheme.onInverseSurface,
                                  fontWeight: FontWeight.w500,
                                ),
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    _webViewController?.reload();
                                  },
                                  child: Icon(
                                    Icons.replay_outlined,
                                    color:
                                        Theme.of(
                                          context,
                                        ).colorScheme.onInverseSurface,
                                  ),
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(height: 16),
              currentUrl == null
                  ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Last searches',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Wrap(
                          runSpacing: 12,
                          spacing: 12,
                          children: [
                            LastSearchWidget(
                              label: 'Solana',
                              onTap: () {
                                setState(() {
                                  _searchController.text = 'Solana';
                                });
                              },
                            ),
                            LastSearchWidget(
                              label: 'Solana Crypto',
                              onTap: () {
                                setState(() {
                                  _searchController.text = 'Solana Crypto';
                                });
                              },
                            ),
                            LastSearchWidget(
                              label: 'Crypto Exchange Market',
                              onTap: () {
                                setState(() {
                                  _searchController.text =
                                      'Crypto Exchange Market';
                                });
                              },
                            ),
                            LastSearchWidget(
                              label: 'Buy Solana',
                              onTap: () {
                                setState(() {
                                  _searchController.text = 'Buy Solana';
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                  : Expanded(
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(url: WebUri(currentUrl!)),
                      onWebViewCreated: (controller) {
                        _webViewController = controller;
                      },
                      onLoadStart: (controller, url) {
                        setState(() {
                          currentUrl = url.toString();
                          _searchController.text = currentUrl!;
                        });
                      },
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }

  void _loadUrl(String value) {
    String url = value.trim();

    if (!url.startsWith("http")) {
      url = "https://www.google.com/search?q=$url";
    }

    setState(() {
      currentUrl = url;
    });

    _webViewController?.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
  }

  void _openBookmark(String value) {
    String url = value.trim();

    url = widget.openUrl;

    setState(() {
      currentUrl = url;
    });

    _webViewController?.loadUrl(urlRequest: URLRequest(url: WebUri(url)));
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

class LastSearchWidget extends StatelessWidget {
  final String label;
  final void Function()? onTap;
  const LastSearchWidget({Key? key, required this.label, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
