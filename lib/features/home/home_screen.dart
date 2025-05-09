import 'package:devus/common/widgets/column_custom.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ColumnCustom(
            customCrossAxisAlignment: CrossAxisAlignment.center,
            customMainAxisAlignment: MainAxisAlignment.center,
            customColumnChildrens: [Text('Here it its!')],
          ),
        ),
      ),
    );
  }
}
