import 'package:flutter/material.dart';
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final child = ChildWidget(key: GlobalKey());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          child,
          ElevatedButton(
              onPressed: () {
                ((child.key as GlobalKey).currentState!
                        as _ChildWidgetState)
                    .someFunction();
              },
              child: Text("childWidget someFunction"))
        ],
      ),
    );
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({Key? key}) : super(key: key);

  @override
  _ChildWidgetState createState() => _ChildWidgetState();
}

class _ChildWidgetState extends State<ChildWidget> {
  void someFunction() {
    print("childWidget someFunction");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}