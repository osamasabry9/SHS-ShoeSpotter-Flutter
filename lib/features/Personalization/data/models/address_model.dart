import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../core/utils/formatters/formatter.dart';
import '../../domain/entities/address_entity.dart';

// ignore: must_be_immutable
class AddressModel extends AddressEntity {
  AddressModel({
    required super.id,
    required super.name,
    required super.street,
    required super.city,
    required super.state,
    required super.country,
    required super.postalCode,
    required super.phoneNumber,
    super.dateTime,
    super.selectedAddress = true,
  });

  String get formattedPhoneNo => AppFormatter.formatPhoneNumber(phoneNumber);

  static AddressModel empty() => AddressModel(
      id: '',
      name: '',
      street: '',
      city: '',
      state: '',
      country: '',
      postalCode: '',
      phoneNumber: '');

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'street': street,
        'city': city,
        'state': state,
        'country': country,
        'postalCode': postalCode,
        'phoneNumber': phoneNumber,
        'dateTime': dateTime,
        'selectedAddress': selectedAddress
      };
  factory AddressModel.fromMap(Map<String, dynamic> data) {
    return AddressModel(
      id: data['id'] as String,
      name: data['name'] as String,
      street: data['street'] as String,
      city: data['city'] as String,
      state: data['state'] as String,
      country: data['country'] as String,
      postalCode: data['postalCode'] as String,
      phoneNumber: data['phoneNumber'] as String,
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      selectedAddress: data['selectedAddress'] as bool,
    );
  }

  factory AddressModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return AddressModel(
      id: snapshot.id,
      name: data['name'] ?? '',
      street: data['street'] ?? '',
      city: data['city'] ?? '',
      state: data['state'] ?? '',
      country: data['country'] ?? '',
      postalCode: data['postalCode'] ?? '',
      phoneNumber: data['phoneNumber'] ?? '',
      dateTime: (data['dateTime'] as Timestamp).toDate(),
      selectedAddress: data['selectedAddress'] as bool,
    );
  }

  @override
  String toString() {
    return '$street, $city, $state $postalCode, $country';
  }
}
