import 'package:brands/example/data.dart';
import 'package:brands/views/info_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Brands",
          style: TextStyle(color: Colors.white, fontSize: 33.0),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        brands[index]["imageCard"].toString(),
                      ),
                    ),
                    title: Text(
                      brands[index]["name"].toString(),
                    ),
                    subtitle: Text(
                      brands[index]["data"].toString(),
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  InfoPage(brand: brands[index],),
                        ),
                      );
                    },
                  ),
                );
              },
              itemCount: brands.length,
            ),
          ),
        ],
      ),
    );
  }
}
