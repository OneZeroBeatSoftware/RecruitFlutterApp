import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'common_appbar_widget.dart';

class WebViewWidget extends StatelessWidget {
  final String title;
  final String url;

  const WebViewWidget({Key key, this.title = '', this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(url);
    return Scaffold(
      appBar: CommonAppBar(
        border: Border(
          bottom: BorderSide(
              color: Color.fromRGBO(159, 199, 235, 1),
              width: ScreenUtil().setWidth(1)),
        ),
        leading: 'images/img_arrow_left_black.png',
        leftListener: () {
          Navigator.pop(context);
        },
        center: Text(
          title,
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: WebView(
          initialUrl: url,
          javascriptMode: JavascriptMode.unrestricted,
          navigationDelegate: (NavigationRequest request) {
            if (request.url.startsWith('https://') ||
                request.url.startsWith('http://')) {
              return NavigationDecision.navigate;
            }
            return NavigationDecision.prevent;
          },
        ),
      ),
    );
  }
}
