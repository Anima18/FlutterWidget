import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget/components/listView_widget.dart';
import 'element/form/form_main.dart';
import 'element/form/input_widget.dart';
import 'element/form/checkbox_widget.dart';
import 'element/form/button_widget.dart';
import 'element/form/text_widget.dart';
import 'element/form/radio_widget.dart';
import 'element/form/switch_widget.dart';
import 'element/frame/frame_main.dart';
import 'element/frame/align_widget.dart';
import 'element/frame/stack_widget.dart';
import 'element/frame/layout_widget.dart';
import 'element/frame/table_widget.dart';
import 'element/media/media_main.dart';
import 'element/media/image_widget.dart';
import 'components/navigation_widget.dart';
import 'components/listView_widget.dart';
import 'components/bar_main.dart';
import 'components/appBar_widget.dart';
import 'components/tab_widget.dart';
import 'components/dialog_main.dart';
import 'components/grid_widget.dart';
import 'components/scroll/scroll_main.dart';
import 'components/scroll/singleChildScrollView_widget.dart';
import 'components/scroll/customScrollView_widget.dart';
import 'components/scroll/scrollVIew_listener.dart';
import 'components/menu_widget.dart';
import 'components/picker_main.dart';
import 'components/progress_widget.dart';
import 'custom/refreshListView_test.dart';
import 'custom/stateView_test.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.

        primarySwatch: Colors.blue,
      ),
      routes: {
        'form_main': (context) => FormMain(),
        'input_widget': (context) => InputWidget(),
        'checkbox_widget': (context) => CheckBoxWidget(),
        'button_widget': (context) => ButtonWidget(),
        'text_widget': (context) => TextWidget(),
        'radio_widget': (context) => RadioWidget(),
        'switch_widget': (context) => SwitchWidget(),
        'frame_main': (context) => FrameMain(),
        'align_widget': (context) => AlignWidget(),
        'stack_widget': (context) => StackWidget(),
        'layout_widget': (context) => LayoutWidget(),
        'table_widget': (context) => TableWidget(),
        'media_main': (context) => MediaMain(),
        'image_widget': (context) => ImageWidget(),
        'navigation_widget': (context) => NavigationWidget(),
        'listView_widget': (context) => ListViewDemoWidget(),
        'bar_main': (context) => BarMain(),
        'appBar_widget': (context) => AppBarWidget(),
        'tab_widget': (context) => TabWidget(),
        'dialog_main': (context) => DialogMain(),
        'grid_widget': (context) => GridWidget(),
        'scroll_main': (context) => ScrollMain(),
        'singleChildScrollView_widget': (context) => SingleChildScrollViewWidget(),
        'customScrollView_widget': (context) => CustomScrollViewTestRoute(),
        'scrollVIew_listener': (context) => ScrollControllerTestRoute(),
        'menu_widget': (context) => MenuMain(),
        'picker_main': (context) => PickerMain(),
        'progress_widget': (context) => ProgressMain(),
        'refresh_listView': (context) => RefreshListViewTest(),
        'stateView_test': (context) => StateViewTest(),
      },
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            // Column is also a layout widget. It takes a list of children and
            // arranges them vertically. By default, it sizes itself to fit its
            // children horizontally, and tries to be as tall as its parent.
            //
            // Invoke "debug painting" (press "p" in the console, choose the
            // "Toggle Debug Paint" action from the Flutter Inspector in Android
            // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
            // to see the wireframe for each widget.
            //
            // Column has various properties to control how it sizes itself and
            // how it positions its children. Here we use mainAxisAlignment to
            // center the children vertically; the main axis here is the vertical
            // axis because Columns are vertical (the cross axis would be
            // horizontal).
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Element:',
                style: TextStyle(fontSize: 20),
              ),
              itemView(context, "From", "form_main"),
              itemView(context, "Frame", "frame_main"),
              itemView(context, "Media", "media_main"),

              SizedBox(height: 24,),
              Text(
                'Components:',
                style: TextStyle(fontSize: 20),
              ),
              itemView(context, "Navigation", "navigation_widget"),
              itemView(context, "List", "listView_widget"),
              itemView(context, "Card", ""),
              itemView(context, "Bar", "bar_main"),
              itemView(context, "Dialog", "dialog_main"),
              itemView(context, "Scaffoid", ""),
              itemView(context, "Grid", "grid_widget"),
              itemView(context, "Scroll", "scroll_main"),
              itemView(context, "Tab", "tab_widget"),
              itemView(context, "Menu", "menu_widget"),
              itemView(context, "Pick", "picker_main"),
              itemView(context, "Chip", ""),
              itemView(context, "Panel", ""),
              itemView(context, "Progress", "progress_widget"),

              SizedBox(height: 24,),
              Text(
                'Custom:',
                style: TextStyle(fontSize: 20),
              ),
              itemView(context, "RefreshListView", "refresh_listView"),
              itemView(context, "StateView", "stateView_test"),
            ],
          ),
        ),
      ),
    );
  }

  Widget itemView(BuildContext context, String title, String pageRoute) {
    return Container(
      width: double.infinity,
      child: OutlineButton(
        child: Text(title),
        onPressed: () {
          if(pageRoute.isNotEmpty) {
            Navigator.pushNamed(context, pageRoute);
          }
        },
      ),
    );
  }
}
