import '../../data/models/address_model.dart';

abstract class AddressRepository {
  Future<List<AddressModel>> fetchUserAddresses();
  Future<String> saveUserAddress(AddressModel address);

  Future<void> updateUserAddress(String addressId, bool selectedAddress);

  Future<void> deleteUserAddress(AddressModel address);
}
