import 'package:demo/customBannerAd.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<HomePage> createState()=> _HomePage();

  }

class _HomePage extends State<HomePage>{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mobile Ads"),
      ),
      body: Column(children: [
        CustomBannerAd()
      ],),
    );
  }
}