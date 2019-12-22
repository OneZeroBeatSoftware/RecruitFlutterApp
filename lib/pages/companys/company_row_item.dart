import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruit_app/model/company_list.dart';

class CompanyRowItem extends StatelessWidget {
  final Company company;
  final int index;
  final bool lastItem;

  const CompanyRowItem({Key key, this.company, this.index, this.lastItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final companyItem =  Container(
      padding: const EdgeInsets.all(15),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(4)),
            child: Image.asset('images/ic_ask_resume_action.png',
                width: 40, height: 40, fit: BoxFit.cover),
          ),
          SizedBox(width: 15),
          Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(company.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  SizedBox(height: 8),
                  Text('${company.address}',
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: 12,
                          color: Colors.grey[600])),
                  SizedBox(height: 8),
                  Text('${company.status} ${company.scale} ${company.type}',
                      style: TextStyle(
                          wordSpacing: 1,
                          letterSpacing: 1,
                          fontSize: 12,
                          color: Colors.grey[600])),
                  SizedBox(height: 8),
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: new BoxDecoration(
                        color: Color.fromRGBO(70, 192, 182, 0.2),
                        borderRadius: new BorderRadius.circular(4.0),
                      ),
                      child: Text(company.purpose,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 10,
                              color: Color.fromRGBO(70, 192, 182, 1)))),
                  SizedBox(height: 5),
                  Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: new BorderRadius.circular(4.0),
                      ),
                      child: Text(company.introduce,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 10, color: Colors.grey[400]))),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                    text: company.recruitNum,
                                    style: const TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Color.fromRGBO(
                                            70, 192, 182, 1))),
                                TextSpan(
                                    text: '个热招职位 ${company.bossNum}个BOSS',
                                    style: TextStyle(
                                        wordSpacing: 1,
                                        letterSpacing: 1,
                                        fontSize: 12,
                                        color: Colors.grey[400]))
                              ]))),
                      Image.asset('images/ic_arrow_gray.png',
                          width: 10, height: 10, fit: BoxFit.cover)
                    ],
                  )
                ],
              ))
        ],
      ),
    );

//    if (lastItem) {
//      return card;
//    }
    return Column(
      children: <Widget>[
        companyItem,
        Divider(
          height: 3,
          color: Colors.transparent,
        ),
      ],
    );
  }
}
