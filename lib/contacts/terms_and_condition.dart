import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBEFEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Terms and Conditions',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 25,
            shadows: [
              Shadow(
                color: Colors.black,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
              Shadow(
                color: Colors.white24,
                blurRadius: 2,
                offset: Offset(1, 0),
              ),
            ],
          ),
        ),
      ),
      body: const SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Text(
              'Our Terms and Conditions ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Registration and Account Information: ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
                "Users will be expected to use the platform responsibly and lawfully, refraining from any illegal or abusive activities."),
            SizedBox(height: 10),
            Text(
              "Product Listings:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
                'Procedures for resolving conflicts or disputes between users and the platform.'),
            SizedBox(height: 10),
            Text(
              'Payments:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "Information about payment methods, transaction processing, and any applicable fees or charges. "),
            SizedBox(height: 10),
            Text(
              'Shipping and Delivery:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "Details on shipping policies, delivery times, and responsibilities of both the seller and the buyer."),
            SizedBox(height: 10),
            Text(
              'Returns and Refunds:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "Procedures and conditions for returning products and receiving refunds."),
            SizedBox(height: 10),
            Text(
              'Intellectual Property:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "Clarification of intellectual property rights concerning the content uploaded by users and the platform itself."),
            SizedBox(height: 10),
            Text(
              'Privacy Policy:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "How user data will be collected, stored, and used, as well as the platform's commitment to data protection."),
            SizedBox(height: 10),
            Text(
              'Dispute Resolution:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " Predict encourages collaboration and knowledge sharing among farmers and agribusinesses. Our community and discussion forums enable users to interact, seek advice, and share experiences to foster mutual growth and prosperity."),
            SizedBox(height: 10),
            Text(
              'Termination:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "The circumstances under which user accounts may be suspended or terminated."),
            SizedBox(height: 10),
            Text(
              'Limitation of Liability: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " Disclaimer of liability for certain damages or losses resulting from the use of the application."),
            SizedBox(height: 10),
            Text(
              'Modifications:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " Reserving the right to modify the terms and conditions and notifying users of such changes."),
          ],
        ),
      ),
    );
  }
}
