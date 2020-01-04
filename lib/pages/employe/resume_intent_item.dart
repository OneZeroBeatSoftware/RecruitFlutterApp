import 'package:flutter/material.dart';

class ResumeIntentItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text('全栈工程师，福州',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        wordSpacing: 1,
                        letterSpacing: 1,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(40, 41, 42, 1))),
              ),
              SizedBox(width: 10),
              Text('20-30k',
                  style: const TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(0, 162, 145, 1))),
            ],
          ),
          SizedBox(height: 10),
          Text('行业不限',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 14,
                  color: Color.fromRGBO(107, 108, 109, 1))),
        ],
      ),
    );
  }
}
