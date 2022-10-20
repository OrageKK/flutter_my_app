import 'package:flutter/material.dart';

class AlignP extends StatelessWidget {
  const AlignP({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        children: [
          const Align(
            // alignment: Alignment.topCenter,
            alignment: Alignment(-1.0, 0.0),
            child: Text("我的"),
          ),
          const SizedBox(height: 100),
          Stack(
            children: const [
              Align(
                alignment: Alignment.topLeft,
                child: Text("左"),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Text("右"),
              )
            ],
          ),
        ],
      ),
    );
  }
}
