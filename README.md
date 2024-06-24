# Shoe Spotter

Shoe Spotter is a cutting-edge mobile application designed to help users discover and track their favorite shoes. Whether you're a sneakerhead, a casual shopper, or looking for the latest trends, Shoe Spotter provides a seamless experience for finding, reviewing, and purchasing shoes.

## Features

- **Adaptive UI**: Automatically adjusts screen and font sizes for a consistent experience across devices.
- **State Management**: Efficient and robust state management using GetX and Equatable.
- **Dependency Injection**: Simplified dependency injection with GetIt.
- **Utility Packages**: Includes packages for internationalization, URL launching, logging, native splash screens, page indicators, animations, and shimmering effects.
- **Icons**: Extensive icon library with Iconsax.
- **Product-Specific Features**: Readmore for expandable text, rating bar for reviews, progress indicators, and carousel sliders for showcasing products.
- **Local Storage**: Persistent storage using GetStorage.
- **Firebase Integration**: Comprehensive Firebase support for storage, core services, Firestore, authentication, and Google sign-in.
- **Image Handling**: Image picker for selecting images and cached network image for efficient image loading.
- **Network Utilities**: Internet connection checker and Dio for network requests.
- **Payment Gateway**: Secure payment processing with Flutter Stripe.

The main packages used in the project:

```yaml
# Adapting screen and font size
flutter_screenutil: ^5.9.0

# State management
get: ^4.6.6
equatable: ^2.0.5

# Dependency injection
get_it: ^7.6.7

# Utility packages
intl: ^0.19.0
url_launcher: ^6.2.5
logger: ^2.2.0
flutter_native_splash: ^2.3.10
smooth_page_indicator: ^1.1.0
lottie: ^3.1.0
shimmer: ^3.0.0

# Icons
iconsax: ^0.0.8

# Product-specific packages
readmore: ^3.0.0
flutter_rating_bar: ^4.0.1
capped_progress_indicator: ^0.0.2
carousel_slider: ^4.2.1

# Local storage
get_storage: ^2.1.1

# Firebase
firebase_storage: ^11.5.5
firebase_core: ^2.27.0
cloud_firestore: ^4.15.8
firebase_auth: ^4.17.8
google_sign_in: ^6.2.1

# Image handling
image_picker: ^1.0.8
cached_network_image: ^3.3.1

# Network
internet_connection_checker: ^1.0.0+1
dio: ^5.4.3+1

# Payment gateway
flutter_stripe: ^10.1.1
```

## Screenshots:

<h3> 1- Login screen </h3>

<p align="center">
  <img src="Screenshots/02_login_w.jpg" width="300" hight=500  title="1- Login screen Light">
  <img src="Screenshots/03_login_d.jpg" width="300" hight=500  title="2- Login screen Dark">
</p>

<h3> 2- SignUp screen </h3>

<p align="center">
  <img src="Screenshots/04_signUp_w.jpg" width="300" hight=500  title="1- SignUp screen Light">
  <img src="Screenshots/05_signUp_d.jpg" width="300" hight=500  title="2- SignUp screen Dark">
</p>

<h3> 3- Forget Password screen and reset email</h3>

<p align="center">
  <img src="Screenshots/06_ForgotPasswordScreen_d.jpg" width="300" hight=500  title=" 1- Forget Password screen">
  <img src="Screenshots/07_ResetPasswordScreen_d.jpg" width="300" hight=500  title=" 2- Reset Password Screen">
  <img src="Screenshots/07_ResetPasswordEmail.jpg" width="300" hight=500  title=" 3- Reset Password Email">
</p>

<h3> 4- Home screen </h3>

<p align="center">
  <img src="Screenshots/08_home_d.jpg" width="300" hight=500  title="1- Home screen Dark">
  <img src="Screenshots/09_home_d.jpg" width="300" hight=500  title="2- Home screen Dark">
</p>
<p align="center">
  <img src="Screenshots/10_home_w.jpg" width="300" hight=500  title="3- Home screen Light">
  <img src="Screenshots/11_home_w.jpg" width="300" hight=500  title="4- Home screen Light">
</p>

<h3> 5- SubCategories Screen </h3>

<p align="center">
  <img src="Screenshots/12_SubCategoriesScreen_w.jpg" width="300" hight=500  title="1- SubCategoriesScreen Light">
  <img src="Screenshots/13_SubCategoriesScreen_d.jpg" width="300" hight=500  title="2- SubCategoriesScreen Dark">
</p>

<h3> 6- store screen </h3>

<p align="center">
  <img src="Screenshots/14_1_store_screen_w.jpg" width="300" hight=500  title="1- store screen Light">
  <img src="Screenshots/14_store_screen_d.jpg" width="300" hight=500  title="2- store screen Dark">
</p>

<p align="center">
  <img src="Screenshots/15_1_store_screen_w.jpg" width="300" hight=500  title="3- store screen Light">
  <img src="Screenshots/15_store_screen_d.jpg" width="300" hight=500  title="4- store screen Dark">
</p>
<p align="center">
  <img src="Screenshots/16_1_store_screen_w.jpg" width="300" hight=500  title="5- store screen Light">
  <img src="Screenshots/16_store_screen_d.jpg" width="300" hight=500  title="6- store screen Dark">
</p>

<h3> 7- Brand Screen</h3>

<p align="center">
  <img src="Screenshots/17_allBrandScreen_d.jpg" width="300" hight=500  title=" 1- All Brand Screen Dark">
  <img src="Screenshots/18_brandProductsScreen_d.jpg" width="300" hight=500  title=" 2- Brand Products Screen Dark">
