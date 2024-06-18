import '../../data/models/address_model.dart';
import '../repositories/address_repository.dart';

class FetchUserAddressUseCase {
  final AddressRepository addressRepository;

  FetchUserAddressUseCase({required this.addressRepository});

  Future<List<AddressModel>> call() async {
    return addressRepository.fetchUserAddresses();
  }
}
