import '../../../features/shop/data/models/banner_model.dart';
import '../../../features/shop/data/models/brand_model.dart';
import '../../../features/shop/data/models/category_model.dart';
import '../../../features/shop/data/models/product_attribute_model.dart';
import '../../../features/shop/data/models/product_model.dart';
import '../../../features/shop/data/models/product_variation_model.dart';
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

// Brands
  static final List<BrandModel> brands = [
    BrandModel(
      id: '1',
      name: 'Nike',
      isFeatured: true,
      image: AppImages.nikeLogo,
      productsCount: 150,
    ),
    BrandModel(
      id: '2',
      name: 'Adidas',
      isFeatured: true,
      image: AppImages.adidasLogo,
      productsCount: 120,
    ),
    BrandModel(
      id: '3',
      name: 'Apple',
      isFeatured: true,
      image: AppImages.appleLogo,
      productsCount: 180,
    ),
    BrandModel(
      id: '4',
      name: 'Jordan',
      isFeatured: true,
      image: AppImages.jordanLogo,
      productsCount: 100,
    ),
    BrandModel(
      id: '5',
      name: 'Puma',
      isFeatured: true,
      image: AppImages.pumaLogo,
      productsCount: 110,
    ),
    BrandModel(
      id: '6',
      name: 'Zara',
      isFeatured: false,
      image: AppImages.zaraLogo,
      productsCount: 90,
    ),
    BrandModel(
      id: '7',
      name: 'Kenwood',
      isFeatured: false,
      image: AppImages.kenwoodLogo,
      productsCount: 70,
    ),
    BrandModel(
      id: '8',
      name: 'Herman Miller',
      isFeatured: true,
      image: AppImages.hermanMillerLogo,
      productsCount: 50,
    ),
    BrandModel(
      id: '9',
      name: 'Ikea',
      isFeatured: true,
      image: AppImages.ikeaLogo,
      productsCount: 200,
    ),
    BrandModel(
      id: '10',
      name: 'Acer',
      isFeatured: false,
      image: AppImages.acerlogo,
      productsCount: 60,
    ),
  ];

