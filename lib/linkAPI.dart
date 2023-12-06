class AppLinks{

  static const String server="http://10.0.2.2/E_Commerce";
  static const String test="$server/test.php";

  static const String imagestatic="$server/upload";
  // ======================images============================
  static const String imagecategories="$imagestatic/categories";
  static const String imageitem="$imagestatic/item";
  // ======================================================
 
  // //****************Auth***************** */
  // static const String signup="$server/Delivery/Auth/signUp.php";
  static const String verfycode="$server/Admin/Auth/verfiycode.php";
  static const String login="$server/Admin/Auth/login.php";
  static const String resendVerfycode="$server/Admin/Auth/Resend.php";

  /////////////////forget password//////////////////////
  static const String chechemail="$server/Admin/ForgetPassword/checkEmail.php";
  static const String verfiycodeforgetpass="$server/Admin/ForgetPassword/verfycode.php";
  static const String resetpassword="$server/Admin/ForgetPassword/ResetPassword.php";

  //////////////orders/////////////////////////
  static const String pendingorders="$server/Admin/orders/pending.php";
  static const String viewacceptedorders="$server/Admin/orders/viewaccepted.php";
  static const String viewpendingorders="$server/Admin/orders/viewpending.php";
  static const String approavorders="$server/Admin/orders/approv.php";
  static const String archiveorders="$server/Admin/orders/archive.php";
  static const String detailsorders="$server/Admin/orders/details.php";
  static const String prepareorders="$server/Admin/orders/prepare.php";
  ///////////////////////////////////////////////////////////////////////////////////////
  
  //////////////Categories/////////////////////////
  static const String categoriesview="$server/Admin/categories/view.php";
  static const String categoriesadd="$server/Admin/categories/add.php";
  static const String categoriesedit="$server/Admin/categories/edit.php";
  static const String categoriesdelete="$server/Admin/categories/delete.php";
  
  ///////////////////////////////////////////////////////////////////////////////////////
  
  ///////////Items/////////////////////////
  static const String itemsview="$server/Admin/items/view.php";
  static const String itemssadd="$server/Admin/items/add.php";
  static const String itemssedit="$server/Admin/items/edit.php";
  static const String itemssdelete="$server/Admin/items/delete.php";
  
  ///////////////////////////////////////////////////////////////////////////////////////
  

  


  ///////////////Notification////////////////////
  static const String notifications="$server/Notification.php";


  

  
}