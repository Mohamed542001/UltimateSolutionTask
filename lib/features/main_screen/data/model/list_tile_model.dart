import 'package:flutter/cupertino.dart';

class ListTileModel{
  final String title;
  final IconData icon;
  bool? isSelected;
  bool? hasExpanded;

  ListTileModel({required this.title, required this.icon,this.isSelected=false,this.hasExpanded=false});
}