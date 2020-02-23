import 'package:flutter/material.dart';

abstract class ListItemCreator<T> {
  Widget bind(int position, T data);
}