import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/user_provider.dart';
import '../../screens/choose_role_screen.dart';
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
      onPressed: _isSigningIn
          ? null
          : () async {
        setState(() => _isSigningIn = true);

        final authService = AuthService();
        final user = await authService.signInWithGoogle(context);

        if (user != null) {
          final uid = user.uid;
          final userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();

          if (userDoc.exists && userDoc.data()!.containsKey('role')) {
            final role = userDoc.get('role');

            final userProvider = Provider.of<UserProvider>(context, listen: false);
            userProvider.setRole(role);

            if (role == 'driver') {
              Navigator.pushNamed(context, '/routesDrivers');
            } else if (role == 'passenger') {
              Navigator.pushNamed(context, '/routesPassengers');
            } else {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => ChooseRoleScreen(uid: uid)),
              );
            }
          } else {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => ChooseRoleScreen(uid: uid)),
            );
          }
        }

        setState(() => _isSigningIn = false);
      },
    );
  }
}