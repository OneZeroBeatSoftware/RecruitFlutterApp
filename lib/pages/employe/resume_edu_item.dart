import 'package:flutter/material.dart';

class ResumeEduItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text('福建省厦门市集美大学',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(37, 38, 39, 1))),
              ),
              SizedBox(
                width: 8,
              ),
              Text('2011-2015',
                  style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(159, 160, 161, 1))),
            ],
          ),
          SizedBox(height: 5),
          Text('本科•计算机科学与技术',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 14,
                  color: Color.fromRGBO(136, 138, 138, 1))),
        ],
      ),
    );
  }
}
