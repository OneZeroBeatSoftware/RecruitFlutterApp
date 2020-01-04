import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recruit_app/model/identity_model.dart';
import 'package:recruit_app/pages/recruit_app.dart';

void main() => runApp(ChangeNotifierProvider<IdentityModel>(create: (context)=>IdentityModel(),child: RecruitApp(),));
