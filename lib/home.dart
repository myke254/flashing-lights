import 'dart:async';
import 'package:flutter/material.dart';
import 'package:test/main.dart';

var screensize;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List clrs = List.generate(
      300,
      (index) => Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1));
  ccc() {
    setState(() {
      clrs = List.generate(
          300,
          (index) => Color.fromRGBO(random.nextInt(256), random.nextInt(256),
              random.nextInt(256), 1));
    });
  }

  var newClr;
  Timer? timer;
  newColor() {
    setState(() {
      newClr = Color.fromRGBO(
          random.nextInt(256), random.nextInt(256), random.nextInt(256), 1);
    });
  }

  @override
  void initState() {
    timer = Timer.periodic(Duration(milliseconds: 800), (Timer t) => ccc());
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    screensize = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.redAccent,
              title: Text('Abigael\'s Favorite'),
            ),
            body: GridView.builder(
                itemCount: 300,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: screensize.width > 720 ? 15 : 7),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        newColor();
                        setState(() {
                          clrs[index] = newClr;
                        });
                      },
                      child: Card(
                        color: clrs[index],
                        elevation: 20,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120)),
                      ),
                    ),
                  );
                })));
  }
}
