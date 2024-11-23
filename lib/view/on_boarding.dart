import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  PageController? controller;
  @override
  void initState() {
    controller = PageController(initialPage: 0);
    super.initState();
  }

  // @override
  // void dispose() {
  // controller.dispose();
  //   super.dispose();
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(

          children: [
            
            Expanded(
              child: PageView.builder(
                controller: controller,
                itemCount: 3,
                onPageChanged: (int index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.6,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.grey.shade200),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Welcome to Buz',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                (index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.25,
                    height: 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: currentIndex == index
                            ? Colors.black
                            : Colors.grey.shade200),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
                minimumSize: Size(MediaQuery.of(context).size.width, 40),
              ),
              onPressed: () {
                if (currentIndex < 2) {
                  controller!.nextPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceIn);
                }
              },
              child: Text(
                currentIndex == 2 ? 'Continue' : 'Next',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
