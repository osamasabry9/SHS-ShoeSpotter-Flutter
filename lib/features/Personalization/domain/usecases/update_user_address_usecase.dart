import '../repositories/address_repository.dart';

class UpdateUserAddressUseCase {
  final AddressRepository addressRepository;

  UpdateUserAddressUseCase({required this.addressRepository});

  Future<void> call({required String addressId, required bool selectedAddress}) async {
    return addressRepository.updateUserAddress(addressId, selectedAddress);
  }
}
