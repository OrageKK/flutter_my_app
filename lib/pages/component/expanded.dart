import 'package:flutter/material.dart';

class ExpandedComponent extends StatelessWidget {
  const ExpandedComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
          color: Colors.black,
          width: double.infinity,
          height: 150,
        ),
        const SizedBox(height: 5.0),
        Container(
          color: Colors.black12,
          height: 180,
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 180,
                  child: Image.network(
                    "https://image.photocnc.com/aoaodcom/2022-09/29/20220929094537482c15f310c261f6730f19e228d1a7f9.jpg.h700.webp",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  height: 180,
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Image.network(
                          "https://image.photocnc.com/aoaodcom/2022-09/26/20220926102107495415b3509347ad804da33b89474e59.png.h700.webp",
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Expanded(
                        flex: 1,
                        child: Image.network(
                          "http://img.netbian.com/file/2021/0519/smallf170a17ad1ee721a3489012b197186301621353917.jpg",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        ],
      );
  }
}