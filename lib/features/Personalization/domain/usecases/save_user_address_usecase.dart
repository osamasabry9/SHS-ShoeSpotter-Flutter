import '../../data/models/address_model.dart';
import '../repositories/address_repository.dart';

class SaveUserAddressUseCase {
  final AddressRepository addressRepository;

  SaveUserAddressUseCase({required this.addressRepository});

  Future<String> call({required AddressModel address}) async {
    return addressRepository.saveUserAddress(address);
  }
}
