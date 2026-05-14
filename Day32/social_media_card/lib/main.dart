import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SocialMediaCardPage(),
    );
  }
}

class SocialMediaCardPage extends StatelessWidget {
  const SocialMediaCardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Social Media Post",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Container(
            width: double.infinity,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),

              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  offset: const Offset(0, 8),
                ),
              ],
            ),

            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                // PROFILE SECTION

                Padding(
                  padding: const EdgeInsets.all(18),

                  child: Row(
                    children: [

                      // PROFILE IMAGE

                      const CircleAvatar(
                        radius: 28,
                        backgroundImage: NetworkImage(
                          "https://images.unsplash.com/photo-1500648767791-00dcc994a43e",
                        ),
                      ),

                      const SizedBox(width: 15),

                      // NAME & TIME

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [

                          Text(
                            "Adithya Krishna",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "2 hours ago",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),

                      const Spacer(),

                      const Icon(
                        Icons.more_vert,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),

                // CAPTION

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),

                  child: Text(
                    "Exploring beautiful landscapes and capturing moments that feel timeless. 🌄✨",
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.black87,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // IMAGE + FLOATING BUTTON

                Stack(
                  clipBehavior: Clip.none,
                  children: [

                    // POST IMAGE

                    Container(
                      height: 280,
                      width: double.infinity,

                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),

                        image: DecorationImage(
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1506744038136-46273834b3fb",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    // FLOATING LIKE BUTTON

                    Positioned(
                      right: 20,
                      bottom: -25,

                      child: Container(
                        height: 60,
                        width: 60,

                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.pink,

                          boxShadow: [
                            BoxShadow(
                              color: Colors.pink.withOpacity(0.4),
                              blurRadius: 15,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),

                        child: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),

                // ACTIONS SECTION

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [

                      Row(
                        children: const [

                          Icon(
                            Icons.favorite,
                            color: Colors.pink,
                          ),

                          SizedBox(width: 8),

                          Text(
                            "12.5K Likes",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),

                      Row(
                        children: const [

                          Icon(
                            Icons.chat_bubble_outline,
                            color: Colors.grey,
                          ),

                          SizedBox(width: 8),

                          Text(
                            "580 Comments",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}