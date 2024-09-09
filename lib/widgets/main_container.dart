import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  final String title;
  final Widget widget;
  final Function? onCloseScreen;

  const MainContainer(
      {Key? key, required this.title, required this.widget, this.onCloseScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned.fill(
        child: Image.asset(
          'assets/images/background-texture.png',
          repeat: ImageRepeat.repeat,
        ),
      ),
      Positioned.fill(child: Scaffold(
          appBar: createAppBar(), body: widget))
    ]));
  }

  AppBar createAppBar() {
    if (onCloseScreen == null) {
      return AppBar(title: Text(title));
    }
    return AppBar(
        title: Text(title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => onCloseScreen!(),
        ));
  }
}
