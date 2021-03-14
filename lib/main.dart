import 'package:appGeneratedFromJson/text_to.dart';
import "package:appGeneratedFromJson/widget_to_generate_json.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String homeView = await rootBundle.loadString("assets/home_view.json");
  String container = await rootBundle.loadString("assets/container.json");
  String text = await rootBundle.loadString("assets/text.json");
  String gridView = await rootBundle.loadString("assets/grid_view.json");
  String button = await rootBundle.loadString("assets/button.json");

  runApp(MyApp(JsonTo(homeView, container, text, gridView, button)));
}

class MyApp extends StatelessWidget {
  JsonTo jsontTo;
  MyApp(this.jsontTo);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: WidgetToGenerateJson(jsonWidget: jsontTo.homeView),
        routes: {
          "/home": (context) =>
              WidgetToGenerateJson(jsonWidget: jsontTo.homeView),
          "/container": (context) =>
              WidgetToGenerateJson(jsonWidget: jsontTo.container),
          "/text": (context) => WidgetToGenerateJson(jsonWidget: jsontTo.text),
          "/grid_view": (context) =>
              WidgetToGenerateJson(jsonWidget: jsontTo.gridView),
          "/button": (context) =>
              WidgetToGenerateJson(jsonWidget: jsontTo.button)
        });
  }
}
