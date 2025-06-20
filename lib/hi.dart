import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
void main() {
  runApp(const AashiquiApp());
}

class AashiquiApp extends StatelessWidget {
  const AashiquiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Anirudh Tamil Hit Songs ALL MOVIES ',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFFF442e1c),
      ),
      home: const AashiquiScreen(),
    );
  }
}

class AashiquiScreen extends StatelessWidget {
  const AashiquiScreen({super.key});

  final List<Map<String, String>> songs = const [
    {"title": "Sawadeeka", "artists": "Anirudh, Anthony Daasan"},
    {"title": "Vidaamuyarchi(Male Version)", "artists": "Anirudh Ravichandran"},
    {"title": "Hunter Vantaar", "artists": "Anirudh,Siddharth Basrur"},
    {"title": "Chikitu Vibe", "artists": "Anirudh Ravichandran,Rajendhar"},
    {"title": "Pathavaikum", "artists": "Anirudh,Deepthi Suresh"},
    {"title": "Dheema", "artists":"Anirudh Ravichandar,Pradeep"},


  ];

  get style => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: TextFormField(
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIconColor: Colors.black,
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            hintText: "Find on this page",
          ),
        ),
        backgroundColor: Colors.brown,


        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.more_vert),
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset('peq/img_11.png', width: 100
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Anirudh Tamil Hit Songs ALL MOVIES ',
              style: GoogleFonts.roboto(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text('All hit songs of one of my favourite music director&singer', style: GoogleFonts.roboto(color: Colors.grey[400])),
            const SizedBox(height: 5),
            Text('Anirudh,enjoy', style: GoogleFonts.roboto(color: Colors.grey[400], fontSize: 12)),
            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.favorite_border, color: Colors.white),
                const SizedBox(width: 18),
                Icon(Icons.share, color: Colors.white),
                const Spacer(),
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.green,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Icon(Icons.play_arrow_rounded, color: Colors.black),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView.builder(
                itemCount: songs.length,
                itemBuilder: (context, index) {
                  final song = songs[index];
                  return ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(song['title']!,
                        style: GoogleFonts.roboto(color: Colors.white)),
                    subtitle: Text(song['artists']!,
                        style: GoogleFonts.roboto(color: Colors.grey)),
                    trailing: Icon(Icons.more_vert, color: Colors.white),
                  );
                },
              ),
            )



        ]
    ),

      ),
    );


  }
}