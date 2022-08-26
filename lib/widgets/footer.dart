import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({super.key});

  @override
  State<Footer> createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10.0),
        alignment: Alignment.center,
        color: Colors.blue,
        height: 40,
        child: Row(
          children: const [
            Expanded(
                child: Text(
              textAlign: TextAlign.center,
              'Footer',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            )),
          ],
        ));
  }
}
