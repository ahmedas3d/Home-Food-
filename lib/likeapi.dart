class AppLink {
//================================== Hosting ===============================//
  static const String serverLink = "https://abdalluh-essam.com/homefood";
  static const String serverLinkAdmin = "https://abdalluh-essam.com/homefood/admin";
//================================== Image ===============================//
  static const String imageStatic = "$serverLink/upload";
  static const String imageServices = "$imageStatic/services";
  static const String imageCategories = "$imageStatic/categories";
  static const String imageItems = "$imageStatic/items";
  static const String imageCart = "$imageStatic/cart";
  static const String imageBanner = "$imageStatic/banner";
//================================== Auth ===============================//
  static const String signUp = "$serverLink/auth/signup.php";
  static const String verfiyCodeSignUp = "$serverLink/auth/verfiycode.php";
  static const String reSend = "$serverLink/auth/resend.php";
  static const String login = "$serverLink/auth/login.php";
//================================== Forget Password ===============================//
  static const String checkEmail = "$serverLink/forgetpassword/checkemail.php";
  static const String verfiyCodeForgetPass ="$serverLink/forgetpassword/verfiycode.php";
  static const String resetPassword ="$serverLink/forgetpassword/resetpassword.php";
//================================== Home ===============================//
  static const String homePage = "$serverLink/home.php";
  static const String searchPage = "$serverLink/search.php";
  static const String search  = "$serverLink/items/search.php";
  static const String items = "$serverLink/categories/view.php";
  static const String catSerPage = "$serverLink/categories/viewcategories.php";
  static const String glusSerPage = "$serverLink/categories/glusservies.php";
//================================== Favorite ===============================//
  static const String addFavorite       = "$serverLink/favorite/add.php";
  static const String deleteFavorite    = "$serverLink/favorite/delete.php";
  static const String deleteEndFavorite = "$serverLink/favorite/deleteend.php";
  static const String viewFavorite      = "$serverLink/favorite/view.php";
//================================== CART ===============================//
  static const String cardView      = "$serverLink/cart/viewcard.php";
  static const String cardAdd       = "$serverLink/cart/insertcart.php";
  static const String cardCount     = "$serverLink/cart/count.php";
  static const String cardDelete    = "$serverLink/cart/deletecart.php";
//================================== Address ===============================//
  static const String addressView   = "$serverLink/address/view.php";
  static const String addressAdd    = "$serverLink/address/add.php";
  static const String addressEdit   = "$serverLink/address/edit.php";
  static const String addressDelete = "$serverLink/address/delete.php";
//================================== Address ===============================//
  static const String governoratesView   = "$serverLink/address/governorates/view.php";
  static const String governoratesAdd    = "$serverLink/address/governorates/add.php";
  static const String governoratesEdit   = "$serverLink/address/governorates/edit.php";
  static const String governoratesDelete = "$serverLink/address/governorates/delete.php";
//================================== Check Coupon ===============================//
  static const String couponView   = "$serverLink/coupon/checkcoupon.php";
  static const String categories   = "$serverLink/categories/viewcategories.php";
//================================== ORDERS ===============================//
  static const String checkOutAdd = "$serverLink/orders/checkout.php";
  static const String pendingOrders = "$serverLink/orders/pending.php";
  static const String archiveOrders = "$serverLink/orders/archive.php";
  static const String addRatingOrders = "$serverLink/orders/rating.php";
  static const String detailsOrders = "$serverLink/orders/details.php";
//================================== NOTIFICATION ===============================//
  static const String notification = "$serverLink/notification.php";
//================================== OFFERS ===============================//
  static const String offers = "$serverLink/offers.php";

//================================== ADMIN ===============================//
  static const String addCategories       = "$serverLinkAdmin/categories/add.php";
  static const String deleteCategories    = "$serverLinkAdmin/categories/delete.php";
  static const String addProduct      = "$serverLinkAdmin/product/addproduct.php";
  static const String deleteProduct      = "$serverLinkAdmin/product/deleteproduct.php";
  static const String addBanner      = "$serverLinkAdmin/banner/addbanner.php";
//================================== END ===============================//
}
