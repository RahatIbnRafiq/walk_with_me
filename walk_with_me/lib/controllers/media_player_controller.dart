import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';

import 'package:walk_with_me/models/site.dart';

class ProgressBarState {
  ProgressBarState({
    required this.current,
    required this.buffered,
    required this.total,
  });
  final Duration current;
  final Duration buffered;
  final Duration total;
}

enum ButtonState { paused, playing, loading }

class MediaPlayerController extends GetxController {
  var progressBarState = ProgressBarState(
    current: Duration.zero,
    buffered: Duration.zero,
    total: Duration.zero,
  ).obs;
  var playlist = [].obs;
  var mediaTitle = "".obs;
  var mediaTitles = [].obs;
  var isFirstMedia = true.obs;
  var isLastMedia = false.obs;
  var buttonState = ButtonState.paused.obs;

  late AudioPlayer _audioPlayer;
  late ConcatenatingAudioSource _playlistWithAudioSource;

  final FlutterTts tts = FlutterTts();

  @override
  void onInit() {
    initMediaPlayer();
    initPlayList();
    debugPrint("Initializing media controller now...");
    List? storedPlaylist = GetStorage().read<List>('playlist');
    try {
      playlist = storedPlaylist!.map((e) => Site.fromJson(e)).toList().obs;
      debugPrint("playlist got loaded from storage, playlist length is : " +
          playlist.length.toString());
      debugPrint("Loading the playlist into the media player now: ");
      for (var site in playlist) {
        //var src = Uri.file(site.audioSource);
        var media = AudioSource.uri(site.audioSource, tag: site.name);
        _playlistWithAudioSource.add(media);
        debugPrint("now the media player has how many playlists? : " +
            _playlistWithAudioSource.length.toString());
      }

      debugPrint("Finally how many playlists does the media player have? : " +
          _playlistWithAudioSource.length.toString());
    } catch (e) {
      debugPrint("Exception took place when loading playlist: " + e.toString());
    }

    ever(playlist, (_) {
      GetStorage().write('playlist', playlist.toList());
      debugPrint("Written to storage. playlist length now: " +
          playlist.length.toString());
    });
    super.onInit();
  }

  @override
  InternalFinalCallback<void> get onDelete {
    debugPrint("onDelete called for media controller");
    return super.onDelete;
  }

  void initMediaPlayer() async {
    _audioPlayer = AudioPlayer();
    _listenForChangesInPlayerState();
    _listenForStatesInPlayerPosition();
    _listenForChangesInSequenceState();
  }

  void initPlayList() async {
    _playlistWithAudioSource = ConcatenatingAudioSource(children: []);

    await _audioPlayer.setAudioSource(_playlistWithAudioSource);
  }

  void play() {
    _audioPlayer.play();
  }

  void pause() {
    _audioPlayer.pause();
  }

  void seek(Duration position) {
    _audioPlayer.seek(position);
  }

  void onPreviousSongButtonPressed() {
    _audioPlayer.seekToPrevious();
  }

  void onNextSongButtonPressed() {
    _audioPlayer.seekToNext();
  }

  String getPlaylistMediaImageUrls(String siteName) {
    for (var playlistsSite in playlist) {
      if (playlistsSite.name!.compareTo(siteName) == 0) {
        return playlistsSite.imageUrls![0];
      }
    }
    return "";
  }

  bool isAlreadyAddedToPlaylist(Site site) {
    for (var playlistSite in playlist) {
      if (site.name == playlistSite.name) {
        return true;
      }
    }
    return false;
    // return playlistController.isAlreadyAddedToPlaylist(site);
    // if (mediaTitles.contains(site.name)) {
    //   return true;
    // }
    // return false;
  }

  // Future<void> writeToFile(ByteData data, String path) {
  //   final buffer = data.buffer;
  //   return File(path).writeAsBytes(
  //       buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  // }

  void addMedia(Site site) async {
    final externalDirectory = await getExternalStorageDirectory();
    var mediaName = site.name! + ".mp4";
    var externalPath = '${externalDirectory!.path}/$mediaName';
    debugPrint("Adding media For site: " + site.name!);
    await tts.synthesizeToFile(site.description!, mediaName);

    sleep(const Duration(seconds: 3));
    var src = Uri.file(externalPath);
    var media = AudioSource.uri(src, tag: site.name);
    site.audioSource = Uri.parse(externalPath.toString());
    playlist.add(site);
    _playlistWithAudioSource.add(media);
    debugPrint("Current playlist length is :" + playlist.length.toString());
    debugPrint("Added media to the playlist: " + externalPath.toString());
  }

  void removeMedia(int index) {
    if (index < 0) return;
    playlist.removeAt(index);
    _playlistWithAudioSource.removeAt(index);
  }

  void _listenForChangesInSequenceState() {
    _audioPlayer.sequenceStateStream.listen((sequenceState) {
      if (sequenceState == null) return;

      final currentItem = sequenceState.currentSource;
      final title = currentItem?.tag as String?;
      mediaTitle.value = title ?? '';

      // update playlist
      final playlist = sequenceState.effectiveSequence;
      final titles = playlist.map((item) => item.tag as String).toList();
      mediaTitles.value = titles;

      if (playlist.isEmpty || currentItem == null) {
        isFirstMedia.value = true;
        isLastMedia.value = true;
      } else {
        isFirstMedia.value = playlist.first == currentItem;
        isLastMedia.value = playlist.last == currentItem;
      }
    });
  }

  void _listenForChangesInPlayerState() {
    _audioPlayer.playerStateStream.listen((playerState) {
      final isPlaying = playerState.playing;
      final processingState = playerState.processingState;
      if (processingState == ProcessingState.loading ||
          processingState == ProcessingState.buffering) {
        buttonState.value = ButtonState.loading;
      } else if (!isPlaying) {
        buttonState.value = ButtonState.paused;
      } else if (processingState != ProcessingState.completed) {
        buttonState.value = ButtonState.playing;
      } else {
        _audioPlayer.seek(Duration.zero);
        _audioPlayer.pause();
        buttonState.value = ButtonState.paused;
      }
    });
  }

  void _listenForStatesInPlayerPosition() {
    _audioPlayer.positionStream.listen((position) {
      final oldState = progressBarState.value;
      progressBarState.value = ProgressBarState(
        current: position,
        buffered: oldState.buffered,
        total: oldState.total,
      );
    });

    _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
      final oldState = progressBarState.value;
      progressBarState.value = ProgressBarState(
        current: oldState.current,
        buffered: bufferedPosition,
        total: oldState.total,
      );
    });

    _audioPlayer.durationStream.listen((totalDuration) {
      final oldState = progressBarState.value;
      progressBarState.value = ProgressBarState(
        current: oldState.current,
        buffered: oldState.buffered,
        total: totalDuration ?? Duration.zero,
      );
    });
  }
}
