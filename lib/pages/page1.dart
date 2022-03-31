import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/styles.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Contacts',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle,
                              color: Colors.black,
                            )),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                      prefixIconConstraints:
                      const BoxConstraints(maxHeight: 20, maxWidth: 35),
                      hintText: 'Contacts',
                      enabledBorder: AppStyles.inputFieldBorder,
                      disabledBorder: AppStyles.inputFieldBorder,
                      focusedBorder: AppStyles.inputFieldBorder,
                      errorBorder: AppStyles.inputFieldBorder,
                      filled: true,
                      fillColor: AppColors.grey,
                      isDense: true,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Last contacted',
                    style:
                    TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  SizedBox(
                    height: 60,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(
                          parent: AlwaysScrollableScrollPhysics()),
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return SizedBox(
                          width: 59,
                          height: 59,
                          child: Stack(
                            fit: StackFit.loose,
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Container(
                                    width: 56,
                                    height: 56,
                                    color: AppColors.grey,
                                  ),
                                ),
                              ),
                              Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Container(
                                      width: 18,
                                      height: 18,
                                      color: Colors.red,
                                    ),
                                  ))
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(
                          width: 16,
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(24, 44, 26, 0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(24),
                          topRight: Radius.circular(24)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xffC4C4C4).withOpacity(0.25),
                          blurRadius: 8,
                          spreadRadius: 0,
                          offset: const Offset(0, -4),
                        ),
                      ]),
                  child: ListView.separated(
                      itemBuilder: (_, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 56,
                              height: 56,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color: AppColors.grey,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          'Hoang Hong Quan',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text('14:23',style: TextStyle(
                                            color: AppColors.grey
                                        ),),
                                      ],
                                    ),
                                    const SizedBox(height: 5,),
                                    const Text('Lorem ipsum dolor sit amet, connect'),
                                  ],
                                ),
                              ),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (c, i) {
                        return const SizedBox(
                          height: 24,
                        );
                      },
                      itemCount: 10),
                ))
          ],
        ),
      ),
    );
  }
}
