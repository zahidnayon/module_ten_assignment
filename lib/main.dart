import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return OrientationBuilder(
            builder: (context, orientation) {
              return orientation == Orientation.portrait
                  ? buildPortraitLayout(constraints)
                  : buildLandscapeLayout(constraints);
            },
          );
        },
      ),
    );
  }

  Widget buildPortraitLayout(BoxConstraints constraints) {
    double avatarSize = constraints.maxWidth * 0.4;
    double photoCardSize = (constraints.maxWidth - 64) / 3;

    return ListView(
      padding: EdgeInsets.all(4),
      children: [
        SizedBox(height: 16),
        CircleAvatar(
          radius: avatarSize / 1,
          backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
        ),
        SizedBox(height: 16),
        Column(
          children: [
            Text(
              'Zahid Hossain',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum condimentum diam eget lorem finibus, nec luctus ante tempor.',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildPhotoCard(photoCardSize, 'assets/images/profile_photo.jpg'),
            buildPhotoCard(photoCardSize, 'assets/images/profile_photo.jpg'),
            buildPhotoCard(photoCardSize, 'assets/images/profile_photo.jpg'),
          ],
        ),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildPhotoCard(photoCardSize, 'assets/images/profile_photo.jpg'),
            buildPhotoCard(photoCardSize, 'assets/images/profile_photo.jpg'),
            buildPhotoCard(photoCardSize, 'assets/images/profile_photo.jpg'),
          ],
        ),
      ],
    );
  }

  Widget buildLandscapeLayout(BoxConstraints constraints) {
    double avatarSize = constraints.maxHeight * 0.8;
    double photoCardSize = (constraints.maxHeight - 64) / 3;

    return Row(
      children: [
        Container(
          width: avatarSize,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              CircleAvatar(
                radius: avatarSize / 2,
                backgroundImage: AssetImage('assets/images/profile_photo.jpg'),
              ),
              SizedBox(height: 16),
              Container(
                height: 0, // Adjust the height as needed
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: constraints.maxHeight - 50,
                // maxWidth: constraints.maxWidth - 0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 0),
                    Text(
                      'Zahid Hossain',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum condimentum diam eget lorem finibus, nec luctus ante tempor.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                    Container(
                      height: 200,
                      child: GridView.count(
                        crossAxisCount: 3,
                        padding: EdgeInsets.all(16),
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          buildPhotoCard(
                              photoCardSize, 'assets/images/profile_photo.jpg'),
                          buildPhotoCard(
                              photoCardSize, 'assets/images/profile_photo.jpg'),
                          buildPhotoCard(
                              photoCardSize, 'assets/images/profile_photo.jpg'),
                          buildPhotoCard(
                              photoCardSize, 'assets/images/profile_photo.jpg'),
                          buildPhotoCard(
                              photoCardSize, 'assets/images/profile_photo.jpg'),
                          buildPhotoCard(
                              photoCardSize, 'assets/images/profile_photo.jpg'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildPhotoCard(double size, String photoAsset) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(photoAsset),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      height: size,
      width: size,
    );
  }
}
