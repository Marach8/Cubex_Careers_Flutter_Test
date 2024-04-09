import 'package:flutter/material.dart';

double getScreenWidth(BuildContext context )
  => MediaQuery.of(context).size.width;

double getScreenHeight(BuildContext context) 
  => MediaQuery.of(context).size.height;