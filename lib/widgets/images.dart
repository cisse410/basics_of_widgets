import 'package:flutter/material.dart';

class ImageWiget extends StatelessWidget {
  const ImageWiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Image Widget',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: ListView(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/uidt.jpeg'),
                radius: 70,
              )
            ],
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: const EdgeInsets.all(8.0),
            elevation: 17.0,
            child: Image.network(
              'https://t3.ftcdn.net/jpg/03/37/35/92/360_F_337359205_iX7qbbRU4VSYhAbu3aXFX45eTberOQ1x.webp',
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const Center(
                  child: Text('Chargement de l\'image'),
                );
              },
            ),
          ),
          //   CachedNetworkImage(
          //     imageUrl: "http://via.placeholder.com/350x150",
          //     placeholder: (context, url) {return const Image(image: AssetImage('assets/images/placeholder.webp'))},
          //     errorWidget: (context, url, error) => const Icon(Icons.error),
          // ),
          // Image.network(
          //   'https://t3.ftcdn.net/jpg/03/37/35/92/360_F_337359205_iX7qbbRU4VSYhAbu3aXFX45eTberOQ1x.webp',
          //   loadingBuilder: (context, child, loadingProgress) {
          //     if (loadingProgress == null) return child;
          //     return const Center(
          //       child: CircularProgressIndicator(
          //         color: Colors.teal,
          //       ),
          //     );
          //   },
          // ),
          // Image.asset('assets/images/cisse410.jpg'),
          // const Image(image: AssetImage('assets/images/uidt.jpeg')),
        ],
      ),
    );
  }
}