// products
  static final List<ProductModel> products = [
 
  ProductModel(
    id: '001',
    title: "Green Nike Sports Shoe",
    stock: 15,
    price: 135,
    isFeatured: true,
    thumbnail: AppImages.productImage1,
    description: "Green Nike Sports Shoe",
    brand: BrandModel(
      id: '1',
      name: 'Nike',
      isFeatured: true,
      image: AppImages.nikeLogo,
      productsCount: 150,
    ),
    images: const [
      AppImages.productImage1,
      AppImages.productImage23,
      AppImages.productImage21,
      AppImages.productImage9,
    ],
    salePrice: 130,
    sku: 'ABR4568',
    categoryId: '1',
    productAttributes: [
      ProductAttributeModel(
        name: "Color",
        values: const ["Green", "Black", "Red"],
      ),
      ProductAttributeModel(
        name: "Size",
        values: const ['EU 30', 'EU 31', 'EU 34'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '1',
        stock: 34,
        price: 134,
        salePrice: 122.6,
        image: AppImages.productImage1,
        description: 'This is a product description for green nike sports shoe',
        attributesValues: const {'Color': 'Green', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '2',
        stock: 15,
        price: 132,
        image: AppImages.productImage23,
        attributesValues: const {'Color': 'Black', 'Size': 'EU 32'},
      ),
      ProductVariationModel(
        id: '3',
        stock: 0,
        price: 234,
        image: AppImages.productImage23,
        attributesValues: const {'Color': 'Black', 'Size': 'EU 34'},
      ),
      ProductVariationModel(
        id: '4',
        stock: 30,
        price: 240,
        image: AppImages.productImage21,
        attributesValues: const {'Color': 'Red', 'Size': 'EU 34'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
 
  ProductModel(
    id: '002',
    title: "Adidas Running Shoes",
    stock: 20,
    price: 140,
    isFeatured: true,
    thumbnail: AppImages.productImage23,
    description: "Adidas Running Shoes for men",
    brand: BrandModel(
      id: '2',
      name: 'Adidas',
      isFeatured: true,
      image: AppImages.adidasLogo,
      productsCount: 120,
    ),
    images: const [
      AppImages.productImage23,
      AppImages.productImage28,
    ],
    salePrice: 130,
    sku: 'ADS2345',
    categoryId: '1',
    productAttributes: [
      ProductAttributeModel(
        name: "Color",
        values: const ["White", "Black"],
      ),
      ProductAttributeModel(
        name: "Size",
        values: const ['EU 40', 'EU 42', 'EU 44'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '5',
        stock: 10,
        price: 140,
        salePrice: 130,
        image: AppImages.productImage23,
        description: 'Adidas Running Shoes White EU 40',
        attributesValues: const {'Color': 'White', 'Size': 'EU 40'},
      ),
      ProductVariationModel(
        id: '6',
        stock: 10,
        price: 140,
        image: AppImages.productImage28,
        attributesValues: const {'Color': 'Black', 'Size': 'EU 44'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  ProductModel(
    id: '003',
    title: "Apple iPhone 14",
    stock: 50,
    price: 999,
    isFeatured: true,
    thumbnail: AppImages.productImage52,
    description: "Latest Apple iPhone 14 with 128GB storage",
    brand: BrandModel(
      id: '3',
      name: 'Apple',
      isFeatured: true,
      image: AppImages.appleLogo,
      productsCount: 180,
    ),
    images: const [
      AppImages.productImage52,
      AppImages.productImage51,
      AppImages.productImage53,
    ],
    salePrice: 950,
    sku: 'IP14-128GB',
    categoryId: '3',
    productAttributes: [
      ProductAttributeModel(
        name: "Color",
        values: const ["Black", "White", "Gold"],
      ),
      ProductAttributeModel(
        name: "Storage",
        values: const ['128GB', '256GB', '512GB'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '7',
        stock: 20,
        price: 999,
        salePrice: 950,
        image: AppImages.productImage52,
        description: 'Apple iPhone 14 Black 128GB',
        attributesValues: const {'Color': 'Black', 'Storage': '128GB'},
      ),
      ProductVariationModel(
        id: '8',
        stock: 15,
        price: 999,
        image: AppImages.productImage51,
        attributesValues: const {'Color': 'White', 'Storage': '256GB'},
      ),
      ProductVariationModel(
        id: '9',
        stock: 15,
        price: 999,
        image: AppImages.productImage53,
        attributesValues: const {'Color': 'Gold', 'Storage': '512GB'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  ProductModel(
    id: '004',
    title: "Blue T-Shirt",
    stock: 100,
    price: 25,
    isFeatured: false,
    thumbnail: AppImages.productImage54,
    description: "Comfortable blue t-shirt",
    brand: BrandModel(
      id: '6',
      name: 'Zara',
      isFeatured: false,
      image: AppImages.zaraLogo,
      productsCount: 90,
    ),
    images: const [
      AppImages.productImage54,
      AppImages.productImage55,
    ],
    salePrice: 20,
    sku: 'TSHIRTBLUE',
    categoryId: '2',
    productAttributes: [
      ProductAttributeModel(
        name: "Size",
        values: const ['S', 'M', 'L', 'XL'],
      ),
      ProductAttributeModel(
        name: "Material",
        values: const ['Cotton'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '10',
        stock: 40,
        price: 25,
        salePrice: 20,
        image: AppImages.productImage54,
        description: 'Blue T-Shirt size S',
        attributesValues: const {'Size': 'S', 'Material': 'Cotton'},
      ),
      ProductVariationModel(
        id: '11',
        stock: 30,
        price: 25,
        image: AppImages.productImage55,
        attributesValues: const {'Size': 'M', 'Material': 'Cotton'},
      ),
      ProductVariationModel(
        id: '12',
        stock: 20,
        price: 25,
        image: AppImages.productImage54,
        attributesValues: const {'Size': 'L', 'Material': 'Cotton'},
      ),
      ProductVariationModel(
        id: '13',
        stock: 10,
        price: 25,
        image: AppImages.productImage55,
        attributesValues: const {'Size': 'XL', 'Material': 'Cotton'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  ProductModel(
    id: '005',
    title: "Adidas Football",
    stock: 30,
    price: 50,
    isFeatured: true,
    thumbnail: AppImages.productImage28,
    description: "Professional quality Adidas football",
    brand: BrandModel(
      id: '2',
      name: 'Adidas',
      isFeatured: true,
      image: AppImages.adidasLogo,
      productsCount: 120,
    ),
    images: const [
      AppImages.productImage28,
    ],
    salePrice: 45,
    sku: 'ADFBL001',
    categoryId: '5',
    productAttributes: [
      ProductAttributeModel(
        name: "Size",
        values: const ['4', '5'],
      ),
      ProductAttributeModel(
        name: "Color",
        values: const ['White', 'Black'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '14',
        stock: 15,
        price: 50,
        salePrice: 45,
        image: AppImages.productImage28,
        description: 'Adidas Football size 4 White',
        attributesValues: const {'Size': '4', 'Color': 'White'},
      ),
      ProductVariationModel(
        id: '15',
        stock: 15,
        price: 50,
        image: AppImages.productImage28,
        attributesValues: const {'Size': '5', 'Color': 'Black'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  ProductModel(
    id: '006',
    title: "Samsung Galaxy S9",
    stock: 25,
    price: 299,
    isFeatured: true,
    thumbnail: AppImages.productImage11,
    description: "Samsung Galaxy S9 with 64GB storage",
    brand: BrandModel(
      id: '3',
      name: 'Apple',
      isFeatured: true,
      image: AppImages.appleLogo,
      productsCount: 180,
    ),
    images: const [
      AppImages.productImage11,
      AppImages.productImage12,
      AppImages.productImage13,
    ],
    salePrice: 280,
    sku: 'SGS964GB',
    categoryId: '3',
    productAttributes: [
      ProductAttributeModel(
        name: "Color",
        values: const ["Black", "Blue", "Purple"],
      ),
      ProductAttributeModel(
        name: "Storage",
        values: const ['64GB', '128GB'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '16',
        stock: 10,
        price: 299,
        salePrice: 280,
        image: AppImages.productImage11,
        description: 'Samsung Galaxy S9 Black 64GB',
        attributesValues: const {'Color': 'Black', 'Storage': '64GB'},
      ),
      ProductVariationModel(
        id: '17',
        stock: 10,
        price: 299,
        image: AppImages.productImage12,
        attributesValues: const {'Color': 'Blue', 'Storage': '64GB'},
      ),
      ProductVariationModel(
        id: '18',
        stock: 5,
        price: 299,
        image: AppImages.productImage13,
        attributesValues: const {'Color': 'Purple', 'Storage': '128GB'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  ProductModel(
    id: '007',
    title: "Herman Miller Office Chair",
    stock: 8,
    price: 850,
    isFeatured: true,
    thumbnail: AppImages.productImage39,
    description: "Ergonomic office chair by Herman Miller",
    brand: BrandModel(
      id: '8',
      name: 'Herman Miller',
      isFeatured: true,
      image: AppImages.hermanMillerLogo,
      productsCount: 50,
    ),
    images: const [
      AppImages.productImage39,
      AppImages.productImage40,
    ],
    salePrice: 800,
    sku: 'HMOC001',
    categoryId: '2',
    productAttributes: [
      ProductAttributeModel(
        name: "Color",
        values: const ["Black", "Gray"],
      ),
      ProductAttributeModel(
        name: "Material",
        values: const ['Mesh', 'Leather'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '19',
        stock: 5,
        price: 850,
        salePrice: 800,
        image: AppImages.productImage39,
        description: 'Herman Miller Office Chair Black Mesh',
        attributesValues: const {'Color': 'Black', 'Material': 'Mesh'},
      ),
      ProductVariationModel(
        id: '20',
        stock: 3,
        price: 850,
        image: AppImages.productImage40,
        attributesValues: const {'Color': 'Gray', 'Material': 'Leather'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  ProductModel(
    id: '008',
    title: "Ikea Dining Table",
    stock: 12,
    price: 200,
    isFeatured: true,
    thumbnail: AppImages.productImage37,
    description: "Modern dining table by Ikea",
    brand: BrandModel(
      id: '9',
      name: 'Ikea',
      isFeatured: true,
      image: AppImages.ikeaLogo,
      productsCount: 200,
    ),
    images: const [
      AppImages.productImage37,
    ],
    salePrice: 180,
    sku: 'IKDT001',
    categoryId: '2',
    productAttributes: [
      ProductAttributeModel(
        name: "Color",
        values: const ["White", "Brown"],
      ),
      ProductAttributeModel(
        name: "Material",
        values: const ['Wood', 'Metal'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '21',
        stock: 6,
        price: 200,
        salePrice: 180,
        image: AppImages.productImage37,
        description: 'Ikea Dining Table White Wood',
        attributesValues: const {'Color': 'White', 'Material': 'Wood'},
      ),
      ProductVariationModel(
        id: '22',
        stock: 6,
        price: 200,
        image: AppImages.productImage37,
        attributesValues: const {'Color': 'Brown', 'Material': 'Metal'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  ProductModel(
    id: '009',
    title: "Acer Laptop",
    stock: 20,
    price: 500,
    isFeatured: true,
    thumbnail: AppImages.productImage47,
    description: "Acer high performance laptop",
    brand: BrandModel(
      id: '10',
      name: 'Acer',
      isFeatured: false,
      image: AppImages.acerlogo,
      productsCount: 60,
    ),
    images: const [
      AppImages.productImage47,
      AppImages.productImage48,
    ],
    salePrice: 450,
    sku: 'ACERLAP001',
    categoryId: '3',
    productAttributes: [
      ProductAttributeModel(
        name: "Color",
        values: const ["Black", "Silver"],
      ),
      ProductAttributeModel(
        name: "Storage",
        values: const ['256GB', '512GB'],
      ),
    ],
    productVariations: [
      ProductVariationModel(
        id: '23',
        stock: 10,
        price: 500,
        salePrice: 450,
        image: AppImages.productImage47,
        description: 'Acer Laptop Black 256GB',
        attributesValues: const {'Color': 'Black', 'Storage': '256GB'},
      ),
      ProductVariationModel(
        id: '24',
        stock: 10,
        price: 500,
        image: AppImages.productImage48,
        attributesValues: const {'Color': 'Silver', 'Storage': '512GB'},
      ),
    ],
    productType: 'ProductType.variable',
  ),
  
//   // ProductModel(
//   //   id: '010',
//   //   title: "Jordan Sneakers",
//   //   stock: 25,
//   //   price: 150,
//   //   isFeatured: true,
//   //   thumbnail: AppImages.productImage7,
//   //   description: "Stylish Jordan sneakers",
//   //   brand: BrandModel(
//   //     id: '4',
//   //     name: 'Jordan',
//   //     isFeatured: true,
//   //     image: AppImages.jordanLogo,
//   //     productsCount: 100,
//   //   ),
//   //   images: const [
//   //     AppImages.productImage7,
//   //     AppImages.productImage8,
//   //   ],
//   //   salePrice: 140,
//   //   sku: 'JORDSNK001',
//   //   categoryId: '1',
//   //   productAttributes: [
//   //     ProductAttributeModel(
//   //       name: "Color",
//   //       values: const ["Black", "Red"],
//   //     ),
//   //     ProductAttributeModel(
//   //       name: "Size",
//   //       values: const ['EU 40', 'EU 42', 'EU 44'],
//   //     ),
//   //   ],
//   //   productVariations: [
//   //     ProductVariationModel(
//   //       id: '25',
//   //       stock: 15,
//   //       price: 150,
//   //       salePrice: 140,
//   //       image: AppImages.productImage7,
//   //       description: 'Jordan Sneakers Black EU 40',
//   //       attributesValues: const {'Color': 'Black', 'Size': 'EU 40'},
//   //     ),
//   //     ProductVariationModel(
//   //       id: '26',
//   //       stock: 10,
//   //       price: 150,
//   //       image: AppImages.productImage8,
//   //       attributesValues: const {'Color': 'Red', 'Size': 'EU 44'},
//   //     ),
//   //   ],
//   //   productType: 'ProductType.variable',
//   // ),
// //   ProductModel(
// //     id: '011',
// //     title: "Puma Running Shoes",
// //     stock: 30,
// //     price: 130,
// //     isFeatured: true,
// //     thumbnail: AppImages.productImage1,
// //     description: "High performance running shoes by Puma",
// //     brand: BrandModel(
// //       id: '5',
// //       name: 'Puma',
// //       isFeatured: true,
// //       image: AppImages.pumaLogo,
// //       productsCount: 110,
// //     ),
// //     images: const [
// //       AppImages.productImage1,
// //       AppImages.productImage19,
// //     ],
// //     salePrice: 120,
// //     sku: 'PUMRUN001',
// //     categoryId: '1',
// //     productAttributes: [
// //       ProductAttributeModel(
// //         name: "Color",
// //         values: const ["Green", "Black"],
// //       ),
// //       ProductAttributeModel(
// //         name: "Size",
// //         values: const ['EU 40', 'EU 42', 'EU 44'],
// //       ),
// //     ],
// //     productVariations: [
// //       ProductVariationModel(
// //         id: '27',
// //         stock: 15,
// //         price: 130,
// //         salePrice: 120,
// //         image: AppImages.productImage1,
// //         description: 'Puma Running Shoes Green EU 40',
// //         attributesValues: const {'Color': 'Green', 'Size': 'EU 40'},
// //       ),
// //       ProductVariationModel(
// //         id: '28',
// //         stock
// // : 15,
// //         price: 130,
// //         image: AppImages.productImage19,
// //         attributesValues: const {'Color': 'Black', 'Size': 'EU 44'},
// //       ),
// //     ],
// //     productType: 'ProductType.variable',
// //   ),
// //   ProductModel(
// //     id: '012',
// //     title: "Zara Men's Jeans",
// //     stock: 40,
// //     price: 50,
// //     isFeatured: false,
// //     thumbnail: AppImages.productImage4,
// //     description: "Stylish men's jeans by Zara",
// //     brand: BrandModel(
// //       id: '6',
// //       name: 'Zara',
// //       isFeatured: false,
// //       image: AppImages.zaraLogo,
// //       productsCount: 90,
// //     ),
// //     images: const [
// //       AppImages.productImage4,
// //     ],
// //     salePrice: 45,
// //     sku: 'ZARAJNS001',
// //     categoryId: '1',
// //     productAttributes: [
// //       ProductAttributeModel(
// //         name: "Color",
// //         values: const ["Blue", "Black"],
// //       ),
// //       ProductAttributeModel(
// //         name: "Size",
// //         values: const ['30', '32', '34'],
// //       ),
// //     ],
// //     productVariations: [
// //       ProductVariationModel(
// //         id: '29',
// //         stock: 20,
// //         price: 50,
// //         salePrice: 45,
// //         image: AppImages.productImage4,
// //         description: "Zara Men's Jeans Blue Size 30",
// //         attributesValues: const {'Color': 'Blue', 'Size': '30'},
// //       ),
// //       ProductVariationModel(
// //         id: '30',
// //         stock: 10,
// //         price: 50,
// //         image: AppImages.productImage4,
// //         attributesValues: const {'Color': 'Black', 'Size': '32'},
// //       ),
// //       ProductVariationModel(
// //         id: '31',
// //         stock: 10,
// //         price: 50,
// //         image: AppImages.productImage4,
// //         attributesValues: const {'Color': 'Blue', 'Size': '34'},
// //       ),
// //     ],
// //     productType: 'ProductType.variable',
// //   ),
// //   ProductModel(
// //     id: '013',
// //     title: "Kenwood Mixer",
// //     stock: 15,
// //     price: 200,
// //     isFeatured: false,
// //     thumbnail: AppImages.productImage6,
// //     description: "Kenwood stand mixer for baking",
// //     brand: BrandModel(
// //       id: '7',
// //       name: 'Kenwood',
// //       isFeatured: false,
// //       image: AppImages.kenwoodLogo,
// //       productsCount: 70,
// //     ),
// //     images: const [
// //       AppImages.productImage6,
// //     ],
// //     salePrice: 180,
// //     sku: 'KENMIX001',
// //     categoryId: '4',
// //     productAttributes: [
// //       ProductAttributeModel(
// //         name: "Color",
// //         values: const ["White", "Silver"],
// //       ),
// //       ProductAttributeModel(
// //         name: "Model",
// //         values: const ['KMX750', 'KVL4100S'],
// //       ),
// //     ],
// //     productVariations: [
// //       ProductVariationModel(
// //         id: '32',
// //         stock: 10,
// //         price: 200,
// //         salePrice: 180,
// //         image: AppImages.productImage6,
// //         description: "Kenwood Mixer White Model KMX750",
// //         attributesValues: const {'Color': 'White', 'Model': 'KMX750'},
// //       ),
// //       ProductVariationModel(
// //         id: '33',
// //         stock: 5,
// //         price: 200,
// //         image: AppImages.productImage6,
// //         attributesValues: const {'Color': 'Silver', 'Model': 'KVL4100S'},
// //       ),
// //     ],
// //     productType: 'ProductType.variable',
// //   ),
// //   ProductModel(
// //     id: '014',
// //     title: "Herman Miller Office Desk",
// //     stock: 10,
// //     price: 600,
// //     isFeatured: true,
// //     thumbnail: AppImages.productImage42,
// //     description: "Modern office desk by Herman Miller",
// //     brand: BrandModel(
// //       id: '8',
// //       name: 'Herman Miller',
// //       isFeatured: true,
// //       image: AppImages.hermanMillerLogo,
// //       productsCount: 50,
// //     ),
// //     images: const [
// //       AppImages.productImage41,
// //       AppImages.productImage42,
// //     ],
// //     salePrice: 550,
// //     sku: 'HMDESK001',
// //     categoryId: '4',
// //     productAttributes: [
// //       ProductAttributeModel(
// //         name: "Color",
// //         values: const ["Black", "White"],
// //       ),
// //       ProductAttributeModel(
// //         name: "Size",
// //         values: const ['Small', 'Medium', 'Large'],
// //       ),
// //     ],
// //     productVariations: [
// //       ProductVariationModel(
// //         id: '34',
// //         stock: 5,
// //         price: 600,
// //         salePrice: 550,
// //         image: AppImages.productImage41,
// //         description: "Herman Miller Office Desk Black Small",
// //         attributesValues: const {'Color': 'Black', 'Size': 'Small'},
// //       ),
// //       ProductVariationModel(
// //         id: '35',
// //         stock: 3,
// //         price: 600,
// //         image: AppImages.productImage42,
// //         attributesValues: const {'Color': 'White', 'Size': 'Medium'},
// //       ),
// //       ProductVariationModel(
// //         id: '36',
// //         stock: 2,
// //         price: 600,
// //         image: AppImages.productImage43,
// //         attributesValues: const {'Color': 'Black', 'Size': 'Large'},
// //       ),
// //     ],
// //     productType: 'ProductType.variable',
// //   ),
// //   ProductModel(
// //     id: '015',
// //     title: "Ikea Bookshelf",
// //     stock: 20,
// //     price: 120,
// //     isFeatured: true,
// //     thumbnail: AppImages.productImage45,
// //     description: "Simple and elegant bookshelf by Ikea",
// //     brand: BrandModel(
// //       id: '9',
// //       name: 'Ikea',
// //       isFeatured: true,
// //       image: AppImages.ikeaLogo,
// //       productsCount: 200,
// //     ),
// //     images: const [
// //       AppImages.productImage45,
// //     ],
// //     salePrice: 110,
// //     sku: 'IKBS001',
// //     categoryId: '4',
// //     productAttributes: [
// //       ProductAttributeModel(
// //         name: "Color",
// //         values: const ["White", "Brown"],
// //       ),
// //       ProductAttributeModel(
// //         name: "Material",
// //         values: const ['Wood', 'Metal'],
// //       ),
// //     ],
// //     productVariations: [
// //       ProductVariationModel(
// //         id: '37',
// //         stock: 10,
// //         price: 120,
// //         salePrice: 110,
// //         image: AppImages.productImage45,
// //         description: "Ikea Bookshelf White Wood",
// //         attributesValues: const {'Color': 'White', 'Material': 'Wood'},
// //       ),
// //       ProductVariationModel(
// //         id: '38',
// //         stock: 10,
// //         price: 120,
// //         image: AppImages.productImage45,
// //         attributesValues: const {'Color': 'Brown', 'Material': 'Metal'},
// //       ),
// //     ],
// //     productType: 'ProductType.variable',
// //   ),
// //   // ProductModel(
//   //   id: '016',
//   //   title: "Acer Gaming Monitor",
//   //   stock: 15,
//   //   price: 300,
//   //   isFeatured: false,
//   //   thumbnail: AppImages.productImage46,
//   //   description: "High refresh rate gaming monitor by Acer",
//   //   brand: BrandModel(
//   //     id: '10',
//   //     name: 'Acer',
//   //     isFeatured: false,
//   //     image: AppImages.acerlogo,
//   //     productsCount: 60,
//   //   ),
//   //   images: const [
//   //     AppImages.productImage46,
//   //   ],
//   //   salePrice: 280,
//   //   sku: 'ACMNTR001',
//   //   categoryId: '4',
//   //   productAttributes: [
//   //     ProductAttributeModel(
//   //       name: "Resolution",
//   //       values: const ["1080p", "4K"],
//   //     ),
//   //     ProductAttributeModel(
//   //       name: "Refresh Rate",
//   //       values: const ['144Hz', '240Hz'],
//   //     ),
//   //   ],
//   //   productVariations: [
//   //     ProductVariationModel(
//   //       id: '39',
//   //       stock: 8,
//   //       price: 300,
//   //       salePrice: 280,
//   //       image: AppImages.productImage46,
//   //       description: "Acer Gaming Monitor 1080p 144Hz",
//   //       attributesValues: const {'Resolution': '1080p', 'Refresh Rate': '144Hz'},
//   //     ),
//   //     ProductVariationModel(
//   //       id: '40',
//   //       stock: 7,
//   //       price: 400,
//   //       salePrice: 380,
//   //       image: AppImages.productImage46,
//   //       description: "Acer Gaming Monitor 4K 240Hz",
//   //       attributesValues: const {'Resolution': '4K', 'Refresh Rate': '240Hz'},
//   //     ),
//   //   ],
//   //   productType: 'ProductType.variable',
//   // ),


];

}
