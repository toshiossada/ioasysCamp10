import 'package:flutter/material.dart';

class HomeStore extends ValueNotifier<bool>{
  HomeStore() : super(false);

  void setLoad(bool v) {
    value = v;
  }
}
