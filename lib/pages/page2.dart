import 'package:clone_ui/res/colors.dart';
import 'package:flutter/material.dart';

class Page2 extends StatefulWidget {
  Page2({Key? key}) : super(key: key);

  final List<MessageModel> messages = [
    MessageModel(
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie fermentum porttitor diam purus ",
        isRight: false,
        time: "08:30"),
    MessageModel(
        text:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Molestie.",
        isRight: false,
        time: "08:30"),
    MessageModel(
        text: "Lorem ipsum dolor amet, consectetur.",
        isRight: true,
        time: "08:30"),
    MessageModel(text: "Consectetur", isRight: false, time: "08:30"),
    MessageModel(text: "ipsum .", isRight: true, time: "08:30")
  ];

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(25, 40, 25, 45),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                        size: 25,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.grey,
                          hintStyle: const TextStyle(fontSize: 18),
                          hintText: "Search conversations",
                          prefixIcon: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                          prefixIconConstraints:
                              const BoxConstraints(maxHeight: 25, maxWidth: 50),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Justin Wan",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          Wrap(
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.grey,
                                ),
                                child: const Icon(
                                  Icons.phone,
                                  color: Colors.black,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: AppColors.grey,
                                ),
                                child: const Icon(
                                  Icons.videocam,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                )),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(24, 44, 26, 0),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(25),
                        topLeft: Radius.circular(25)),
                    boxShadow: [
                      BoxShadow(
                        offset: const Offset(0, -4),
                        spreadRadius: 0,
                        blurRadius: 8,
                        color: const Color(0xffC4C4C4).withOpacity(0.25),
                      )
                    ],
                    color: Colors.white),
                child: Column(
                  children: [
                    Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(
                                parent: AlwaysScrollableScrollPhysics()),
                            itemCount: widget.messages.length,
                            itemBuilder: (_, index) {
                              var showProfileBox = true;
                              if (index != 0) {
                                showProfileBox =
                                    widget.messages[index].isRight !=
                                        widget.messages[index - 1].isRight;
                              }
                              return _buildChat(
                                  widget.messages[index], showProfileBox);
                            }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChat(MessageModel messageModel, bool showProfileBox) {
    return messageModel.isRight
        ? Container(
            margin: const EdgeInsets.only(bottom: 42),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Text(messageModel.time),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(18, 13, 18, 12),
                          decoration: const BoxDecoration(
                            color: Color(0xffD0D0D0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: Text(messageModel.text),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        : Container(
            margin: const EdgeInsets.only(bottom: 42),
            child: Row(
              children: [
                Flexible(
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Visibility(
                          maintainState: true,
                          maintainAnimation: true,
                          maintainSize: true,
                          visible: showProfileBox,
                          child: Container(
                            margin: EdgeInsets.only(right: 20),
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Color(0xffD0D0D0),
                            ),
                          )),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(18, 13, 18, 12),
                          decoration: const BoxDecoration(
                            color: Color(0xffD0D0D0),
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                                bottomRight: Radius.circular(20)),
                          ),
                          child: Text(messageModel.text),
                        ),
                      ),

                    ],
                  ),
                ),

                Visibility(
                  visible: showProfileBox,
                  maintainAnimation: true,
                  maintainSize: true,
                  maintainState: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(messageModel.time),
                  ),
                ),
              ],
            )
          );
  }
}

class MessageModel {
  final String text;
  final String time;
  final bool isRight;
  MessageModel({required this.text, required this.time, required this.isRight});
}
