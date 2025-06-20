import 'package:flutter/material.dart';


class amazon extends StatefulWidget {
  const amazon({super.key});

  @override
  State<amazon> createState() => _amazonState();
}

class _amazonState extends State<amazon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff87d7e1),
        title: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIconColor: Colors.black,
            prefixIcon: Icon(Icons.search, color: Colors.black),
            hintText: "Search or ask a question",
            suffixIcon: SizedBox(
              width: 85,
              child: Row(
                children: [
                  Icon(Icons.mic, color: Colors.black),
                  SizedBox(width: 10),
                  Icon(Icons.camera_alt, color: Colors.black),
                ],
              ),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 10.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Product Image
            Container(
              height: 250,
              width: double.infinity,
              child: Image.asset(
                'peq/img_8.png', // Add your image in assets
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10),

            // Product Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Boat Airpods 4 Wireless Earbuds,Bluetooth Headphones,with Active Noise Cancellation",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),

            // Price
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "₹2,499",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.green[700],
                ),
              ),
            ),
            SizedBox(height: 8),

            // Rating
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: List.generate(5, (index) {
                      return Icon(Icons.star, color: Colors.orange, size: 20);
                    }),
                  ),
                ),
                Text("4.5 (1,234 reviews)"),
              ],
            ),
            SizedBox(height: 12),

            // Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Experience immersive sound with these wireless Bluetooth headphones. "
                    "Designed for comfort and durability with noise cancellation, perfect for music lovers.",
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 20),

            // Add to Cart Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Added to cart!")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  minimumSize: Size(double.infinity, 50),
                ),
                child: Text("Add to Cart", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}