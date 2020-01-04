import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_attr.dart';
import 'package:recruit_app/pages/boss/company_info_item.dart';

class CompanyInfo extends StatefulWidget {
  @override
  _CompanyInfoState createState() {
    // TODO: implement createState
    return _CompanyInfoState();
  }
}

class _CompanyInfoState extends State<CompanyInfo> {
  List<CompanyAttr> _attrList = CompanyAttrList.loadAttrs();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        leading: IconButton(
            icon: Image.asset(
              'images/ic_back_arrow.png',
              width: 24,
              height: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
        centerTitle: true,
        title: Text('公司信息',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
                wordSpacing: 1,
                letterSpacing: 1,
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(37, 38, 39, 1))),
      ),
      body: SafeArea(
        top: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 18, bottom: 18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text('完善公司信息',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              wordSpacing: 2,
                              letterSpacing: 2,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(37, 38, 39, 1))),
                      SizedBox(
                        height: 8,
                      ),
                      Text('公司LOGO是构成完整的品牌概念的要素，完善后有利于品牌建设。',
                          style: const TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: 14,
                            color: Color.fromRGBO(77, 78, 79, 1),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Text('完善程度5%',
                          style: const TextStyle(
                            wordSpacing: 1,
                            letterSpacing: 1,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color.fromRGBO(37, 38, 39, 1),
                          )),
                      SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        height: 22.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          child: LinearProgressIndicator(
                            value: 0.05,
                            backgroundColor: Color.fromRGBO(241, 241, 244, 1),
                            valueColor: AlwaysStoppedAnimation<Color>(
                              Color.fromRGBO(255, 46, 72, 1),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Text('基本信息0/5',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    wordSpacing: 2,
                                    letterSpacing: 2,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromRGBO(37, 38, 39, 1))),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          MaterialButton(
                            color: Color.fromRGBO(70, 192, 182, 1),
                            onPressed: () {},
                            textColor: Colors.white,
                            child: Text("继续完善"),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 12),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        height: 1,
                        color: Color.fromRGBO(242, 242, 242, 1),
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          if (index < _attrList.length) {
                            return CompanyInfoItem(
                              companyAttr: _attrList[index],
                              index: index,
                            );
                          }
                          return null;
                        },
                        shrinkWrap: true,
                        itemCount: _attrList.length,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
