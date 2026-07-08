import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'core/theme/app_theme.dart';
import 'providers/auth_provider.dart';
import 'providers/vpn_provider.dart';
import 'providers/settings_provider.dart';
import 'ui/screens/splash_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/register_screen.dart';
import 'ui/screens/forgot_password_screen.dart';
import 'ui/screens/dashboard_screen.dart';
import 'ui/screens/server_list_screen.dart';
import 'ui/screens/favorites_screen.dart';
import 'ui/screens/history_screen.dart';
import 'ui/screens/statistics_screen.dart';
import 'ui/screens/settings_screen.dart';
import 'ui/screens/profile_screen.dart';
import 'ui/screens/notifications_screen.dart';
import 'ui/screens/language_screen.dart';
import 'ui/screens/support_screen.dart';
import 'ui/screens/about_screen.dart';
import 'ui/screens/update_screen.dart';
import 'ui/screens/vpn_profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => VpnProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: const ClarkVpnApp(),
    ),
  );
}

class ClarkVpnApp extends StatelessWidget {
  const ClarkVpnApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsProvider>(
      builder: (context, settings, child) {
        return MaterialApp(
          title: 'Clark VPN',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: settings.themeMode,
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/login': (context) => const LoginScreen(),
            '/register': (context) => const RegisterScreen(),
            '/forgot-password': (context) => const ForgotPasswordScreen(),
            '/dashboard': (context) => const DashboardScreen(),
            '/servers': (context) => const ServerListScreen(),
            '/favorites': (context) => const FavoritesScreen(),
            '/history': (context) => const HistoryScreen(),
            '/statistics': (context) => const StatisticsScreen(),
            '/settings': (context) => const SettingsScreen(),
            '/profile': (context) => const ProfileScreen(),
            '/notifications': (context) => const NotificationsScreen(),
            '/language': (context) => const LanguageScreen(),
            '/support': (context) => const SupportScreen(),
            '/about': (context) => const AboutScreen(),
            '/update': (context) => const UpdateScreen(),
            '/vpn-profiles': (context) => const VpnProfileScreen(),
          },
        );
      },
    );
  }
}
