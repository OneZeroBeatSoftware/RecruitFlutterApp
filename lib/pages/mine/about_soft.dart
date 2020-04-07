import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:package_info/package_info.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/web_view.dart';

class AboutSoft extends StatefulWidget {
  @override
  _AboutSoftState createState() => _AboutSoftState();
}

class _AboutSoftState extends State<AboutSoft> {
  PackageInfo _packageInfo=PackageInfo(appName: 'JobPin',version: '1.0.0',packageName: 'com.recruit.recruit_app',buildNumber: '1',);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PackageInfo.fromPlatform().then((PackageInfo packageInfo) {
      setState(() {
        _packageInfo = packageInfo;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
          '关于',
          style: TextStyle(
              color: Color.fromRGBO(68, 77, 151, 1),
              fontSize: ScreenUtil().setSp(36),
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setWidth(48),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: ScreenUtil().setWidth(72),
              ),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15),),),
                child: Image.asset(
                  'images/Icon-App-76x76@2x.png',
                  width: ScreenUtil().setWidth(148),
                  height: ScreenUtil().setWidth(148),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(24),
              ),
              Text(
                _packageInfo.appName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(32),
                  color: Color.fromRGBO(20, 20, 20, 1),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(8),
              ),
              Text(
                'version ${_packageInfo.version}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: ScreenUtil().setSp(24),
                  color: Color.fromRGBO(176, 181, 180, 1),
                ),
              ),
              SizedBox(
                height: ScreenUtil().setWidth(60),
              ),
              GestureDetector(
                behavior: HitTestBehavior.opaque,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                      top: BorderSide(
                        color: Color.fromRGBO(159, 199, 235, 1),
                        width: ScreenUtil().setWidth(1),
                      ),
                    ),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: ScreenUtil().setWidth(50),
                  ),
                  margin: EdgeInsets.only(
                    bottom: ScreenUtil().setWidth(80),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          '用户协议及隐私政策',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                              color: Color.fromRGBO(95, 94, 94, 1),
                              fontSize: ScreenUtil().setSp(28)),
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil().setWidth(20),
                      ),
                      Image.asset(
                        'images/img_arrow_right_blue.png',
                        width: ScreenUtil().setWidth(10),
                        height: ScreenUtil().setWidth(20),
                        fit: BoxFit.cover,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => WebViewWidget(title: '用户协议及隐私政策',url: 'https://www.huaweicloud.com/declaration/hcpn_eula.html',),),);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
