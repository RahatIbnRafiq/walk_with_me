import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:get/get.dart';
import 'package:walk_with_me/models/city.dart';
import 'package:walk_with_me/models/site.dart';
import 'package:walk_with_me/utils/utils.dart';

class DataController extends GetxController {
  Rx<List<City>> cityList = Rx<List<City>>([]);
  List<Site> sites = [];
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  late CollectionReference cityCollectionReference;
  late CollectionReference siteCollectionRefernece;

  @override
  void onInit() {
    super.onInit();
    cityCollectionReference = firebaseFirestore.collection("city");
    siteCollectionRefernece = firebaseFirestore.collection("sites");
    cityList.bindStream(getAllCities());
  }

  Future<List<Site>> getSitesByCity(String city) async {
    sites = [];
    firebaseFirestore
        .collection('sites')
        .where('city', isEqualTo: city)
        .snapshots()
        .listen((data) {
      var docs = data.docs;
      for (var doc in docs) {
        Site site = Utils.getSiteFromDocumentSnapshot(documentSnapshot: doc);
        sites.add(site);
      }
    });

    return sites;
  }

  String getSiteUrlByName(String siteName) {
    for (var site in sites) {
      if (site.name!.compareTo(siteName) == 0) {
        return site.imageUrls![0];
      }
    }
    return "";
  }

  Stream<List<City>> getAllCities() =>
      cityCollectionReference.snapshots().map((query) => query.docs
          .map((item) => City.fromDocumentSnapshot(documentSnapshot: item))
          .toList());
}
