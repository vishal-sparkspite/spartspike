import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class homePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spart Spike'),
        actions: [
          IconButton(
            icon: Icon(Icons.cast),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: VideoList(),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
          child: GNav(
            gap: 8,
            activeColor: Colors.white,
            color: Colors.black,
            backgroundColor: Colors.white,
            tabBackgroundColor: Colors.grey[700]!,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.explore,
                text: 'Explore',
              ),
              GButton(icon: Icons.subscriptions, text: 'Subscriptions'),
              GButton(
                icon: Icons.notifications,
                text: 'Notifications',
              ),
              GButton(
                icon: Icons.video_library,
                text: 'Library',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class VideoList extends StatelessWidget {
  final List<Map<String, String>> videos = [
    {
      'title': 'Flutter Tutorial - YouTube Clone',
      'thumbnail': 'Images/img-2.jpg',
      'channel': 'Flutter Dev',
      'views': '1M views',
      'duration': '10:30',
    },
    {
      'title': 'Learn Flutter in 1 Hour',
      'thumbnail': 'Images/img-1.webp',
      'channel': 'Code with Chris',
      'views': '500K views',
      'duration': '59:59',
    },
    // Add more videos here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: videos.length,
      itemBuilder: (context, index) {
        return VideoCard(
          title: videos[index]['title']!,
          thumbnail: videos[index]['thumbnail']!,
          channel: videos[index]['channel']!,
          views: videos[index]['views']!,
          duration: videos[index]['duration']!,
        );
      },
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String thumbnail;
  final String channel;
  final String views;
  final String duration;

  VideoCard({
    required this.title,
    required this.thumbnail,
    required this.channel,
    required this.views,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(thumbnail),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  color: Colors.black,
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    duration,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(thumbnail),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('$channel · $views'),
                  ],
                ),
              ),
              Icon(Icons.more_vert),
            ],
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
