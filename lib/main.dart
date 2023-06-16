import 'package:flutter/material.dart';

void main(){
  runApp(cantinafood());
}

class cantinafood extends StatelessWidget {
  const cantinafood({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CantinaFood",
      theme: ThemeData.dark(),
      home: Container(
        child: Text("CantinaFood",style: TextStyle(color:Colors.blue, fontSize: 100,  ), textAlign: TextAlign.center,),
      ),
    );
  }
}

