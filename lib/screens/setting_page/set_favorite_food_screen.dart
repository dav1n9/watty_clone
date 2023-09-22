import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/user_controller.dart';

class SetFavoriteFoodScreen extends StatefulWidget {
  const SetFavoriteFoodScreen({super.key});

  @override
  State<SetFavoriteFoodScreen> createState() => _SetFavoriteFoodScreenState();
}

class _SetFavoriteFoodScreenState extends State<SetFavoriteFoodScreen> {
  final userController = Get.put(UserController());
  late List<dynamic> updateFoods;

  @override
  void initState() {
    // updateFoods = List.empty();
    updateFoods = userController.newUser.value.favorite;
    print("initState: $updateFoods");
    // setFood();
    super.initState();

    setState(() {});
  }

  setFood() async {
    await userController.setSelectedFoods();
    updateFoods = userController.selectedFoods;

    print("updateFoods: $updateFoods");
  }

  Widget foodBtn(String food) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            if (updateFoods.contains(food)) {
              //뺴기
              updateFoods.remove(food);
              print("remove : $food");
              // ??? updateFood수정하고 있는데
              // 왜 컨트롤러 newUser favorite 리스트가 수정되는지 모르곘음...???
              print(
                  "remove - newUser.value.favorite: ${userController.newUser.value.favorite}");
            } else {
              updateFoods.add(food);
              print("add food : $food");
              print(
                  "remove - newUser.value.favorite: ${userController.newUser.value.favorite}");
            }
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: updateFoods.contains(food)
              ? Colors.red.shade800
              : Colors.grey.shade200,
          elevation: 0,
        ),
        child: Text(
          food,
          style: TextStyle(
            color: updateFoods.contains(food) ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const Text(
              '어떤 음식 좋아하세요?',
              style: TextStyle(fontSize: 17),
            ),
            const Text(
              '선호하는 음식 종류를 골라주세요.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Wrap(
              children: userController.food.map((e) {
                return foodBtn(e);
              }).toList(),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                onPressed: () {
                  setState(() async {
                    await userController.updateFavorite();
                    print(
                        'Favorite food update! selectedFoods : ${userController.selectedFoods}');
                    print('Favorite food update! updateFoods : $updateFoods');

                    Navigator.of(context).pop();
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800,
                  elevation: 0,
                ),
                child: const Text('완료'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
