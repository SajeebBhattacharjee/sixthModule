import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:HomePage(),
    );

  }

}

class HomePage extends StatelessWidget {
  final List<String> imageUrls = [
    'https://images.unsplash.com/photo-1611859266238-4b98091d9d9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmlzc2FuJTIwcjM1JTIwZ3RyfGVufDB8fDB8fHww&w=1000&q=80',
    'https://images.unsplash.com/photo-1598543821338-3b6306e0dcc3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmlzc2FuJTIwcjM1JTIwZ3RyfGVufDB8fDB8fHww&w=1000&q=80',
    'https://i.ytimg.com/vi/EwrMnUBlb48/maxresdefault.jpg',
    'https://i.pinimg.com/1200x/97/b6/4d/97b64d8d3419f8e1eb74f203cb1e2075.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/thumb/1/13/Mahindra_Thar_Photoshoot_At_Perupalem_Beach_%28West_Godavari_District%2CAP%2CIndia_%29_Djdavid.jpg/1200px-Mahindra_Thar_Photoshoot_At_Perupalem_Beach_%28West_Godavari_District%2CAP%2CIndia_%29_Djdavid.jpg',
    'https://w0.peakpx.com/wallpaper/17/407/HD-wallpaper-black-thar-frontlook-black-car-mahindra-thumbnail.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title:Text('Photo Gallery'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(

        padding: EdgeInsets.all(7),
        child: Column(
          children: [
            Padding(

              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(

              padding: const EdgeInsets.all(16.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for photos...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ),
            ),
            GridView.builder(

              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 6,
                mainAxisSpacing: 6,
              ),
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Photo ${index + 1} Clicked!!'),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.network(

                          imageUrls[index],
                          height: 75,
                          fit: BoxFit.cover,
                        ),
                        Padding(

                          padding: const EdgeInsets.all(6.0),
                          child: Center(child: Text('Photo ${index + 1}')),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListTile(
              leading: Image.network(
                'https://images.unsplash.com/photo-1611859266238-4b98091d9d9b?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8bmlzc2FuJTIwcjM1JTIwZ3RyfGVufDB8fDB8fHww&w=1000&q=80',
                height: 120,
                width: 80,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 1'),
              subtitle: Text('Description for Photo 1'),
            ),

            ListTile(
              leading: Image.network(
                'https://images.unsplash.com/photo-1598543821338-3b6306e0dcc3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmlzc2FuJTIwcjM1JTIwZ3RyfGVufDB8fDB8fHww&w=1000&q=80',
                height: 120,
                width: 80,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 2'),
              subtitle: Text('Description for Photo 2'),
            ),

            ListTile(
              leading: Image.network(
                'https://english.cdn.zeenews.com/sites/default/files/2021/12/19/997351-mahindra-thar-modified.jpg',
                height: 120,
                width: 80,
                fit: BoxFit.cover,
              ),
              title: Text('Photo 3'),
              subtitle: Text('Description for Photo 3'),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: FloatingActionButton(
                elevation: 18,
                child: Icon(Icons.upload),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Photos Uploaded Successfully!'),
                    ),
                  );
                },
                //child: Icon(Icons.upload),
              ),
            ),
          ],
        ),
      ),
    );
  }
}