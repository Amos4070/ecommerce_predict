import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBEFEF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'About Us',
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
              'Welcome to Predict: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
                "Your One-Stop Price Predictive Agricultural Ecommerce Application!"),
            SizedBox(height: 10),
            Text(
              "Introduction:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
                "Predict is a cutting-edge agricultural ecommerce application designed to revolutionize the way farmers, agribusinesses, and enthusiasts access, purchase and predict agricultural products prices and  their services. With an intuitive interface and a vast array of offerings, Predict aims to empower users, streamline agricultural transactions, and foster sustainable practices."),
            SizedBox(height: 10),
            Text(
              "Features:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            Text(
              ' 1. Diverse Product Catalog:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                'Predict boasts an extensive product catalog, encompassing everything from seeds, fertilizers, and pesticides to farm machinery, tools, and equipment. Our wide range of products caters to the diverse needs of farmers and agricultural stakeholders, making sure they find the perfect solutions for their specific requirements.'),
            SizedBox(height: 10),
            Text(
              ' 2. Reliable Suppliers and Brands:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " We collaborate with reputable suppliers and renowned agricultural brands to offer high-quality, genuine products. Users can browse through a curated selection of trusted suppliers and make informed decisions based on reviews and ratings from fellow farmers."),
            SizedBox(height: 10),
            Text(
              ' 3. Crop Advisory and Expert Assistance:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "   Predict is more than just an ecommerce platform; it's also a knowledge hub. Users can access crop advisory services, agricultural news, and expert assistance from agronomists and experienced farmers. Our goal is to enhance productivity and yield while promoting sustainable and environmentally-friendly practices."),
            SizedBox(height: 10),
            Text(
              ' 4. Seasonal Offers and Discounts:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " We understand the seasonal nature of agriculture and aim to support our users with seasonal offers and discounts on various products. Predict users can take advantage of cost-effective deals and promotions to optimize their farming operations."),
            SizedBox(height: 10),
            Text(
              ' 5. Secure Payment Options:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " We prioritize the security of our users' financial transactions. Predict offers multiple payment options, including credit/debit cards, net banking, mobile wallets, and cash-on-delivery, ensuring a smooth and secure checkout process."),
            SizedBox(height: 10),
            Text(
              ' 6. Easy Order Tracking and Delivery:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " Once an order is placed, users can easily track its status in real-time. Predict partners with reliable logistics providers to ensure prompt and hassle-free deliveries, even to remote locations, allowing farmers to focus on their agricultural activities."),
            SizedBox(height: 10),
            Text(
              ' 7. Community and Discussion Forums:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " Predict encourages collaboration and knowledge sharing among farmers and agribusinesses. Our community and discussion forums enable users to interact, seek advice, and share experiences to foster mutual growth and prosperity."),
            SizedBox(height: 10),
            Text(
              ' 8. Seamless Mobile Experience:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                " With our user-friendly mobile application, farmers can access Predict's features on the go. The app is optimized for smooth performance and accessibility, ensuring convenience and functionality at their fingertips."),
            SizedBox(height: 10),
            Text(
              ' Conclusion:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
            Text(
                "Predict is more than just an ecommerce platform; it's a comprehensive agricultural ecosystem that aims to empower farmers, promote sustainable practices, and foster a vibrant community. With our commitment to innovation and customer satisfaction, we strive to be the trusted partner for all agricultural needs. Embrace Predict today and join the agricultural revolution! Happy farming!"),
          ],
        ),
      ),
    );
  }
}
