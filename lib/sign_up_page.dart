import 'package:flutter/material.dart';
import 'package:kings_cogent_app/resources/auth_methods.dart';

void main() {
  runApp(const SignUpApp());
}

class SignUpApp extends StatelessWidget {
  const SignUpApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sign Up',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _subCountyController = TextEditingController();
  final TextEditingController _parishController = TextEditingController();
  final TextEditingController _villageController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();
  final TextEditingController _phoneNumber1Controller = TextEditingController();
  final TextEditingController _phoneNumber2Controller = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _nextOfKin1Controller = TextEditingController();
  final TextEditingController _nextOfKin2Controller = TextEditingController();

  bool _showPassword = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16.0),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Image(
                image: AssetImage('assets/images/logo.jpg'),
                height: 120,
                width: 120,
              ),
            ),
            const SizedBox(height: 16.0),
            const Icon(
              Icons.account_circle,
              size: 120.0,
              color: Colors.blue,
            ),
            const SizedBox(height: 16.0),
            _buildTextField(_firstNameController, 'First Name'),
            const SizedBox(height: 12.0),
            _buildTextField(_lastNameController, 'Last Name'),
            const SizedBox(height: 12.0),
            _buildTextField(_emailController, 'Email'),
            const SizedBox(height: 12.0),
            _buildPasswordField(
                _passwordController, 'Create Password', 'password'),
            const SizedBox(height: 12.0),
            _buildPasswordField(_confirmPasswordController, 'Confirm Password',
                'confirm_password'),
            const SizedBox(height: 12.0),
            _buildTextField(_addressController, 'Address'),
            const SizedBox(height: 12.0),
            _buildTextField(_cityController, 'City'),
            const SizedBox(height: 12.0),
            _buildTextField(_subCountyController, 'Sub County'),
            const SizedBox(height: 12.0),
            _buildTextField(_parishController, 'Parish'),
            const SizedBox(height: 12.0),
            _buildTextField(_villageController, 'Village'),
            const SizedBox(height: 12.0),
            _buildTextField(_dobController, 'Date of Birth'),
            const SizedBox(height: 12.0),
            _buildTextField(_phoneNumber1Controller, 'Telephone Number 1'),
            const SizedBox(height: 12.0),
            _buildTextField(_phoneNumber2Controller, 'Telephone Number 2'),
            const SizedBox(height: 12.0),
            _buildTextField(_nationalIdController, 'National ID Number'),
            const SizedBox(height: 12.0),
            _buildTextField(_nextOfKin1Controller, 'Next of Kin 1'),
            const SizedBox(height: 12.0),
            _buildTextField(_nextOfKin2Controller, 'Next of Kin 2'),
            const SizedBox(height: 20),
            Stack(
              alignment: Alignment.center,
              children: [
                ElevatedButton(
                  onPressed: _isLoading ? null : () => _signUp(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amberAccent, // Amber accent color
                  ),
                  child: _isLoading
                      ? SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.white),
                          ),
                        )
                      : const Text(
                          'Sign Up',
                          style: TextStyle(
                              color: Colors.white), // White text color
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _signUp() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      confirmpassword: _confirmPasswordController.text,
      firstname: _firstNameController.text,
      lastname: _lastNameController.text,
      address: _addressController.text,
      city: _cityController.text,
      subcounty: _subCountyController.text,
      parish: _parishController.text,
      village: _villageController.text,
      dateofbirth: _dobController.text,
      telephonenumber1: _phoneNumber1Controller.text,
      telephonenumber2: _phoneNumber2Controller.text,
      nationalIDnumber: _nationalIdController.text,
      nextofkin1: _nextOfKin1Controller.text,
      nextofkin2: _nextOfKin2Controller.text,
    );
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(res),
        backgroundColor: Colors.white, // Set Snackbar background color to white
      ),
    );
    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildTextField(TextEditingController controller, String labelText) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildPasswordField(TextEditingController controller, String labelText,
      String accessibilityLabel) {
    return TextFormField(
      controller: controller,
      obscureText: !_showPassword,
      decoration: InputDecoration(
        labelText: labelText,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.blue),
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _showPassword ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _showPassword = !_showPassword;
            });
          },
          tooltip: _showPassword
              ? 'Hide $accessibilityLabel'
              : 'Show $accessibilityLabel',
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _addressController.dispose();
    _cityController.dispose();
    _subCountyController.dispose();
    _parishController.dispose();
    _villageController.dispose();
    _dobController.dispose();
    _phoneNumber1Controller.dispose();
    _phoneNumber2Controller.dispose();
    _nationalIdController.dispose();
    _nextOfKin1Controller.dispose();
    _nextOfKin2Controller.dispose();
    super.dispose();
  }
}
