import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:nb_utils/nb_utils.dart';
import '../utils/conncetion.dart';

class ChapaWeb extends StatefulWidget {
  final String url;
  final String transactionReference;
  final int amountPaid;

  const ChapaWeb(
      {super.key,
      required this.url,
      required this.transactionReference,
      required this.amountPaid});

  @override
  State<ChapaWeb> createState() => _ChapaWebViewState();
}

class _ChapaWebViewState extends State<ChapaWeb> {
  late InAppWebViewController webViewController;
  String url = "";
  bool _isConnected=false;

  @override
  void initState() {
    init();
    super.initState();
  }

  Future<void> init() async {
    bool isConnected = await FindTicket.findTicket();
    setState(() {
      _isConnected = isConnected;
    });

    if(!_isConnected){
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No internet connection!'),
            duration: Duration(seconds: 3), // Adjust duration as needed
          ),
      );
    }
  }

  @override
  void dispose() {
    // _connectivity.cancel();
    super.dispose();
  }
  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void exitPaymentPage(String message) {
    Navigator.pop (context,
      {
        'message': message,
        'transactionReference': 'reference',
        'paidAmount': widget.amountPaid,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url:Uri.parse(widget.url)),//Uri.parse(widget.url)),
            onWebViewCreated: (controller) {
              setState(() {
                webViewController = controller;
              });
              controller.addJavaScriptHandler(
                  handlerName: "buttonState",
                  callback: (args) async {
                    webViewController = controller;
                    log(args.toString());
                    if (args[2][1] == 'CancelbuttonClicked') {
                      exitPaymentPage('paymentCancelled');
                    }
                    return args.reduce((curr, next) => curr + next);
                  });
            },
            onUpdateVisitedHistory: (InAppWebViewController controller,
                Uri? uri, androidIsReload) async {
              if (uri.toString() == 'https://chapa.co') {
                exitPaymentPage('paymentSuccessful');
              }
              if (uri.toString().contains('checkout/payment-receipt/')|| uri.toString().contains('checkout/test-payment-receipt')) {
                await Future.delayed(const Duration(seconds: 1));
                exitPaymentPage('paymentSuccessful');
              }
              controller.addJavaScriptHandler(
                  handlerName: "handlerFooWithArgs",
                  callback: (args) async {
                    webViewController = controller;
                    if (args[2][1] == 'failed') {
                      await Future.delayed(const Duration(seconds: 1));
                      exitPaymentPage('paymentFailed');
                    }
                    if (args[2][1] == 'success') {
                      await Future.delayed(const Duration(seconds: 1));
                      exitPaymentPage('paymentSuccessful');
                    }
                    return args.reduce((curr, next) => curr + next);
                  });

              controller.addJavaScriptHandler(
                  handlerName: "buttonState",
                  callback: (args) async {
                    webViewController = controller;

                    if (args[2][1] == 'CancelbuttonClicked') {
                      exitPaymentPage('paymentCancelled');
                    }
                    return args.reduce((curr, next) => curr + next);
                  });
            },
          ),
        ),
      ]),
    );
  }
}
