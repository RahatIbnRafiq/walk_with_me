import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:walk_with_me/models/site.dart';

class PlayListController extends GetxController {
  var playlist = [].obs;

  @override
  void onInit() {
    List? storedPlaylist = GetStorage().read<List>('playlist');
    try {
      playlist = storedPlaylist!.map((e) => Site.fromJson(e)).toList().obs;
    } catch (e) {
      debugPrint("Exception took place when loading playlist: " + e.toString());
    }

    ever(playlist, (_) {
      GetStorage().write('playlist', playlist.toList());
    });
    super.onInit();
  }

  void add(Site site) {
    playlist.add(site);
    debugPrint("Current playlist length is :" + playlist.length.toString());
  }

  void remove(Site site) {
    for (var playlistSite in playlist) {
      if (site.name == playlistSite.name) {
        playlist.remove(playlistSite);
      }
    }
  }

  bool isAlreadyAddedToPlaylist(Site site) {
    for (var playlistSite in playlist) {
      if (site.name == playlistSite.name) {
        return true;
      }
    }
    return false;
  }
}
