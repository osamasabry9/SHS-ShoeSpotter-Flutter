import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import '../../../../core/utils/constants/api_constants.dart';
import '../../../../core/utils/exceptions/firebase_exception.dart';
import '../../../../core/utils/exceptions/platform_exception.dart';
import '../models/banner_model.dart';
import 'banner_remote_data_source.dart';

class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  final FirebaseFirestore firebaseFirestore;

  BannerRemoteDataSourceImpl({required this.firebaseFirestore});

  @override
  Future<List<BannerModel>> getAllBanners() async {
    try {
      final response = await firebaseFirestore
          .collection(FirebaseConst.BANNERS_COLLECTION).where("active", isEqualTo: true)
          .get();

      final listCategories = response.docs
          .map((document) => BannerModel.fromSnapshot(document))
          .toList();

      return listCategories;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }

  @override
  Future<void> uploadBanner(BannerModel banner) async {
    try {
      await firebaseFirestore
          .collection(FirebaseConst.BANNERS_COLLECTION)
          .doc()
          .set(banner.toJson());
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. please try again.';
    }
  }
}
