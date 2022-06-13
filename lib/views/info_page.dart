import 'dart:math';

import 'package:brands/example/data.dart';
import 'package:flutter/material.dart';
import 'package:brands/example/data.dart';

class InfoPage extends StatefulWidget {
  Map<String, String>? brand;
  InfoPage({
    Key? key,
    this.brand,
  }) : super(key: key);

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  List rads = [
    {
      "imageCard":
          "http://res.cloudinary.com/ctung/image/upload/v1/12/original/:company/microsoft.jpg",
    },
    {
      "imageCard":
          "https://play-lh.googleusercontent.com/vA4tG0v4aasE7oIvRIvTkOYTwom07DfqHdUPr6k7jmrDwy_qA_SonqZkw6KX0OXKAdk",
    },
    {
      "imageCard":
          "http://www.asiafinancial.com/wp-content/uploads/2021/05/alibabaoffice.jpg",
    },
    {
      "imageCard":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSnxf4I8O9hrhnaTNQVzGlrV_hSYLdYYlxmRnKrzPyS-KDlW8WxCQ9OTES1akj7Y_d3dU4&usqp=CAU",
    },
    {
      "imageCard":
          "https://yt3.ggpht.com/ytc/AKedOLT42JSYdiK7vV3Kn9cibkJD6s8uJ6MhqfDKmOJw=s900-c-k-c0x00ffffff-no-rj",
    },
    {
      "imageCard":
          "https://content.fortune.com/wp-content/uploads/2021/10/meta-7.jpg?resize=1200,600",
    },
    {
      "imageCard":
          "https://bsmedia.business-standard.com/_media/bs/img/about-page/1562577931.jpg",
    },
    {
      "imageOriginal":
          "https://fdn.gsmarena.com/imgroot/news/20/10/netflix-india-free-weekend/-1200/gsmarena_001.jpg",
    },
  ];
  final random = Random();
  // var element = rads[random.nextInt(rads.length)];

  @override
  Widget build(BuildContext context) {
    double sizeh = MediaQuery.of(context).size.height;
    double sizew = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Positioned.fill(
                  child: FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: const NetworkImage(
                      "https://as2.ftcdn.net/v2/jpg/01/27/20/33/1000_F_127203381_3fzajAC1ZwaONCGeoSRpeGX58Fd0lMte.jpg",
                    ),
                    image: NetworkImage(
                      widget.brand!["imageOriginal"].toString(),
                    ),
                  ),
                ),
                Positioned(
                  top: 35,
                  left: 15,
                  child: InkWell(
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: ListView(
                padding: const EdgeInsets.only(top: 10.0),
                children: [
                  Text(
                    widget.brand!["name"].toString(),
                    style: TextStyle(fontSize: sizew * 0.1),
                  ),
                  SizedBox(
                    height: sizeh * 0.02,
                  ),
                  Text(
                    widget.brand!["data"].toString(),
                    style: TextStyle(fontSize: sizew * 0.06),
                  ),
                  SizedBox(
                    height: sizeh * 0.02,
                  ),
                  Text(
                    widget.brand!["description"].toString(),
                    style: TextStyle(
                      fontSize: sizew * 0.04,
                    ),
                  ),
                  SizedBox(
                    height: sizeh * 0.07,
                  ),
                  SizedBox(
                    height: sizeh * 0.1,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  InfoPage(brand: brands[index],),
                        ),
                      );
                    },
                          child: Container(
                            height: sizeh * 0.1,
                            width: sizeh *0.1,
                            margin: EdgeInsets.symmetric(horizontal: 10.0),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(brands[index]["imageCard"].toString(), ),
                        
                              ),
                              shape: BoxShape.circle,
                            ),
                          ),
                        );
                      },
                      itemCount: rads.length,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
