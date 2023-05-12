class ApiLink {
static  const String linkServerName = "http://192.168.0.191/ecommerece/";

//! Auth -------------------------------------
static const String linkSignUp = "$linkServerName/auth/signup.php";
static const String linkVerifyCode= "$linkServerName/auth/verifyCode.php";
static const String linkLogin = "$linkServerName/auth/login.php";

//! Forget Password --------------------------
static const String linkCheckEmail = "$linkServerName/forget_password/check_email.php";
static const String linkResetPassword = "$linkServerName/forget_password/reset_password.php";
static const String linkVerifyCodeResetPasswoprd = "$linkServerName/forget_password/verify_code_forget_password.php";



}