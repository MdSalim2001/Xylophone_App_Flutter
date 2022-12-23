import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(const XylophoneApp());

class XylophoneApp extends StatefulWidget {
  const XylophoneApp({super.key});

  @override
  State<XylophoneApp> createState() => _XylophoneAppState();
}

bool _iconBool = false;
IconData _iconLight = Icons.wb_sunny;
IconData _iconDark = Icons.nights_stay;

ThemeData _lightTheme = ThemeData(
  primarySwatch: Colors.amber,
  brightness: Brightness.light,
);
ThemeData _darkTheme = ThemeData(
  primarySwatch: Colors.red,
  //brightness: Brightness.dark,
);

List<Color> darkColors = [
  Colors.black,
  Colors.black87,
  Colors.black54,
  Colors.black45,
  Colors.black38,
  Colors.black26,
  Colors.black12
];
List<Color> lightColors = [
  Colors.red,
  Colors.orange,
  Colors.yellow,
  Colors.green,
  Colors.blue,
  Colors.indigo,
  Colors.purple
];

var colorNow = _iconBool ? darkColors : lightColors;

class _XylophoneAppState extends State<XylophoneApp> {
  Expanded colorKey({required Color color, required int num}) {
    return Expanded(
      child: Container(
        color: color,
        child: TextButton(
          onPressed: () {
            final player = AudioPlayer();
            player.play(AssetSource('note$num.wav'));
          },
          child: const Text(""),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.system,
      theme: _iconBool ? _darkTheme : _lightTheme,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(
            Icons.music_note,
            color: Colors.white,
          ),
          title: const Center(
            child: Text(
              "Xylophone",
              style: TextStyle(color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
              color: Colors.white,
              onPressed: () {
                setState(() {
                  _iconBool = !_iconBool;
                  colorNow = _iconBool ? darkColors : lightColors;
                });
              },
              icon: Icon(_iconBool ? _iconDark : _iconLight),
            )
          ],
          backgroundColor: Colors.blueGrey[900],
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              colorKey(
                color: colorNow[0],
                num: 1,
              ),
              colorKey(
                color: colorNow[1],
                num: 2,
              ),
              colorKey(
                color: colorNow[2],
                num: 3,
              ),
              colorKey(
                color: colorNow[3],
                num: 4,
              ),
              colorKey(
                color: colorNow[4],
                num: 5,
              ),
              colorKey(
                color: colorNow[5],
                num: 6,
              ),
              colorKey(
                color: colorNow[6],
                num: 7,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
