import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:toonflix/charts/chart.dart';
import 'package:toonflix/screens/calender_screen.dart';
import 'package:toonflix/screens/camera_screen.dart';
import 'package:toonflix/screens/profile_screen.dart';

void getImage({required ImageSource source}) async {
  final file = await ImagePicker().pickImage(
      source: source, maxWidth: 640, maxHeight: 280, imageQuality: 100 //0-100
      );
}

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnimationController startAnimation;

    return ListView(children: [
      Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              '23-02-13',
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w400,
              ),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: (() {
                      showDialog(
                          context: context,
                          builder: (context) => const CalenderScreen());
                    }),
                    icon: const Icon(Icons.calendar_month_sharp, size: 40)),
                const SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileScreen()));
                    },
                    icon: const Icon(Icons.person_sharp, size: 40))
              ],
            ),
          ],
        ),
      ),
      Container(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
        ),
        margin: const EdgeInsets.only(
          bottom: 10,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          // border: Border(
          //   bottom: BorderSide(
          //     color: Colors.black26,
          //     width: 1,
          //   ),
          // ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            RecordCircle(data: '?????????'),
            RecordCircle(data: '????????????'),
            RecordCircle(data: '??????'),
            RecordCircle(data: '?????????'),
            RecordCircle(data: 'Kcal')
          ],
        ),
      ),
      // const Text('?????? ?????? ?????? ????????? ????????????? ',
      //     textAlign: TextAlign.center,
      //     style: TextStyle(
      //       backgroundColor: Colors.white,
      //       fontSize: 20,
      //       fontFamily: "Pura",
      //       fontWeight: FontWeight.w200,
      //     )),
      const SizedBox(height: 15),
      Column(
        children: [
          Container(
              width: 200,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(60)),
              child: const Image(image: AssetImage('images/test_food.jpg'))),
          Transform.scale(
            scale: 2,
            child: Transform.translate(
                offset: const Offset(60, -20),
                child: IconButton(
                  onPressed: () {
                    //getImage(source: ImageSource.camera);

                    showDialog(
                        context: context,
                        builder: (context) => const CameraScreen());

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const CameraScreen()));
                  },
                  icon: const Icon(
                    Icons.add_circle_rounded,
                    size: 30,
                  ),
                )),
          ),
        ],
      ),
      Row(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '????????? ??????',
              style: TextStyle(fontSize: 15, fontFamily: "Pura"),
            ),
          ),
          Container(
            height: 1.0,
            width: 200,
            color: Colors.black26,
          ),
        ],
      ),
      SizedBox(
          height: 60,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (context, index) {
              var image = [
                const Image(image: AssetImage('images/test_food.jpg')),
                const Image(image: AssetImage('images/test_food.jpg')),
                const Image(image: AssetImage('images/test_food.jpg')),
                const Image(image: AssetImage('images/test_food.jpg')),
                const Image(image: AssetImage('images/test_food.jpg')),
                const Image(image: AssetImage('images/test_food.jpg')),
                const Image(image: AssetImage('images/test_food.jpg')),
              ];

              var img = image[index];
              return img;
            },
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
          )),
    ]);
  }
}

class RecordCircle extends StatelessWidget {
  final String data;

  const RecordCircle({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(children: [
        Text(data,
            style: const TextStyle(
              fontFamily: "Pura",
              fontSize: 15,
            )),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 60,
          height: 60,
          child: ChartPage(),
        )
      ]),
    );
  }
}
