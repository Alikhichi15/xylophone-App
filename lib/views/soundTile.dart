import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SoundView extends StatefulWidget {
  var color;
  int number;
  SoundView({this.color, this.number});

  @override
  _SoundViewState createState() => _SoundViewState();
}

class _SoundViewState extends State<SoundView> {
  final player = new AudioCache();

  Expanded soundTile({Color color, int soundNumber, String text}) {
    return Expanded(
      child: new FlatButton(
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(2.5),
        ),
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        splashColor: color,
        onPressed: () {
          player.play('note$soundNumber.wav');
        },
        child: Padding(
          padding: const EdgeInsets.only(
              left: 10.0, bottom: 40.0, top: 16.4, right: 300.0),
          child: new Column(
            children: <Widget>[
              RotatedBox(quarterTurns: 1, child: new Icon(Icons.music_note)),
              RotatedBox(
                  quarterTurns: 1,
                  child: Text(
                    text,
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0),
                  )),
            ],
          ),
        ),
        color: color,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: new Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          soundTile(color: widget.color, soundNumber: widget.number, text: "A"),
        ],
      )),
    );
  }
}
