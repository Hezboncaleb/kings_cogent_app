import 'package:flutter/material.dart';

class ResponsiveLayoutDemo extends StatelessWidget {
  const ResponsiveLayoutDemo({super.key, required mobileScreenLayout});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Layout Demo'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitLayout(context)
              : _buildLandscapeLayout(context);
        },
      ),
    );
  }

  Widget _buildPortraitLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildImageWidget(),
          const SizedBox(height: 20.0),
          const Text(
            'Welcome to Responsive Layout Demo',
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(height: 20.0),
          _buildButtonWidget(context),
        ],
      ),
    );
  }

  Widget _buildLandscapeLayout(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildImageWidget(),
          const SizedBox(width: 20.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Welcome to Responsive Layout Demo',
                style: TextStyle(fontSize: 20.0),
              ),
              const SizedBox(height: 20.0),
              _buildButtonWidget(context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageWidget() {
    return Image.network(
      'https://via.placeholder.com/200',
      width: 200,
      height: 200,
    );
  }

  Widget _buildButtonWidget(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Add your button functionality here
      },
      child: const Text('Click Me'),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ResponsiveLayoutDemo(
      mobileScreenLayout: null,
    ),
  ));
}
