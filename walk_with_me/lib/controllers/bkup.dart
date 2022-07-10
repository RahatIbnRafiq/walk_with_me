// // Another try: create the wav file from tts. copy the file to
//     //asset play from asset.

//     //create the wav file from tts
//     var mediaName = site.name + ".wav";
//     var fullLocation =
//         '/storage/emulated/0/Android/data/com.wwm.walkwithme/files/' +
//             mediaName;
//     await tts.synthesizeToFile(site.description, mediaName);
//     debugPrint("Yay I have saved the file! full location is " + fullLocation);

//     // loop through all files in the directory and
//     // take the file that matches this site to copy it to the
//     // asset folder
//     File recordedFile = File(fullLocation);

//     // copy to the asset folder
//     var uri = Uri.parse('asset:///assets/audios/audio4.wav');
//     debugPrint("Asset path: " + uri.toString());
//     await recordedFile.copy(uri.path);

//     //play from assets
//     //await _audioPlayer.setAsset('assets/audio/horse.mp3');
//     // _playlist.add(
//     //   AudioSource.uri(site.audioSource, tag: site.name),
//     // );

//     // delete the file if already exists
//     // var files =
//     //     Directory('/storage/emulated/0/Android/data/com.wwm.walkwithme/files/')
//     //         .listSync();

//     // for (var file in files) {
//     //   debugPrint("already this file exists: " + file.path);
//     //   if (file.path.toString().contains(site.name)) {
//     //     await file.delete();
//     //   }
//     // }

//     // var files =
//     //     Directory('/storage/emulated/0/Android/data/com.wwm.walkwithme/files/')
//     //         .listSync();

//     // for (var file in files) {
//     //   debugPrint("After deleting: " + file.path);
//     //   if (file.path.toString().contains(site.name)) {
//     //     await file.delete();
//     //   }
//     // }

//     // var mediaName = site.name + ".caf";
//     // var fullLocation =
//     //     '/storage/emulated/0/Android/data/com.wwm.walkwithme/files/' +
//     //         mediaName;
//     // await tts.synthesizeToFile(site.description, mediaName);
//     // debugPrint("Yay I have saved the file! full location is " + fullLocation);

//     // var files =
//     //     Directory('/storage/emulated/0/Android/data/com.wwm.walkwithme/files/')
//     //         .listSync();

//     // debugPrint("total files found after tts call: " + files.length.toString());
//     // for (var file in files) {
//     //   debugPrint(
//     //       "current file in this directory after tts call : " + file.path);
//     //   if (file.path.toString().contains(site.name + ".caf")) {
//     //     var src = Uri.file(file.path);
//     //     var media = AudioSource.uri(src, tag: site.name);
//     //     _playlist.add(tts.speak(site.name));
//     //   }
//     // }

//     //var src = Uri.file(fullLocation);
//     //var media = AudioSource.uri(src, tag: site.name);
//     //_playlist.add(media);

//     // _audioPlayer.setFilePath(fullLocation);
//     // _audioPlayer.play();
//     //getAssetPath("audios/audio3.wav");

//     // final media = AudioSource.uri(site.audioSource, tag: site.name);
//     // _playlist.add(media);




// await DatabaseHelper.instance
//         .addAudios(Audio(name: site.name, audio: bytes));
//     DatabaseHelper.instance.getAudios().then((audioItems) {
//       debugPrint("Got all the audios from sqlite. Total audios : " +
//           audioItems.length.toString());
//     });








// ByteData audioData = await NetworkAssetBundle(Uri.parse(
    //         "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-16.mp3"))
    //     .load("");
    // Uint8List bytes = audioData.buffer.asUint8List();
    // Directory directory = await getApplicationDocumentsDirectory();
    // debugPrint("downloaded audio: bytes length " + bytes.length.toString());
    // var fullPath = directory.path + '/' + site.name + '.mp3';
    // debugPrint("application directory path " + fullPath);
    // await writeToFile(audioData, fullPath);

    // var files = Directory(directory.path).listSync();
    // for (var file in files) {
    //   if (file.path.toString().contains(site.name + ".mp3")) {
    //     debugPrint("found audio " +
    //         file.path.toString() +
    //         " for this site " +
    //         site.name);
    //     var src = Uri.file(file.path);
    //     var media = AudioSource.uri(src, tag: site.name);
    //     _playlist.add(media);
    //   }
    // }







  //   void addMedia(Site site) async {
  //   final applicationDirectory = await getApplicationDocumentsDirectory();
  //   final externalDirectory = await getExternalStorageDirectory();
  //   var mediaName = site.name + ".mp4";
  //   var applicationPath = applicationDirectory.path + '/' + mediaName;
  //   var externalPath = '${externalDirectory!.path}/$mediaName';

  //   await tts.synthesizeToFile(site.description, mediaName);
  //   sleep(const Duration(seconds: 10));

  //   // debugPrint(
  //   //     "extrernal storage, where tts stored the audio: " + externalPath);
  //   // debugPrint("application folder: " + applicationPath);

  //   // final File file = File(externalPath);
  //   // var bytes = await file.readAsBytes();
  //   // ByteData audioData = ByteData.sublistView(bytes);
  //   // await writeToFile(audioData, applicationPath);

  //   var src = Uri.file(externalPath);
  //   var media = AudioSource.uri(src, tag: site.name);
  //   _playlist.add(media);

  //   // var content = await rootBundle.load("assets/audios/" + mediaName);
  //   // file.writeAsBytesSync(content.buffer.asUint8List());
  //   // await _audioPlayer.setFilePath(file.path);
  //   // _audioPlayer.play();
  // }

  // this is it
  //   void addMedia(Site site) async {
  //   final externalDirectory = await getExternalStorageDirectory();
  //   var mediaName = site.name + ".mp4";
  //   var externalPath = '${externalDirectory!.path}/$mediaName';
  //   await tts.synthesizeToFile(site.description, mediaName);
  //   sleep(const Duration(seconds: 3));
  //   var src = Uri.file(externalPath);
  //   var media = AudioSource.uri(src, tag: site.name);
  //   _playlist.add(media);
  // }



  // Future<ByteData> _read(String path, Site site) async {
  //   ByteData audioData;
  //   try {
  //     final File file = File(path);
  //     var bytes = await file.readAsBytes();
  //     audioData = ByteData.sublistView(bytes);
  //   } catch (e) {
  //     debugPrint("Couldn't read file");
  //   }
  //   return audioData;
  // }

  //   Future<String> _localPath() async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   return directory.path;
  // }


    // Future<String> getAssetPath(String path) async {
  //   final byteData = await rootBundle.load('assets/' + path);
  //   debugPrint("loaded path : assets/" + path);
  //   var temp = await getTemporaryDirectory();
  //   debugPrint("loaded temp path : " + temp.path);
  //   debugPrint("loaded full path : " + temp.path + "/" + path);
  //   return

  //   // final file = File('${(await getTemporaryDirectory()).path}/$path');
  //   // await file.writeAsBytes(byteData.buffer
  //   //     .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  // }