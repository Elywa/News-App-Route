import 'package:flutter/material.dart';
import 'package:news_app/models/articles/articles/article.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key, required this.article});
  final Article article;

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  WebViewController? controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.article.url!));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: controller == null
          ? Center(child: CircularProgressIndicator())
          : WebViewWidget(
              controller: controller!,
            ),
    );
  }
}
