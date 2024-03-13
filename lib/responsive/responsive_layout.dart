import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout Example'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            // For larger screens, display a two-column layout
            return const TwoColumnLayout();
          } else {
            // For smaller screens, display a single-column layout
            return const SingleColumnLayout();
          }
        },
      ),
    );
  }
}

class SingleColumnLayout extends StatelessWidget {
  const SingleColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Single Column Layout',
              style: TextStyle(fontSize: 24.0),
            ),
            const SizedBox(height: 20.0),
            const FlutterLogo(size: 200.0),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Button'),
            ),
          ],
        ),
      ),
    );
  }
}

class TwoColumnLayout extends StatelessWidget {
  const TwoColumnLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Column 1',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 20.0),
                  const FlutterLogo(size: 150.0),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button 1'),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Column 2',
                    style: TextStyle(fontSize: 24.0),
                  ),
                  const SizedBox(height: 20.0),
                  const FlutterLogo(size: 150.0),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Button 2'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
