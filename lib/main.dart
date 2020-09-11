import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/company_model.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/model/job_model.dart';
import 'package:recruit_app/model/user_model.dart';
import 'package:recruit_app/pages/recruit_app.dart';
import 'package:recruit_app/utils/web_socket_manager.dart';
EventBus eventBus = EventBus();
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
          ChangeNotifierProvider<CompanyModel>(
            create: (_) => CompanyModel(),
          ),
          ChangeNotifierProvider<WebSocketManager>(
            create: (_) => WebSocketManager(),
          ),
        ],
        child: RecruitApp(),
      ),
    );
