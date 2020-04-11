import 'package:flutter/material.dart';
import 'package:flutter_brightness_setting/test/sample_content_page.dart';
import 'package:flutter_brightness_setting/widget/background_color_widget.dart';

class MaterialSettingPage extends StatefulWidget {
  @override
  _MaterialSettingPageState createState() => _MaterialSettingPageState();
}

class _MaterialSettingPageState extends State<MaterialSettingPage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool isDark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //for better presentation, change if opacity of AppBar is needed
        backgroundColor: isDark
            ? Theme.of(context)
                .primaryColorDark
                .withOpacity(_animationController.value)
            : Theme.of(context)
                .primaryColor
                .withOpacity(_animationController.value),
        actions: <Widget>[
          IconButton(
            icon: Icon(isDark ? Icons.brightness_high : Icons.brightness_low),
            onPressed: () {
              this.isDark = !this.isDark;
              _restartAnimation();
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          //place it to the bottom
          BackgroundColorWidget(
            alignment: Alignment.topRight,
            animationController: _animationController,
            isDark: this.isDark,
            lightColor: Color(0xFFEEEEEE),
            darkColor: Color(0xFF1A1A1A),
          ),
          Positioned.fill(
              //for better presentation, change if opacity of content background is needed
              child: Container(
            color: isDark
                ? Color(0xFF1A1A1A).withOpacity(_animationController.value)
                : Color(0xFFEEEEEE).withOpacity(_animationController.value),
            child: SampleContentPage(
              isDark: this.isDark,
            ),
          ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _initAnimationController();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  ///
  /// 1. to init [AnimationController]
  /// 2. set to complete at first
  /// 3. addListener to let it setState ( if not much widget on same page, recommend this)  or other way to force update the animation
  ///
  void _initAnimationController() {
    _animationController = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    _animationController.value = 1; //default set as completed animation
    _animationController.addListener(() {
      setState(() {});
    });
  }

  ///
  /// 1. reset state (set value to zero)
  /// 2. play the animation
  void _restartAnimation() {
    _animationController.reset();
    _animationController.forward();
  }
}