</p>

<h3> 8- Wishlist Screen</h3>

<p align="center">
  <img src="Screenshots/19_1_WishlistEmpty_d.jpg" width="300" hight=500  title=" 1- Wishlist Empty Screen Dark">
  <img src="Screenshots/19_1_WishlistScreen_w.jpg" width="300" hight=500  title=" 2- Wishlist Screen Light">
  <img src="Screenshots/19_WishlistScreen_d.jpg" width="300" hight=500  title=" 3- Wishlist Screen Dark">
</p>

<h3> 9- Product Details Screen </h3>

<p align="center">
  <img src="Screenshots/20_ProductDetailsScreen_d.jpg" width="300" hight=500  title="1- Product Details Screen Dark">
  <img src="Screenshots/21_ProductDetailsScreen_d.jpg" width="300" hight=500  title="2- Product Details Screen Dark">
</p>
<p align="center">
  <img src="Screenshots/22_ProductDetailsScreen_d.jpg" width="300" hight=500  title="3- Product Details Screen Dark">
  <img src="Screenshots/23_ProductDetailsScreen_d.jpg" width="300" hight=500  title="4- Product Details Screen Dark">
</p>
<p align="center">
  <img src="Screenshots/24_ProductDetailsScreen_w.jpg" width="300" hight=500  title="5- Product Details Screen Light">
  <img src="Screenshots/25_ProductDetailsScreen_w.jpg" width="300" hight=500  title="6- Product Details Screen Light">
  <img src="Screenshots/26_ProductDetailsScreen_w.jpg" width="300" hight=500  title="7- Product Details Screen Light">
</p>

<h3> 10- All Products Screen </h3>

<p align="center">
  <img src="Screenshots/28_0_AllProductsScreen_d.jpg" width="300" hight=500  title="1- All Products Screen Dark">
  <img src="Screenshots/28_1_AllProductsScreen_d.jpg" width="300" hight=500  title="2- All Products Screen Dark">
</p>

<p align="center">
  <img src="Screenshots/27_AllProductsScreen_w.jpg" width="300" hight=500  title="3- All Products Screen Light">
  <img src="Screenshots/27_1_AllProductsScreen_w.jpg" width="300" hight=500  title="4- All Products Screen Light">
  <img src="Screenshots/27_2_AllProductsScreen_w.jpg" width="300" hight=500  title="5- All Products Screen Light">
</p>
<h3> 11- Cart Screen </h3>

<p align="center">
  <img src="Screenshots/29_1_cartEmpty_d.jpg" width="300" hight=500  title="1- Cart Empty Screen Dark">
  <img src="Screenshots/29_CartScreen_d.jpg" width="300" hight=500  title="2- Cart Screen Dark">
</p>

<h3> 12- Order Screen </h3>

<p align="center">
  <img src="Screenshots/40_orderScreen_w.jpg" width="300" hight=500  title="1- Order Empty Screen Light">
  <img src="Screenshots/31_OrderScreen_d.jpg" width="300" hight=500  title="2- Order Screen Dark">
  <img src="Screenshots/32_OrderScreen_d.jpg" width="300" hight=500  title="3- Order Screen Dark">
</p>
<p align="center">
  <img src="Screenshots/32_OrderScreen_d.jpg" width="300" hight=500  title="4- Order Screen Dark">
  <img src="Screenshots/33_OrderScreen_d.jpg" width="300" hight=500  title="5- Order Screen Dark">
  <img src="Screenshots/33_1_orderScreen_w.jpg" width="300" hight=500  title="6- Order Screen Light">
</p>
<p align="center">
  <img src="Screenshots/34_payment_getaway_d.jpg" width="300" hight=500  title="7- Payment getaway Screen Dark">
  <img src="Screenshots/35_PaymentSucc_d.jpg" width="300" hight=500  title="8- Payment Success Screen Dark">
</p

<h3> 13- Settings Screen </h3>

<p align="center">
  <img src="Screenshots/36_SettingsScreen_d.jpg" width="300" hight=500  title="1- SettingsScreen Dark">
  <img src="Screenshots/37_SettingsScreen_d.jpg" width="300" hight=500  title="2- Settings Screen Dark">
</p>

<h3> 14- Addresses Screen </h3>

<p align="center">
  <img src="Screenshots/38_0_AddressesScreen_d.jpg" width="300" hight=500  title="1- Addresses Screen Dark">
  <img src="Screenshots/38_1_AddressesScreen_w.jpg" width="300" hight=500  title="2- Addresses Screen Light">
</p>
<p align="center">
  <img src="Screenshots/39_0_AddNewAddressScreen_d.jpg" width="300" hight=500  title="3- Add New Address Screen Dark">
  <img src="Screenshots/39_1_AddNewAddressScreen_w.jpg" width="300" hight=500  title="4- Add New Address Screen Light">
</p>

<h3> 15- Profile Screen </h3>

<p align="center">
  <img src="Screenshots/41_0_ProfileScreen_d.jpg" width="300" hight=500  title="1- Profile Screen Dark">
  <img src="Screenshots/41_1_ProfileScreen_w.jpg" width="300" hight=500  title="2- Profile Screen Light">
</p>

## How to Use

**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/osamasabry9/T-ShoeSpotter-Flutter.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies:

```
flutter pub get
flutter run
```

### Folder Structure

Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
    |- app/
    |- core/
    |- features/
         |- auth/
         |- onboarding/
         |- Personalization/
         |- shop/
    |- firebase_options.dart
    |- main_development.dart
    |- main_production.dart
```
