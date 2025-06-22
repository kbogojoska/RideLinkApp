import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class GoogleSignInButton extends StatefulWidget {
  @override
  _GoogleSignInButtonState createState() => _GoogleSignInButtonState();
}

class _GoogleSignInButtonState extends State<GoogleSignInButton> {
  bool _isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: Image.asset('assets/google_logo.png', height: 24),
      label: _isSigningIn
          ? SizedBox(
        width: 24,
        height: 24,
        child: CircularProgressIndicator(strokeWidth: 2),
      )
          : Text("Sign in with Google", style: TextStyle(fontSize: 14)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        minimumSize: Size(double.infinity, 50),
        padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 2,
      ),
      onPressed: () async {
        if (_isSigningIn) return;

        setState(() => _isSigningIn = true);
        try {
          final user = await AuthService().signInWithGoogle(context);
          if (user != null && mounted) {
            Navigator.pushNamed(context, '/routesPassengers');
          }
        } catch (e) {
          debugPrint('Error in button: $e');
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Sign in failed. Please try again.')),
            );
          }
        } finally {
          if (mounted) {
            setState(() => _isSigningIn = false);
          }
        }
      },
    );
  }
}