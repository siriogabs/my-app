import 'package:flutter/material.dart';

void main() {
  runApp(ProgressBarApp());
}

class ProgressBarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Circular Progress Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: ProgressBarScreen(),
    );
  }
}

class ProgressBarScreen extends StatefulWidget {
  @override
  _ProgressBarScreenState createState() => _ProgressBarScreenState();
}

class _ProgressBarScreenState extends State<ProgressBarScreen> {
  double progress = 0.0;

  void _increaseProgress() {
    setState(() {
      // Aumenta o progresso em 10% até o máximo de 100%
      progress += 0.1;
      if (progress > 1.0) {
        progress = 0.0; // Reinicia após 100%
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Indicador de Progresso Circular'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: progress,
                    strokeWidth: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                  ),
                ),
                Text(
                  '${(progress * 100).toInt()}%',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: _increaseProgress,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
              child: Text(
                'Avançar',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
