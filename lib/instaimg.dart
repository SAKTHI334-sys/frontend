import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InstagramProfilePage extends StatelessWidget {
  const InstagramProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            floating: true,
            pinned: true,
            snap: false,
            elevation: 1,
            title: Row(
              children: const [
                Text("sakss24", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                Icon(Icons.keyboard_arrow_down, color: Colors.black),
              ],
            ),
            actions: const [
              Icon(Icons.link, color: Colors.black),
              SizedBox(width: 16),
              Icon(Icons.add_box_outlined, color: Colors.black),
              SizedBox(width: 16),
              Icon(Icons.menu, color: Colors.black),
              SizedBox(width: 10),
            ],
          ),
        ],
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Info Row
              Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('peq/img_12.png'),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 12,
                          child: const Icon(Icons.add, size: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: const [
                      Text("1", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("posts"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      Text("200", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("followers"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: const [
                      Text("452", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      Text("following"),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Text("Sakshi", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 4),
              const Text("AT last a STAR dust"),
              Text("CARPE DENIM", style: GoogleFonts.orbitron(fontSize: 12)),
              const SizedBox(height: 6),
              const Row(
                children: [
                  Icon(Icons.music_note, size: 16),
                  Text("Rasathi unna · Ilayaraja", style: TextStyle(fontSize: 12)),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: OutlinedButton(onPressed: () {}, child: const Text("Edit profile"))),
                  const SizedBox(width: 10),
                  Expanded(child: OutlinedButton(onPressed: () {}, child: const Text("Share profile"))),
                  const SizedBox(width: 10),
                  OutlinedButton(onPressed: () {}, child: const Icon(Icons.person_add_alt)),
                ],
              ),
              const SizedBox(height: 20),

              // Highlights
              Row(
                children: [
                  _buildHighlight("peq/img_10.png", "pics"),
                  const SizedBox(width: 10),
                  _buildHighlight("peq/img_6.png", "dump"),
                  const SizedBox(width: 10),
                  Column(
                    children: [
                      Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white),
                        ),
                        child: const Icon(Icons.add, size: 30),
                      ),
                      const SizedBox(height: 5),
                      const Text("New", style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Post Grid
              GridView.builder(
                itemCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return Image.asset('peq/img_13.png', fit: BoxFit.cover);
                         Image.asset("peq/img_8/pmg",fit: BoxFit.cover,);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_on), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.video_library), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person_pin_outlined), label: ""),
        ],
      ),
    );
  }

  Widget _buildHighlight(String imagePath, String emoji) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: Colors.white24,
          child: CircleAvatar(
            radius: 32,
            backgroundColor: Colors.black,
            backgroundImage: AssetImage(imagePath),
          ),
        ),
        const SizedBox(height: 5),
        Text(emoji, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
