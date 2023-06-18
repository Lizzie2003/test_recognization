// ignore_for_file: unused_element, unused_local_variable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'homepage.dart';
// ignore: unused_import
import 'loginpage.dart';
// ignore: unused_import
import 'profilepage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tp_reconnaissance/Screen/recognization_page.dart';
import 'package:tp_reconnaissance/Utils/image_cropper_page.dart';
import 'package:tp_reconnaissance/Utils/image_picker_class.dart';
import 'package:tp_reconnaissance/Widgets/modal_dialog.dart';

//import 'Utils/image_cropper_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, widget) {
        Widget error = const Text('...rendering error...');
        if (widget is Scaffold || widget is Navigator) {
          error = Scaffold(body: Center(child: error));
        }
        ErrorWidget.builder = (errorDetails) => error;
        if (widget != null) return widget;
        throw ('widget is null');
      },
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/recognization': (context) => const RecognizePage(),
        '/profile': (context) => ProfilePage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        
        /*colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,*/
      ),
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: const Color.fromARGB(255, 130, 171, 194),
            child: Column(
              children: [ 
                Expanded(
                  // ignore: avoid_unnecessary_containers
                  child: Container(
                    child: Navigator(
                      onGenerateRoute: (settings) {
                        if (settings.name == '/') {
                          return MaterialPageRoute(
                            builder: (context) => HomePage(),
                          );
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 148, 205, 238),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.login),
                          color: const Color.fromARGB(255, 117, 21, 243),
                          onPressed: () {
                            Navigator.pushNamed(context, '/login');
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.text_fields),
                          color: Color.fromARGB(255, 212, 34, 189),
                          onPressed: () {
                            Navigator.pushNamed(context, '/recognization');
                          },
                        ),
                      ),
                      Builder(
                        builder: (context) => IconButton(
                          icon: const Icon(Icons.person),
                          color: const Color.fromARGB(255, 4, 163, 123),
                          onPressed: () {
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
    
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          imagePickerModal(context, onCameraTap: () {
            var log = "camera";
            pickImage(source: ImageSource.camera).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => RecognizePage(
                          path: value,
                        ),
                      ),
                    );
                  }
                });
              }
            });
          }, onGallerieTap: () {
            var log = "gallerie";
            pickImage(source: ImageSource.gallery).then((value) {
              if (value != '') {
                imageCropperView(value, context).then((value) {
                  if (value != '') {
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (_) => RecognizePage(
                          path: value,
                        ),
                      ),
                    );
                  }
                });
              }
            });
          });
        },
        tooltip: 'Increment',
        label: const Text("Scan photo"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
