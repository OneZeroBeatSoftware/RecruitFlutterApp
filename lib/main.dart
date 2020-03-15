import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/job_model.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/pages/recruit_app.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<IdentityModel>(
            create: (_) => IdentityModel(),
          ),
          ChangeNotifierProvider<UserModel>(
            create: (_) => UserModel(),
          ),
          ChangeNotifierProvider<JobModel>(
            create: (_) => JobModel(),
          ),
        ],
        child: RecruitApp(),
      ),
    );
