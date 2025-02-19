import 'package:flutter/material.dart';
import 'package:evn_polytech_app/screen_main_app/digital_documents_screen.dart';
import 'package:evn_polytech_app/screen_main_app/egov_qr_screen.dart';
import 'package:evn_polytech_app/screen_main_app/eotinish_screen.dart';
import 'package:evn_polytech_app/screen_main_app/esalyq_screen.dart';
import 'package:evn_polytech_app/screen_main_app/edensauyq_screen.dart';
import 'package:evn_polytech_app/screen_main_app/video_psc_screen.dart';
import 'package:evn_polytech_app/screen_main_app/social_wallet_screen.dart';
import 'package:evn_polytech_app/screen_main_app/consumer_protection_screen.dart';
import 'package:evn_polytech_app/screen_main_app/enotary_screen.dart';
import 'package:evn_polytech_app/screen_main_app/other_services_screen.dart';
import 'screen_main_app/registration_screen.dart';
import 'screen_main_app/login_screen.dart';
import 'screen_main_app/main_screen_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/registration': (context) => RegistrationScreen(),
        '/digital_documents': (context) => DigitalDocumentsScreen(),
        '/egov_qr': (context) => EgovQRScreen(),
        '/eotinish': (context) => EOtinishScreen(),
        '/esalyq': (context) => ESalyqScreen(),
        '/edensauyq': (context) => EDensauyqScreen(),
        '/video_psc': (context) => VideoPSCScreen(),
        '/social_wallet': (context) => SocialWalletScreen(),
        '/consumer_protection': (context) => ConsumerProtectionScreen(),
        '/enotary': (context) => ENotaryScreen(),
        '/other_services': (context) => OtherServicesScreen(),

        // Добавляем отсутствующие маршруты
        '/certificates': (context) => CertificatesScreen(),
        '/services': (context) => ServicesScreen(),
        '/notifications': (context) => NotificationsScreen(),
        '/profile': (context) => ProfileScreen(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTopBar(context),
            _buildCards(context),
            _buildServicesGrid(context),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }
}

Widget _buildTopBar(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.grey.shade300,
              radius: 20,
            ),
            SizedBox(width: 10),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/login'),
              child: Text("Login / Registration",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {},
          child: Icon(Icons.qr_code, size: 30),
        ),
      ],
    ),
  );
}

Widget _buildCards(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: Row(
      children: [
        Expanded(
            child: _infoCard(
                context, "Digital documents", "", '/digital_documents')),
        SizedBox(width: 10),
        Expanded(
            child: _infoCard(
                context, "eGov QR", "Scan QR for authorization.", '/egov_qr')),
      ],
    ),
  );
}

Widget _infoCard(
    BuildContext context, String title, String subtitle, String route) {
  return GestureDetector(
    onTap: () => Navigator.pushNamed(context, route),
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          if (subtitle.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(subtitle,
                  style: TextStyle(fontSize: 12, color: Colors.black54)),
            ),
        ],
      ),
    ),
  );
}

Widget _buildServicesGrid(BuildContext context) {
  final services = [
    {'name': "eOtinish", 'route': '/eotinish'},
    {'name': "eSalyq", 'route': '/esalyq'},
    {'name': "eDensauyq", 'route': '/edensauyq'},
    {'name': "Video-PSC", 'route': '/video_psc'},
    {'name': "Social Wallet", 'route': '/social_wallet'},
    {'name': "Consumer protection", 'route': '/consumer_protection'},
    {'name': "eNotary", 'route': '/enotary'},
    {'name': "Other services", 'route': '/other_services'},
  ];

  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, childAspectRatio: 1),
      itemCount: services.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, services[index]['route']!),
          child: Column(
            children: [
              CircleAvatar(backgroundColor: Colors.grey.shade200, radius: 20),
              SizedBox(height: 5),
              Text(services[index]['name']!,
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
            ],
          ),
        );
      },
    ),
  );
}

Widget _buildBottomNavigationBar(BuildContext context) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.layers), label: "Certificates"),
      BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: "Services"),
      BottomNavigationBarItem(
          icon: Icon(Icons.notifications), label: "Notifications"),
      BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
    ],
    onTap: (index) {
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/');
          break;
        case 1:
          Navigator.pushNamed(context, '/certificates');
          break;
        case 2:
          Navigator.pushNamed(context, '/services');
          break;
        case 3:
          Navigator.pushNamed(context, '/notifications');
          break;
        case 4:
          Navigator.pushNamed(context, '/profile');
          break;
      }
    },
  );
}
