import 'package:dynamic_widget/dynamic_widget.dart';
import 'package:dynamic_widget/dynamic_widget/basic/dynamic_widget_json_exportor.dart';
import 'package:flutter/material.dart';

class WidgetToGenerateJson extends StatelessWidget {
  final String jsonWidget;
  WidgetToGenerateJson({@required this.jsonWidget, Key key}) : super(key: key);

  DynamicWidgetJsonExportor _exportor;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _buildWidget(context),
      builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
        if (snapshot.hasError) {
          print(snapshot.error);
        }
        return snapshot.hasData
            ? _exportor = DynamicWidgetJsonExportor(
                child: snapshot.data,
              )
            : Text("Loading...");
      },
    );
  }

  Future<Widget> _buildWidget(BuildContext context) async {
    return DynamicWidgetBuilder.build(
        jsonWidget, context, new DefaultClickListener(context));
  }
}

class DefaultClickListener implements ClickListener {
  BuildContext context;

  DefaultClickListener(this.context);

  @override
  void onClicked(String event) {
    if (event.contains("/")) {
      moveToOtherScreen(event);
    } else {
      print(event);
    }
  }

  void moveToOtherScreen(String navigatorName) {
    Navigator.pushNamed(context, navigatorName);
  }
}
