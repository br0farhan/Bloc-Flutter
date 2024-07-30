import 'package:bloc_flutter/pages/center_widget.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  const DataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 200,
      color: Colors.red,
      child: const CenterWidget(),
    );
  }
}
