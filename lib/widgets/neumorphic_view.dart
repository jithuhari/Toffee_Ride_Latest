import 'package:flutter/material.dart';

class NeumorphicView extends StatelessWidget {
  const NeumorphicView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 200,
          width: 200,
          child: Icon(
            Icons.home,
            size: 80,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment(-1.0, -4.0),
                  end: Alignment(1.0, 4.0),
                  colors: [
                    Color(0xFF5bc6ff),
                    Color(0xFF4da7db),
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xFF4ca5d8),
                    offset: Offset(5.0, 5.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
                BoxShadow(
                    color: Color(0xFF5ecdff),
                    offset: Offset(-5.0, -5.0),
                    blurRadius: 15.0,
                    spreadRadius: 1.0),
              ]),
        );
  }
}

class NeumorphicContainer extends StatefulWidget {
  final Widget child;
  final double bevel;
  final Offset blurOffset;
  final Color color;

  NeumorphicContainer({
    Key? key,
    required this.child,
    this.bevel = 10.0,
    required this.color,
  })  : this.blurOffset = Offset(bevel / 2, bevel / 2),
        super(key: key);

  @override
  _NeumorphicContainerState createState() => _NeumorphicContainerState();
}

class _NeumorphicContainerState extends State<NeumorphicContainer> {
  bool _isPressed = false;

  void _onPointerDown(PointerDownEvent event) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onPointerUp(PointerUpEvent event) {
    setState(() {
      _isPressed = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.color;// ?? Theme.of(context)?.backgroundColor;

    return Listener(
      onPointerDown: _onPointerDown,
      onPointerUp: _onPointerUp,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.bevel * 10),
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                _isPressed ? color : color.mix(Colors.black, .1),
                _isPressed ? color.mix(Colors.black, .05) : color,
                _isPressed ? color.mix(Colors.black, .05) : color,
                color.mix(Colors.white, _isPressed ? .2 : .5),
              ],
              stops: [
                0.0,
                .3,
                .6,
                1.0,
              ]),
          boxShadow: _isPressed ? null : [
            BoxShadow(
              blurRadius: widget.bevel,
              offset: -widget.blurOffset,
              color: color.mix(Colors.white, .6),
            ),
            BoxShadow(
              blurRadius: widget.bevel,
              offset: widget.blurOffset,
              color: color.mix(Colors.black, .3),
            )
          ],
        ),
        child: widget.child,
      ),
    );
  }
}

extension ColorUtils on Color {
  Color mix(Color another, double amount) {
    return Color.lerp(this, another, amount)!;
  }
}