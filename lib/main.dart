import 'dart:io';

import 'package:any_syntax_highlighter/any_syntax_highlighter.dart';
import 'package:flutter/material.dart';

import 'dart:math';
import 'package:simulate/simulate.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runSimulate(home: const App(), debugShowCheckedModeBanner: false);
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  MyApp createState() => MyApp();
}

class MyApp extends State<App> {
  late String quote;
  @override
  void initState() {
    super.initState();
    setState(() {
      var quotes = ["hay kamu", "hay aku"];
      quote = quotes[Random().nextInt(quotes.length)];
    });
  }

  @override
  Widget build(BuildContext context) {
    List menuTopBar = ["File", "Edit", "Selection", "View", "Go", "Run", "Terminal", "help"];
    List sideMenuBar = [Iconsax.search_status, Iconsax.folder, Iconsax.box];
    return ScaffoldSimulate(
      isShowFrame: false,
      backgroundColor: const Color.fromARGB(255, 24, 21, 27),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(35),
        child: MoveWindow(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(2),
                    child: Icon(
                      Iconsax.code,
                      color: Colors.white,
                    ),
                  ),
                  ...menuTopBar.map((res) {
                    return TextButton(
                      style: const ButtonStyle(),
                      onPressed: () {},
                      child: Text(
                        res,
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList(),
                  const Spacer(),
                  MinimizeWindowButton(colors: buttonColors),
                  MaximizeWindowButton(
                    colors: buttonColors,
                    animate: false,
                  ),
                  CloseWindowButton(colors: closeButtonColors),
                ],
              ),
              Container(
                height: 1,
                decoration: BoxDecoration(
                  color: Colors.grey.shade800,
                ),
              ),
            ],
          ),
        ),
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
              minWidth: MediaQuery.of(context).size.width,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // side bar
                Column(
                  children: [
                    ...sideMenuBar.map((res) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: Icon(
                          res,
                          color: Colors.white,
                        ),
                      );
                    }).toList(),
                    const Spacer(),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Iconsax.user,
                        color: Colors.white,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        Iconsax.setting,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                LayoutBuilder(builder: (BuildContext ctx, BoxConstraints constrains) {
                  print(constrains.maxWidth);
                  // ignore_for_file: unused_local_variable, duplicate_ignore
                  var text = """""";
                  var file = File("/home/hexaminate/Documents/HEXAMINATE/app/azka_studio_code/lib/main.dart");
                  if (file.existsSync()) {
                    text = file.readAsStringSync();
                  }
                  var getNumbers = [];
                  List array = text.split("\n");
                  for (var i = 0; i < array.length; i++) {
                    getNumbers.add(i + 1);
                  }
                  return ConstrainedBox(
                    constraints: BoxConstraints(minHeight: MediaQuery.of(ctx).size.height, minWidth: MediaQuery.of(ctx).size.width - 44),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     Padding(
                        //       padding: EdgeInsets.all(2),
                        //       child: Icon(
                        //         Iconsax.code,
                        //         color: Colors.white,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        Expanded(
                          child: SingleChildScrollView(
                            physics: const AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(minHeight: MediaQuery.of(ctx).size.height, minWidth: MediaQuery.of(ctx).size.width - 44),
                              child: Stack(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            ...getNumbers.map((e) {
                                              var getNumber = "";
                                              if (e.toString().length == 1) {
                                                getNumber = "  ${e.toString()}";
                                              } else {
                                                getNumber = e.toString();
                                              }
                                              return Text(
                                                getNumber,
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.right,
                                              );
                                            }).toList()
                                          ],
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ...array.map((e) {
                                            // return HighlightView(
                                            //   // The original code to be highlighted
                                            //   e.toString(),

                                            //   // Specify language
                                            //   // It is recommended to give it a value for performance
                                            //   language: 'dart',

                                            //   // Specify padding
                                            //   padding: EdgeInsets.all(12),

                                            //   // Specify text style
                                            //   textStyle: TextStyle(
                                            //     fontFamily: 'My awesome monospace font',
                                            //     fontSize: 16,
                                            //   ),
                                            // );
                                            return AnySyntaxHighlighter(
                                              e.toString(),
                                              padding: 0,
                                              isSelectableText: true,
                                            );
                                            return Text(
                                              e.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Positioned(
                                    right: 0,
                                    child: Container(
                                      height: MediaQuery.of(context).size.height,
                                      width: 100,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ...array.map((e) {
                                          
                                            return Text(
                                              e.toString(),
                                              style: TextStyle(color: Colors.white, fontSize: 3),
                                            );
                                          }).toList(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
          );
        },
      ),
    );
  }
}
