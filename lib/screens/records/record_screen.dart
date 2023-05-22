import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> {
  // dummy items
  final List<Map<String, dynamic>> _items2 = [
    {
      "id": 0,
      "title": "추워용❄️",
      "image":
          'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
    },
    {
      "id": 1,
      "title": "Item 1",
      "image":
          'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    },
    {
      "id": 2,
      "title": "Item 2",
      "image":
          'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
    },
    {
      "id": 3,
      "title": "Item 3",
      "image":
          'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
    },
    {
      "id": 4,
      "title": "Item 4",
      "image":
          'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
    },
    {
      "id": 5,
      "title": "Item 5",
      "image":
          'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
    },
    {
      "id": 6,
      "title": "Item 6",
      "image":
          'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
    },
    {
      "id": 7,
      "title": "Item 7",
      "image":
          'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
    },
    {
      "id": 8,
      "title": "Item 8",
      "image":
          'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
    },
    {
      "id": 9,
      "title": "Item 9",
      "image":
          'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
    },
    {
      "id": 10,
      "title": "Item 10",
      "image":
          'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 새로고침
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          _items2.add(_items2[0]);
        });
      },
      child: Container(
        child: MasonryGridView.count(
          itemCount: _items2.length,
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
          crossAxisCount: 2,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            return Card(
              shape: RoundedRectangleBorder(
                //모서리를 둥글게 하기 위해 사용
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 0.0, //그림자 깊이
              key: ValueKey(_items2[index]['id']),
              child: SizedBox(
                height: 224.0, // _items[index]['height'],
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: _items2[index]['image'],
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          _items2[index]['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
