import 'package:flutter/material.dart';

import 'ui/screens/profile.dart';
import 'data/profile_data.dart';

const profile = ronanProfile;
 
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(data: profile,),
  ));
}
