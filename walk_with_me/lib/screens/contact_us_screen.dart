import 'package:feedback/feedback.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:get/get.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 10),
          MarkdownBody(
            data: 'feedback_data'.tr,
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            child: Text('start_feedback'.tr),
            onPressed: () {
              BetterFeedback.of(context).show((UserFeedback feedback) {});
            },
          ),
        ],
      ),
    );
  }
}
