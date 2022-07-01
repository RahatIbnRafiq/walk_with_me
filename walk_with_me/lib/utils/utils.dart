import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/models/site.dart';

class Utils {
  static SnackbarController getErrorSnackbarBottom(title, message, error) {
    return Get.snackbar(
      title,
      message,
      messageText: Text(error),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent,
    );
  }

  static List<String> getSuggestions(String query, List<String> candidates) {
    List<String> matches = [];
    if (query.isEmpty) {
      return matches;
    }
    matches.addAll(candidates);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    if (matches.length > 3) {
      return matches.sublist(0, 4);
    }
    return matches;
  }

  static Site getSiteFromDocumentSnapshot(
      {required DocumentSnapshot documentSnapshot}) {
    return Site(
      name: documentSnapshot["name"],
      description: documentSnapshot["description"],
      imageUrls: documentSnapshot["images"],
      location: documentSnapshot["location"],
      tags: documentSnapshot["tags"],
      city: documentSnapshot["city"],
    );
  }
}
