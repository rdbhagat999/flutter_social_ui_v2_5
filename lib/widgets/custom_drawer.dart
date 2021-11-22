import 'package:flutter/material.dart';
import 'package:flutter_social_ui/data/data.dart';
import 'package:flutter_social_ui/screens/home_screen.dart';
import 'package:flutter_social_ui/screens/login_screen.dart';
import 'package:flutter_social_ui/screens/profile_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildDrawerOption(Icon icon, String title, dynamic onTapFn) {
      return ListTile(
        leading: icon,
        title: Text(
          title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: onTapFn,
      );
    }

    return Drawer(
      child: Column(
        children: [
          Stack(
            children: [
              Image(
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
                image: AssetImage(
                  currentUser.backgroundImageUrl ?? 'no_url',
                ),
              ),
              Positioned(
                left: 20,
                bottom: 45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                          width: 3,
                        ),
                      ),
                      child: ClipOval(
                        child: Image(
                          height: 60,
                          width: 60,
                          image: AssetImage(currentUser.profileImageUrl ?? 'no_url'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      currentUser.name!,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          _buildDrawerOption(
            const Icon(Icons.dashboard),
            'Home',
                () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeScreen(),
              ),
            ),
          ),
          _buildDrawerOption(
            const Icon(Icons.account_circle),
            'My Profile',
                () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => ProfileScreen(user: currentUser),
              ),
            ),
          ),
          _buildDrawerOption(
            const Icon(Icons.chat),
            'Chat',
                () => {},
          ),
          _buildDrawerOption(
            const Icon(Icons.location_on),
            'Map',
                () => {},
          ),
          _buildDrawerOption(
            const Icon(Icons.settings),
            'Settings',
                () => {},
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: _buildDrawerOption(
                const Icon(Icons.directions_run),
                'Logout',
                    () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
