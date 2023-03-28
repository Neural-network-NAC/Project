// ignore_for_file: depend_on_referenced_packages

import 'package:project/Floorplan/core/core/view/view/shared/global.dart';
import 'package:project/Floorplan/core/core/view/view/widgets/reset_button_widget.dart';
import 'package:project/Floorplan/core/core/viewmodels/floorplan_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:project/Floorplan/core/core/view/view/widgets/appbar_widget.dart';
import 'package:project/Floorplan/core/core/view/view/widgets/gridview_widget.dart';
import 'package:project/Floorplan/core/core/view/view/widgets/overlay_widget.dart';
import 'package:project/Floorplan/core/core/view/view/widgets/raw_gesture_detector_widget.dart';

class FloorPlanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_declarations
    final model = Provider.of<FloorPlanModel>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBarWidget(),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        child: Container(
          color: Global.blue,
          child: Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                RawGestureDetectorWidget(
                  child: GridViewWidget(),
                ),
                model.hasTouched ? ResetButtonWidget() : OverlayWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
