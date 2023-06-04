import 'package:flutter/material.dart';


class ParentChangeProfile extends StatefulWidget {
  const ParentChangeProfile({super.key});

  @override
  State<ParentChangeProfile> createState() => _ParentChangeProfileState();
}

class _ParentChangeProfileState extends State<ParentChangeProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Profile"),
      ),
    );
  }
}