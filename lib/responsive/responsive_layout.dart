import 'package:easy_communication/providers/user_provider.dart';
import 'package:easy_communication/utils/global_variable.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RespnsiveLayout extends StatefulWidget {
  final Widget mobileScreenLayout;
  final Widget webScreenLayout;
  const RespnsiveLayout({
    Key? key,
    required this.mobileScreenLayout,
    required this.webScreenLayout,
  }) : super(key: key);

  @override
  State<RespnsiveLayout> createState() => _RespnsiveLayoutState();
}

class _RespnsiveLayoutState extends State<RespnsiveLayout> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.of(context, listen: false);
    await _userProvider.refreshUser();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > webScreenSize) {
        // 600 can be changed to 900 if you want to display tablet screen with mobile screen layout
        return widget.webScreenLayout;
      }
      return widget.mobileScreenLayout;
    });
  }
}
