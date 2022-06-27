import 'package:flutter/material.dart';
import 'package:torch_light/torch_light.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> turnOnFlash(BuildContext context) async {
    try {
      print("Turning on flashlight");
      await TorchLight.enableTorch();
    } on Exception catch(_) {
      print("Could not enable flashlight");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {Navigator.push(context, MaterialPageRoute(builder: (context) => torchOn())); turnOnFlash(context);},
            child: Container(
            color: Colors.black,
            child: Image.asset('assets/torchOff.png', height: 1200,)
        )
        )
      ),
    );
  }
}

class torchOn extends StatelessWidget{
  Future<void> turnOffFlash(BuildContext context) async{
    try {
    print("Turning off flashlight");
    await TorchLight.disableTorch();
  } on Exception catch(_) {
      print("Could not turn off flashlight");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {Navigator.pop(context); turnOffFlash(context);},
          child: Container(
            color: Colors.black,
            child: Image.asset('assets/torchOn.png', height: 1200)
        )
        )
      )
    );
  }
}