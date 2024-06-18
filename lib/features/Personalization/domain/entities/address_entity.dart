// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String city;
  final String state;
  final String country;
  final String postalCode;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postalCode,
    this.dateTime,
    this.selectedAddress = true,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        phoneNumber,
        street,
        city,
        state,
        country,
        postalCode,
        dateTime,
        selectedAddress
      ];
}
