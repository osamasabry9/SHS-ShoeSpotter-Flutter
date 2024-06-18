import '../../domain/repositories/address_repository.dart';
import '../datasources/address_remote_data_source.dart';
import '../models/address_model.dart';

class AddressRepositoryImpl implements AddressRepository {
  final AddressRemoteDataSource addressRemoteDataSource;

  AddressRepositoryImpl({required this.addressRemoteDataSource});

  @override
  Future<List<AddressModel>> fetchUserAddresses() async =>
      addressRemoteDataSource.fetchUserAddresses();

  @override
  Future<String> saveUserAddress(AddressModel address) async =>
      addressRemoteDataSource.saveUserAddress(address);

  @override
  Future<void> updateUserAddress(String addressId, bool selectedAddress) async =>
      addressRemoteDataSource.updateUserAddress(addressId , selectedAddress);

  @override
  Future<void> deleteUserAddress(AddressModel address) async =>
      addressRemoteDataSource.deleteUserAddress(address);
}
