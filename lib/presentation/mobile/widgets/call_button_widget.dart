import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CallButtonWidget extends StatelessWidget {
  final String phoneNumber;
  const CallButtonWidget({super.key, required this.phoneNumber});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      sliver: SliverToBoxAdapter(
          child: TextButton(
        onPressed: () async {
          await _launchPhone(phoneNumber);
        },
        style: TextButton.styleFrom(
          backgroundColor: Color(int.parse('0xFF3066BE')),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0), // Задайте нужный радиус
          ),
        ),
        child: const Text('Call',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 18)),
      )),
    );
  }
}

Future _launchPhone(String phoneNumber) async {
  final Uri url = Uri(scheme: 'tel', path: phoneNumber);
  await launchUrl(url);
}
