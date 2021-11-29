import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class BonesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _BonesPageState();
}

class _BonesPageState extends State<BonesPage> {
  Artboard? _riveArtBoard;
  RiveAnimationController? _controller;
  bool get isPlaying => _controller?.isActive ?? false;

  @override
  void initState() {
    super.initState();

    rootBundle.load('assets/bones.riv').then(
      (data) async {
        final file = RiveFile.import(data);
        final artBoard = file.mainArtboard;
        artBoard.addController(_controller = SimpleAnimation('Animation 1'));
        setState(() => _riveArtBoard = artBoard);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bone Animation"),
      ),
      backgroundColor: Colors.black87,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width,
            child: _riveArtBoard != null ? Rive(artboard: _riveArtBoard!) : SizedBox(),
          ),

          ElevatedButton(
              onPressed: _togglePlay,
              child: Text(_getButtonText()))
        ],
      ),
    );
  }

  String _getButtonText() {
    return isPlaying ? "Pause" : "Play";
  }

  void _togglePlay() {
    if (_controller == null) return;

    setState(() => _controller?.isActive = !_controller!.isActive);
  }
}
