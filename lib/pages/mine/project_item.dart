import 'package:flutter/material.dart';
import 'package:recruit_app/model/mine_project_list.dart';

class ProjectItem extends StatelessWidget {
  final MineProjectData projectData;
  final int index;

  const ProjectItem({Key key, this.projectData, this.index}) : super(key: key);

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
                child: Text(projectData.projectName,
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
              Text(projectData.during,
                  style: TextStyle(
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontSize: 14,
                      color: Color.fromRGBO(159, 160, 161, 1))),
              SizedBox(width: 15),
              Image.asset('images/ic_arrow_gray.png',
                  width: 10, height: 10, fit: BoxFit.cover)
            ],
          ),
          SizedBox(height: 5),
          Text('${projectData.duty}',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: 14,
                  color: Color.fromRGBO(136, 138, 138, 1))),
          SizedBox(height: 8),
          Text('${projectData.content}',
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
