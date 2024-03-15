import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DynamicTheme(
      initialThemeMode: ThemeMode.light,
      data: (brightness) => ThemeData(
        brightness: brightness,
        primarySwatch: Colors.blue,
      ),
      themedWidgetBuilder: (context, theme) {
        return MaterialApp(
          title: 'Settings Demo',
          theme: theme,
          home: SettingsPage(),
        );
      },
    );
  }
}

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _loadThemePreference();
  }

  Future<void> _loadThemePreference() async {
    final prefs = await SharedPreferences.getInstance();
    final int themeModeIndex = prefs.getInt('theme_mode') ?? 0;
    setState(() {
      _themeMode = ThemeMode.values[themeModeIndex];
    });
  }

  void _saveThemePreference(ThemeMode mode) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('theme_mode', mode.index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView(
        children: [
          _buildThemeSwitch(context),
          const Divider(), // Divider between theme switch and menu items
          _buildMenuItem(context, 'Notification', const NotificationScreen()),
          const Divider(), // Divider between menu items
          _buildMenuItem(context, 'Help and Support', const HelpScreen()),
          const Divider(), // Divider between menu items
          _buildMenuItem(context, 'Share', const ShareScreen()),
        ],
      ),
    );
  }

  Widget _buildThemeSwitch(BuildContext context) {
    return SwitchListTile(
      title: const Text('Dark Mode'),
      value: _themeMode == ThemeMode.dark,
      onChanged: (value) {
        setState(() {
          _themeMode = value ? ThemeMode.dark : ThemeMode.light;
          _saveThemePreference(_themeMode);
        });
      },
    );
  }

  Widget _buildMenuItem(BuildContext context, String title, Widget screen) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      trailing: const Icon(Icons.arrow_forward),
    );
  }
}

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification'),
      ),
      body: const Center(
        child: Text('Notification Screen Content'),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
      ),
      body: const Center(
        child: Text('Help Screen Content'),
      ),
    );
  }
}

class ShareScreen extends StatelessWidget {
  const ShareScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Share'),
      ),
      body: const Center(
        child: Text('Share Screen Content'),
      ),
    );
  }
}

class DynamicTheme extends StatefulWidget {
  final ThemeMode initialThemeMode;
  final ThemeData Function(Brightness brightness) data;
  final Widget Function(BuildContext context, ThemeData theme)
      themedWidgetBuilder;

  const DynamicTheme({
    required this.initialThemeMode,
    required this.data,
    required this.themedWidgetBuilder,
  });

  static _DynamicThemeState? of(BuildContext context) {
    return context.findAncestorStateOfType<_DynamicThemeState>();
  }

  @override
  _DynamicThemeState createState() => _DynamicThemeState();
}

class _DynamicThemeState extends State<DynamicTheme> {
  late ThemeMode _themeMode;

  @override
  void initState() {
    super.initState();
    _themeMode = widget.initialThemeMode;
  }

  void setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeData = widget.data(
      _themeMode == ThemeMode.dark ? Brightness.dark : Brightness.light,
    );
    return widget.themedWidgetBuilder(context, themeData);
  }
}
