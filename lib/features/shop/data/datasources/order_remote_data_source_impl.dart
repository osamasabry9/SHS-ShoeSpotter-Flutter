import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/order_model.dart';

import '../../../../core/utils/constants/api_constants.dart';
import 'order_remote_data_source.dart';

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  
  final FirebaseFirestore firebaseFirestore;
  final FirebaseAuth firebaseAuth;
  OrderRemoteDataSourceImpl({required this.firebaseFirestore , required this.firebaseAuth});

  @override
  Future<OrderModel> getOrderById(String id) {
    // TODO: implement getOrderById
    throw UnimplementedError();
  }

  @override
  Future<List<OrderModel>> getUserOrders()async {
   try{
    final userId = firebaseAuth.currentUser!.uid;

    if(userId.isEmpty) throw 'Unable to find user information. Please try again.';

    final querySnapshot = await firebaseFirestore
        .collection(FirebaseConst.USERS_COLLECTION)
        .doc(userId)
        .collection(FirebaseConst.ORDERS_COLLECTION)
        .get();
    final listOrders = querySnapshot.docs
        .map((document) => OrderModel.fromSnapshot(document))
        .toList();
    return listOrders;
   } catch(e){
    throw 'Something went wrong while fetching orders. Please try again.';
   }
  }

  @override
  Future<void> saveOrder(OrderModel order) async{
    try{
      final userId = firebaseAuth.currentUser!.uid;
      if(userId.isEmpty) throw 'Unable to find user information. Please try again.';
      await firebaseFirestore
        .collection(FirebaseConst.USERS_COLLECTION)
        .doc(userId)
        .collection(FirebaseConst.ORDERS_COLLECTION)
        .add(order.toJson());
    }catch(e){
      throw 'Something went wrong while saving order. Please try again.';
    }
  }

  @override
  Future<void> uploadOrder(OrderModel order) {
    // TODO: implement uploadOrder
    throw UnimplementedError();
  }

  
}