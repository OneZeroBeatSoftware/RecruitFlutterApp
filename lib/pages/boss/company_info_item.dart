import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_attr.dart';

class CompanyInfoItem extends StatelessWidget {
  final CompanyAttr companyAttr;
  final int index;

  const CompanyInfoItem({Key key, this.companyAttr, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 25,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text(
                  '${companyAttr.attr}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    wordSpacing: 1,
                    letterSpacing: 1,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(185, 187, 189, 1),
                  ),
                ),
              ),
              SizedBox(width: 15),
              Text(
                '${companyAttr.status}',
                style: const TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 16,
                  color: Color.fromRGBO(215, 217, 218, 1),
                ),
              ),
              SizedBox(width: 15),
              Image.asset('images/ic_arrow_gray.png',
                  width: 15, height: 15, fit: BoxFit.cover)
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            height: 1,
            color: Color.fromRGBO(242, 242, 242, 1),
          ),
        ],
      );
  }
}
