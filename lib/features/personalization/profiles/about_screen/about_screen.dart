import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [

            Text(
              "Quick Ledger",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 12),

            Text("Version 1.0.0"),

            SizedBox(height: 24),

            Text(
              "Quick Ledger is a lightweight accounting application that helps businesses manage accounts, journal entries, general ledger, trial balance, profit & loss, and balance sheet reports.",
            ),

            SizedBox(height: 30),

            Divider(),

            ListTile(
              leading: Icon(Icons.email_outlined),
              title: Text("Support"),
              subtitle: Text("support@quickledger.com"),
            ),

            ListTile(
              leading: Icon(Icons.language),
              title: Text("Website"),
              subtitle: Text("www.quickledger.com"),
            ),

            ListTile(
              leading: Icon(Icons.copyright),
              title: Text("Copyright"),
              subtitle: Text("© 2026 Quick Ledger"),
            ),
          ],
        ),
      ),
    );
  }
}