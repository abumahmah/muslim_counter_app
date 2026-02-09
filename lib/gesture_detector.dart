import 'package:flutter/material.dart';

class CounterGestureDetector extends StatefulWidget {
  final int counter;
  final VoidCallback onTap;

  const CounterGestureDetector({
    super.key,
    required this.counter,
    required this.onTap,
  });

  @override
  State<CounterGestureDetector> createState() => _CounterGestureDetectorState();
}

class _CounterGestureDetectorState extends State<CounterGestureDetector>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 50),
      lowerBound: 0.0,
      upperBound: 0.1,
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
    widget.onTap();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final double scale = 1 - _controller.value;

    // Calculate progress (e.g., modulo 33 for traditional tasbih)
    double progress = (widget.counter % 33) / 33;
    if (widget.counter % 33 == 0 && widget.counter > 0) progress = 1.0;

    return GestureDetector(
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: Transform.scale(
        scale: scale,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // 1. Outer Decorative Circle (Simulating the geometric pattern)
            Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: colors.primary.withOpacity(0.3),
                  width: 2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colors.primary.withOpacity(0.1),
                    blurRadius: 20,
                    spreadRadius: 5,
                  ),
                ],
              ),
            ),

            // 2. The Progress Indicator
            SizedBox(
              width: 220,
              height: 220,
              child: CircularProgressIndicator(
                value: progress == 0
                    ? 0
                    : progress, // Prevents full circle at 0
                strokeWidth: 25,
                backgroundColor: colors.primary.withOpacity(0.2),
                valueColor: AlwaysStoppedAnimation<Color>(colors.primary),
                strokeCap: StrokeCap.round,
              ),
            ),

            // 3. The Count Text
            Text(
              "${widget.counter}",
              style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 80,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
