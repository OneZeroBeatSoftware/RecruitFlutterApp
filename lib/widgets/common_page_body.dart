import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/widgets/common_appbar_divider.dart';

class CommonPageBody extends StatelessWidget {
	List<Widget> children;
	CommonPageBody({@required this.children});
	@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
	    top: false,
	    child: Column(
		    mainAxisAlignment: MainAxisAlignment.start,
		    crossAxisAlignment: CrossAxisAlignment.stretch,
		    children: <Widget>[
			    CommonAppBarDivider(),
			    Expanded(
				    child: SingleChildScrollView(
					    physics: BouncingScrollPhysics(),
					    child: Padding(
					       padding: EdgeInsets.only(
					       left: ScreenUtil().setWidth(48), right: ScreenUtil().setWidth(48), top: ScreenUtil().setWidth(54), bottom: ScreenUtil().setWidth(18)),
					       child: Column(
					       mainAxisAlignment: MainAxisAlignment.start,
					       crossAxisAlignment: CrossAxisAlignment.stretch,
					       children: this.children
					    )
					    ),
				    ),
			    )
		    ],
	    ),
    );
  }
}