import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth_service.dart';
import '../providers/user_provider.dart';  // import UserProvider

class AppMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.menu, color: Color(0xFF1F1047), size: 28),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            return _buildBottomSheetContent(context);
          },
          elevation: 0,
          barrierColor: Colors.black54,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          ),
        );
      },
    );
  }

  Widget _buildBottomSheetContent(BuildContext context) {
    final role = Provider.of<UserProvider>(context).role;

    return ClipRRect(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF1F1047),
                borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
              ),
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 16,
                left: 20,
                right: 12,
                bottom: 12,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RIDE LINK',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.8,
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white, size: 26),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(vertical: 16),
                children: [
                  _buildMenuItem(context, Icons.person, 'Profile', '/profile'),
                  _buildMenuItem(context, Icons.directions_bus,
                      'Posts (By Passenger)', '/routesPassengers'),
                  _buildMenuItem(context, Icons.directions_car,
                      'Routes (By Driver)', '/routesDrivers'),

                  // Show Add New Route only if role == 'driver'
                  if (role == 'driver')
                    _buildMenuItem(
                        context, Icons.add_road, 'Add New Route', '/tripDetails'),

                  // Show Add New Post only if role == 'passenger'
                  if (role == 'passenger')
                    _buildMenuItem(
                        context, Icons.post_add, 'Add New Post', '/tripDetails2'),

                  Divider(
                      thickness: 1,
                      height: 32,
                      indent: 24,
                      endIndent: 24,
                      color: Colors.grey[300]),
                  _buildMenuItem(context, Icons.logout, 'Sign Out', '/welcome',
                      isSignOut: true, isDestructive: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(
      BuildContext context,
      IconData icon,
      String title,
      String route, {
        bool isSignOut = false,
        bool isDestructive = false,
      }) {
    final Color mainColor = Color(0xFF1F1047);
    final Color textColor = isDestructive ? Colors.red : mainColor;
    final Color iconColor = isDestructive ? Colors.redAccent : mainColor;

    return InkWell(
      onTap: () async {
        Navigator.pop(context);
        if (isSignOut) {
          await AuthService().signOut();
          Navigator.of(context)
              .pushNamedAndRemoveUntil('/welcome', (route) => false);
        } else {
          Navigator.pushNamed(context, route);
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: iconColor.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(10),
              child: Icon(icon, color: iconColor, size: 20),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: textColor,
                ),
              ),
            ),
            if (!isDestructive)
              Icon(Icons.chevron_right, color: Colors.grey[400], size: 22),
          ],
        ),
      ),
    );
  }
}
