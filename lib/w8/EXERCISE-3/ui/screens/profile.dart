import 'package:flutter/material.dart';
import 'package:project2/w8/EXERCISE-3/model/profile_tile_model.dart';

import '../theme/theme.dart';



class ProfileApp extends StatelessWidget {
  final ProfileData data;
  const ProfileApp({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  data.avatarUrl), 
            ),
            const SizedBox(height: 20),
            Text(
              data.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
            Text(
              data.position,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(itemCount: data.tiles.length ,itemBuilder: (BuildContext context, int index)  {
                 final item = data.tiles[index];
                 return ProfileTile(icon: item.icon, title: item.title, data: item.value);
              } ),
            ),
            // ... data.tiles.map((tileData) => ProfileTile(icon: tileData.icon, title: tileData.title, data: tileData.value))
            // puting a loop inside a builder and returning the loop body, returns the 0th index endlessly
          ],
        ),
      ),
    );
  }
}

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    required this.data,
  });

  final IconData icon;
  final String title;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(icon, color: AppColors.primary),
          title: Text(title),
          subtitle: Text(data),
        ),
      ),
    );
  }
}
