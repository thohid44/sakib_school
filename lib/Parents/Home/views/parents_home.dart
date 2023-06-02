

import 'package:flutter/material.dart';

class ParentsHome extends StatefulWidget {
  const ParentsHome({super.key});

  @override
  State<ParentsHome> createState() => _ParentsHomeState();
}

class _ParentsHomeState extends State<ParentsHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Parent's Home"),
      ),
    ); 
  }
}
