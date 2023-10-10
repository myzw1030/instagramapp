import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  int currentIndex = 0;

  final List<String> imgList = [
    'https://www.pakutaso.com/shared/img/thumb/LGTM_dandast21_cyo_TP_V.jpg',
    'https://user0514.cdnw.net/shared/img/thumb/DANDA170629r_TP_V2.jpg',
    'https://user0514.cdnw.net/shared/img/thumb/danda1s-PAUI1175-i_TP_V4.jpg?w=500,h=auto',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('フィード')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Image.network(
                        'https://prime42.jp/wp-content/uploads/2021/09/instagram-png-instagram-png-logo-1455-300x300-1.png',
                        width: 30,
                        height: 30,
                      ),
                      const SizedBox(width: 16),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'instagram',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(width: 4),
                              Icon(
                                Icons.verified,
                                size: 16,
                                color: Colors.blue,
                              ),
                            ],
                          ),
                          Text(
                            'お兄さん',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
          ),
          Expanded(
            child: CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  height: double.infinity,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                ),
                items: imgList
                    .map(
                      (item) => Center(
                        child: Stack(
                          children: <Widget>[
                            Image.network(
                              item,
                              fit: BoxFit.cover,
                              width: double.infinity,
                              // height: 900,
                              height: double.infinity,
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: Container(
                                width: 40,
                                padding: const EdgeInsets.all(4),
                                margin: const EdgeInsets.only(
                                  right: 20,
                                  top: 20,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: const Color.fromRGBO(0, 0, 0, 0.7),
                                ),
                                child: Text(
                                  '${currentIndex + 1}/3',
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    .toList()),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Row(
                      children: [
                        Icon(
                          Icons.favorite_border,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.mode_comment_outlined,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Icon(
                          Icons.near_me_outlined,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.map((urlItem) {
                        int index = imgList.indexOf(urlItem);
                        return Container(
                          width: 6,
                          height: 6,
                          margin: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 2),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == index
                                ? const Color.fromARGB(252, 0, 166, 255)
                                : const Color.fromRGBO(0, 0, 0, 0.3),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  const Icon(
                    Icons.bookmark_border,
                    size: 30,
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Row(
                children: [
                  Text(
                    '「いいね！',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '704,899件',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              const Text(
                'すばらしき世界を!!すばらしき世界を!!すばらしき世界を!!すばらしき世界を!!すばらしき世界を!!!!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
