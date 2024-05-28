// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  String imageUrl;
  final String targetScreen;
  final bool active;
  
  BannerEntity({
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });
  
  @override
  List<Object?> get props => [imageUrl, targetScreen, active];

  
}
