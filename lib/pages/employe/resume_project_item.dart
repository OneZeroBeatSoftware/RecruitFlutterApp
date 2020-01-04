import 'package:flutter/material.dart';

class ResumeProjectItem extends StatelessWidget {

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
                child: Text('智清视讯',
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
                width: 5,
              ),
              Text('2014-至今',
                  style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(159, 160, 161, 1))),
            ],
          ),
          SizedBox(height: 5),
          Text('产品研发',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 14,
                  color: Color.fromRGBO(136, 138, 138, 1))),
          SizedBox(height: 10),
          Text('主导运维自动化平台的搭建与开发，包括自动化发布、分布式日志收集分析、持续集成等系统的开发与维护，提升云平台的运维效率；负责ECS、OSS等常用阿里云产品的维护工作；与开发工程师配合，解决线上的业务告警，并提供解决方案。',
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
