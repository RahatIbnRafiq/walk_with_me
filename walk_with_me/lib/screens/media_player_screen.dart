import 'dart:io';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/data_controller.dart';
import 'package:walk_with_me/controllers/media_player_controller.dart';
// import 'package:walk_with_me/services/backend_service.dart';

class MediaPlayerScreen extends StatelessWidget {
  const MediaPlayerScreen({Key? key}) : super(key: key);

  IconButton previousSongButton(MediaPlayerController mediaPlayerController) {
    return IconButton(
      iconSize: 50,
      icon: mediaPlayerController.isFirstMedia.value
          ? const Icon(Icons.skip_previous, color: Colors.grey)
          : const Icon(Icons.skip_previous, color: Colors.black),
      onPressed: () {
        mediaPlayerController.onPreviousSongButtonPressed();
      },
    );
  }

  IconButton nextSongButton(MediaPlayerController mediaPlayerController) {
    return IconButton(
      iconSize: 50,
      icon: mediaPlayerController.isLastMedia.value
          ? const Icon(Icons.skip_next, color: Colors.grey)
          : const Icon(Icons.skip_next, color: Colors.black),
      onPressed: () {
        mediaPlayerController.onNextSongButtonPressed();
      },
    );
  }

  Widget audioControlButtons(MediaPlayerController mediaPlayerController) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          previousSongButton(mediaPlayerController),
          playerButton(mediaPlayerController),
          nextSongButton(mediaPlayerController),
        ]),
      ),
    );
  }

  Widget playlistBackgroundImage(MediaPlayerController mediaPlayerController,
      DataController datacontroller, Size size) {
    if (mediaPlayerController.mediaTitles.isNotEmpty) {
      return SizedBox(
        height: 250,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Container(
                decoration: BoxDecoration(boxShadow: const [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 50,
                      spreadRadius: 5,
                      offset: Offset(-10, 40))
                ], borderRadius: BorderRadius.circular(40)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            mediaPlayerController.getPlaylistMediaImageUrls(
                                mediaPlayerController.mediaTitle.value
                                    .toString())),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: NetworkImage(SitesService.getSiteUrlByName(
                //             mediaPlayerController.mediaTitle.value.toString())),
                //         fit: BoxFit.cover),
                //     borderRadius: BorderRadius.circular(20)),
              ),
            ),
            currentSongTitle(mediaPlayerController, size),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text("Empty playlist"),
      );
    }
  }

  Widget currentSongTitle(
      MediaPlayerController mediaPlayerController, Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: SizedBox(
        child: Center(
          child: Text(
            mediaPlayerController.mediaTitle.value,
            maxLines: 3,
            style: const TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Widget addRemoveSongButton(MediaPlayerController mediaPlayerController) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 20.0),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       children: [
  //         FloatingActionButton(
  //           onPressed: () {
  //             mediaPlayerController.addMedia();
  //           },
  //           child: const Icon(Icons.add),
  //         ),
  //         FloatingActionButton(
  //           onPressed: () {
  //             //mediaPlayerController.removeMedia();
  //           },
  //           child: const Icon(Icons.remove),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  StatelessWidget playerButton(MediaPlayerController mediaPlayerController) {
    if (mediaPlayerController.buttonState.value == ButtonState.paused) {
      return IconButton(
        icon: const Icon(
          Icons.play_arrow,
          color: Colors.black,
        ),
        iconSize: 50,
        onPressed: () {
          mediaPlayerController.play();
        },
      );
    } else if (mediaPlayerController.buttonState.value == ButtonState.playing) {
      return IconButton(
        icon: const Icon(
          Icons.pause,
          color: Colors.black,
        ),
        iconSize: 50,
        onPressed: () {
          mediaPlayerController.pause();
        },
      );
    } else {
      return Container(
        margin: const EdgeInsets.all(8.0),
        width: 32.0,
        height: 32.0,
        child: const CircularProgressIndicator(),
      );
    }
  }

  Widget playListItem(MediaPlayerController mediaPlayerController,
      DataController datacontroller, int index) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      onDismissed: (_) {
        mediaPlayerController.removeMedia(index);
      },
      key: UniqueKey(),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Card(
          elevation: 0,
          color: Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(
                  mediaPlayerController.getPlaylistMediaImageUrls(
                      mediaPlayerController.mediaTitles[index])),
            ),
            // leading: CircleAvatar(
            //   radius: 30.0,
            //   backgroundImage: NetworkImage(SitesService.getSiteUrlByName(
            //       mediaPlayerController.mediaTitles[index])),
            // ),
            title: Text(mediaPlayerController.mediaTitles[index]),
          ),
        ),
      ),
      background: Container(
        color: Colors.red,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        alignment: Alignment.centerRight,
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget playList(MediaPlayerController mediaPlayerController,
      DataController datacontroller, Size size) {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: mediaPlayerController.mediaTitles.length,
        //itemCount: 10,
        itemBuilder: (context, index) {
          return playListItem(mediaPlayerController, datacontroller, index);
        },
      ),
    );
  }

  Widget playerControllWidget(MediaPlayerController mediaPlayerController,
      DataController datacontroller, Size size) {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: ProgressBar(
                progress: mediaPlayerController.progressBarState.value.current,
                buffered: mediaPlayerController.progressBarState.value.buffered,
                total: mediaPlayerController.progressBarState.value.total,
                onSeek: mediaPlayerController.seek,
                progressBarColor: Colors.black,
                baseBarColor: Colors.white.withOpacity(0.24),
                bufferedBarColor: Colors.black.withOpacity(0.24),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                previousSongButton(mediaPlayerController),
                playerButton(mediaPlayerController),
                nextSongButton(mediaPlayerController),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaPlayerController mediaPlayerController =
        Get.find<MediaPlayerController>();
    DataController dataController = Get.find<DataController>();
    Size size = MediaQuery.of(context).size;

    sleep(const Duration(seconds: 2));
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Obx(
        () => Column(
          children: [
            playlistBackgroundImage(
                mediaPlayerController, dataController, size),
            const SizedBox(
              height: 20,
            ),
            playList(mediaPlayerController, dataController, size),
            const SizedBox(
              height: 10,
            ),
            playerControllWidget(mediaPlayerController, dataController, size),
          ],
        ),
      ),
    );
  }
}
