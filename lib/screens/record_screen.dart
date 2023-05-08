import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'dart:math';

List<String> imageList = [
  'https://cdn.pixabay.com/photo/2019/03/15/09/49/girl-4056684_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/15/16/25/clock-5834193__340.jpg',
  'https://cdn.pixabay.com/photo/2020/09/18/19/31/laptop-5582775_960_720.jpg',
  'https://media.istockphoto.com/photos/woman-kayaking-in-fjord-in-norway-picture-id1059380230?b=1&k=6&m=1059380230&s=170667a&w=0&h=kA_A_XrhZJjw2bo5jIJ7089-VktFK0h0I4OWDqaac0c=',
  'https://cdn.pixabay.com/photo/2019/11/05/00/53/cellular-4602489_960_720.jpg',
  'https://cdn.pixabay.com/photo/2017/02/12/10/29/christmas-2059698_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/01/29/17/09/snowboard-4803050_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/02/06/20/01/university-library-4825366_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/11/22/17/28/cat-5767334_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/13/16/22/snow-5828736_960_720.jpg',
  'https://cdn.pixabay.com/photo/2020/12/09/09/27/women-5816861_960_720.jpg',
];

class RecordScreen extends StatelessWidget {
  RecordScreen({super.key});

  // Generate a list of dummy items
  final List<Map<String, dynamic>> _items = List.generate(
      200,
      (index) => {
            "id": index,
            "title": "Item $index",
            "height": Random().nextInt(150) + 50.5
          });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      itemCount: _items.length,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        return Card(
          color: Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
              Random().nextInt(256), Random().nextInt(256)),
          key: ValueKey(_items[index]['id']),
          child: SizedBox(
            height: 200.0, // _items[index]['height'],
            child: Center(
              child: Text(_items[index]['title']),
            ),
          ),
        );
      },
    );
  }
}
