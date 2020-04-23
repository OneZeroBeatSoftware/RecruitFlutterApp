import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recruit_app/entity/filter_data.dart';
import 'package:recruit_app/pages/jobs/city_filter.dart';
import 'package:recruit_app/utils/utils.dart';
import 'package:recruit_app/widgets/common_appbar_widget.dart';
import 'package:recruit_app/widgets/common_page_body.dart';
import 'package:recruit_app/style/profile_style.dart';
class WorkAddressResult{
	 String cityId;
	 String cityName;
	 String detailAddress;

	 WorkAddressResult(this.cityId, this.cityName, this.detailAddress);
}
class CompanyWorkAddress extends StatefulWidget {
	final String cityId;
	final String cityName;
	final String detailAddress;

  const CompanyWorkAddress({Key key, this.cityId='', this.cityName='', this.detailAddress=''}) : super(key: key);

	@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _State();
  }
}

class _State extends State<CompanyWorkAddress> {
	String _cityId;
	String _cityName;
	TextEditingController _detailController;

	@override
  void initState() {
    // TODO: implement initState
		_cityId=widget.cityId;
		_cityName=widget.cityName;
		_detailController=TextEditingController(text: widget.detailAddress);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
		if(_detailController!=null){
			_detailController.dispose();
		}
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
	    appBar: CommonAppBar(
		    leading: 'images/img_arrow_left_black.png',
		    leftListener: () {
			    Navigator.pop(context);
		    },
		    center: Container(
		       alignment: Alignment.center,
		       child: Column(
			       crossAxisAlignment: CrossAxisAlignment.center,
			       mainAxisAlignment: MainAxisAlignment.center,
			       children: <Widget>[
				       SizedBox(
					       height: ScreenUtil().setHeight(7),
				       ),
				       Text('工作地址',
					      maxLines: 1,
					      overflow: TextOverflow.ellipsis,
					      style: TextStyle(
						     fontSize: ScreenUtil().setSp(36), color: Color.fromRGBO(68,77,151,1), fontWeight: FontWeight.bold)),
				       SizedBox(
					       height: 3,
				       ),
			       ],
		       )),
		    backgroundColor: Color.fromRGBO(255, 255, 255, 1),
		    rightAction: Container(
			    margin: EdgeInsets.only(right: ScreenUtil().setWidth(48)),
			    child: GestureDetector(
				    onTap: () {
				    	FocusScope.of(context).requestFocus(FocusNode());
				    	if(_cityId==null||_cityId.isEmpty){
				    		Utils.showToast('请选择城市');
				    		return;
							}
				    	if(_detailController.text.isEmpty){
								Utils.showToast('请填写详细地址');
								return;
							}
				    	Navigator.pop(context,WorkAddressResult(_cityId, _cityName, _detailController.text));
				    },
				    child: Text("保存",
					    style: TextStyle(
					       color: Color.fromRGBO(57,57,57,1),
					       fontSize: ScreenUtil().setSp(36),
					       fontWeight: FontWeight.bold
					    ),
				    ),
			    ),
		
		    ),
	    ),
	    body: CommonPageBody(
		    children: <Widget>[
			    ProfileItem(title: "所在城市", value: _cityName.isEmpty?'请选择工作城市':_cityName, onClick: () {
				    chooseMap();
			    }),
			    ProfileInput(title: "详细地址", placeholder: '请填写详细地址',inputController: _detailController,)
		    ],
	    )
    );
  }
  
  chooseMap() {
		Navigator.push<FilterData>(
				context,
				MaterialPageRoute(
						builder: (context) => CityFilter(initId: _cityId,))).then((value){
			if (value != null){
				setState(() {
					_cityId=value.filterId;
					_cityName = value.filterName;
				});
			}
		});
//	  MenuListDialog.showMenu(context, DialogConfig (
//	     title: '请选择地图',
//	     menus: <String> [
//		     '人民币',
//		     '美金',
//	     ]
//
//	  )
//	  );
  }
	
}