import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walk_with_me/controllers/media_player_controller.dart';
import 'package:walk_with_me/models/site.dart';

class SiteItem extends StatefulWidget {
  const SiteItem({
    Key? key,
    required this.site,
  }) : super(key: key);

  final Site site;

  @override
  State<SiteItem> createState() => _SiteItemState();
}

class _SiteItemState extends State<SiteItem> {
  @override
  Widget build(BuildContext context) {
    MediaPlayerController mediaPlayerController =
        Get.find<MediaPlayerController>();

    return GestureDetector(
      onTap: () {
        Get.toNamed("/sitedetails", arguments: {'site': widget.site});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: const EdgeInsets.all(10.0),
        width: 150.0,
        height: 200.0,
        child: Stack(
          children: [
            Hero(
              tag: 'site_' + widget.site.name,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: ColorFiltered(
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4), BlendMode.dstATop),
                  child: Image(
                    height: double.infinity,
                    width: double.infinity,
                    image: NetworkImage(widget.site.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 10.0,
              left: 10.0,
              child: SizedBox(
                width: 150,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.site.name,
                        maxLines: 3,
                        style: const TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        widget.site.description,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        style: const TextStyle(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Text(
                      "Tags:" + widget.site.category.join(","),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 10.0,
              right: 10.0,
              child: IconButton(
                icon: Icon(
                  mediaPlayerController.isAlreadyAddedToPlaylist(widget.site)
                      ? Icons.playlist_add_check_circle
                      : Icons.play_circle_filled,
                  color: Colors.black26,
                ),
                iconSize: 70,
                alignment: Alignment.center,
                onPressed: () {
                  String message = 'Added to Playlist';
                  if (mediaPlayerController
                      .isAlreadyAddedToPlaylist(widget.site)) {
                    message = "Already added to the playlist";
                  } else {
                    mediaPlayerController.addMedia(widget.site);
                  }
                  final snackBar = SnackBar(
                    duration: const Duration(milliseconds: 300),
                    content: Text(message),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  setState(() {});
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
