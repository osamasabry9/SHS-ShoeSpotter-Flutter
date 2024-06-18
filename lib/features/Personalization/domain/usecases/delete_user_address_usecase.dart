import '../../data/models/address_model.dart';
import '../repositories/address_repository.dart';

class DeleteUserAddressUseCase {
  final AddressRepository addressRepository;

  DeleteUserAddressUseCase({required this.addressRepository});

  Future<void> call({required AddressModel address}) async {
    return addressRepository.deleteUserAddress(address);
  }
}
