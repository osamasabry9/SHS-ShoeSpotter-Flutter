import '../../../features/shop/data/models/banner_model.dart';
import '../../../features/shop/data/models/category_model.dart';
import '../../routing/routes.dart';
import '../constants/image_strings.dart';

class AppDummyData {
  // Banners
  static final List<BannerModel> bannersDummyData = [
    BannerModel(
        imageUrl: AppImages.banner1,
        targetScreen: Routes.orderScreen,
        active: false),
    BannerModel(
        imageUrl: AppImages.banner2,
        targetScreen: Routes.cartScreen,
        active: true),
    BannerModel(
        imageUrl: AppImages.banner5,
        targetScreen: Routes.profileScreen,
        active: true),
    BannerModel(
        imageUrl: AppImages.banner6,
        targetScreen: Routes.addressesScreen,
        active: true),
    BannerModel(
        imageUrl: AppImages.banner8,
        targetScreen: Routes.checkoutScreen,
        active: false),
  ];
// categories
  static final List<CategoryModel> categoriesDummyData = [
    // Main Categories
    CategoryModel(
        id: '1', name: 'Sports', image: AppImages.sportIcon, isFeatured: true),
    CategoryModel(
        id: '2',
        name: 'Furniture',
        image: AppImages.furnitureIcon,
        isFeatured: true),
    CategoryModel(
        id: '3',
        name: 'Electronics',
        image: AppImages.electronicsIcon,
        isFeatured: true),
    CategoryModel(
      id: '4',
      name: 'Clothing',
      image: AppImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
        id: '5',
        name: 'Animals',
        image: AppImages.animalIcon,
        isFeatured: true),
    CategoryModel(
        id: '6', name: 'Shoes', image: AppImages.shoeIcon, isFeatured: true),
    CategoryModel(
        id: '7',
        name: 'Cosmetics',
        image: AppImages.cosmeticsIcon,
        isFeatured: true),
    CategoryModel(
        id: '8',
        name: 'Jewelry',
        image: AppImages.jeweleryIcon,
        isFeatured: true),

    // Subcategories for Sports
    CategoryModel(
        id: '9',
        name: 'Sport Shoes',
        image: AppImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '10',
        name: 'Sport Equipment',
        image: AppImages.sportIcon,
        parentId: '1',
        isFeatured: false),
    CategoryModel(
        id: '11',
        name: 'Sport Apparel',
        image: AppImages.sportIcon,
        parentId: '1',
        isFeatured: false),

    // Subcategories for Furniture
    CategoryModel(
        id: '12',
        name: 'Living Room Furniture',
        image: AppImages.furnitureIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '13',
        name: 'Bedroom Furniture',
        image: AppImages.furnitureIcon,
        parentId: '2',
        isFeatured: false),
    CategoryModel(
        id: '14',
        name: 'Office Furniture',
        image: AppImages.furnitureIcon,
        parentId: '2',
        isFeatured: false),

    // Subcategories for Electronics
    CategoryModel(
        id: '15',
        name: 'Mobile Phones',
        image: AppImages.electronicsIcon,
        parentId: '3',
        isFeatured: false),
    CategoryModel(
        id: '16',
        name: 'Laptops',
        image: AppImages.electronicsIcon,
        parentId: '3',
        isFeatured: false),
    CategoryModel(
        id: '17',
        name: 'Cameras',
        image: AppImages.electronicsIcon,
        parentId: '3',
        isFeatured: false),

    // Subcategories for Clothing
    CategoryModel(
        id: '18',
        name: 'Men\'s Clothing',
        image: AppImages.clothIcon,
        parentId: '4',
        isFeatured: false),
    CategoryModel(
        id: '19',
        name: 'Women\'s Clothing',
        image: AppImages.clothIcon,
        parentId: '4',
        isFeatured: false),
    CategoryModel(
        id: '20',
        name: 'Children\'s Clothing',
        image: AppImages.clothIcon,
        parentId: '4',
        isFeatured: false),

    // Subcategories for Animals
    CategoryModel(
        id: '21',
        name: 'Pets',
        image: AppImages.animalIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '22',
        name: 'Wildlife',
        image: AppImages.animalIcon,
        parentId: '5',
        isFeatured: false),
    CategoryModel(
        id: '23',
        name: 'Farm Animals',
        image: AppImages.animalIcon,
        parentId: '5',
        isFeatured: false),

    // Subcategories for Shoes
    CategoryModel(
        id: '24',
        name: 'Men\'s Shoes',
        image: AppImages.shoeIcon,
        parentId: '6',
        isFeatured: false),
    CategoryModel(
        id: '25',
        name: 'Women\'s Shoes',
        image: AppImages.shoeIcon,
        parentId: '6',
        isFeatured: false),
    CategoryModel(
        id: '26',
        name: 'Children\'s Shoes',
        image: AppImages.shoeIcon,
        parentId: '6',
        isFeatured: false),

    // Subcategories for Cosmetics
    CategoryModel(
        id: '27',
        name: 'Makeup',
        image: AppImages.cosmeticsIcon,
        parentId: '7',
        isFeatured: false),
    CategoryModel(
        id: '28',
        name: 'Skincare',
        image: AppImages.cosmeticsIcon,
        parentId: '7',
        isFeatured: false),
    CategoryModel(
        id: '29',
        name: 'Haircare',
        image: AppImages.cosmeticsIcon,
        parentId: '7',
        isFeatured: false),

    // Subcategories for Jewelry
    CategoryModel(
        id: '30',
        name: 'Rings',
        image: AppImages.jeweleryIcon,
        parentId: '8',
        isFeatured: false),
    CategoryModel(
        id: '31',
        name: 'Necklaces',
        image: AppImages.jeweleryIcon,
        parentId: '8',
        isFeatured: false),
    CategoryModel(
        id: '32',
        name: 'Earrings',
        image: AppImages.jeweleryIcon,
        parentId: '8',
        isFeatured: false),
  ];
}
