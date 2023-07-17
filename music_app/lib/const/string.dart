class StringConst {
  static const next = "NEXT";
  static const signup = "Đăng ký";
  static const appName = "MY MUSIC";
  static const assetIconGmail = "assets/icons/ic_gmail.svg";
  static const assetImgOnboarding1 = 'assets/images/img_onboarding1.png';
  static const assetImgWelcome = 'assets/images/img_welcome.png';
  static const assetImgSignup = 'assets/images/img_signup.png';
  static const assetImgAppIcon = 'assets/images/img_appicon.png';
  static const assetImgOnboarding2 = 'assets/images/img_onboarding2.png';
  static const assetImgOnboarding3 = 'assets/images/img_onboarding3.png';
  static const textOnboarding1 =
      'Listening to your favorite music with the best sound quality';
  static const textOnboarding2 =
      'Sing with the lyrics that have been provided easily';
  static const textOnboarding3 =
      'Download songs and listen offline anywhere and anytime';
  static const textSignUp = 'Music experience with the best app';
  static const textHello = 'Xin chào! Vui lòng đăng kí để tiếp tục';
  static const textYourFirstName = 'Nhập họ';
  static const textYourLastName = 'Nhập tên';
  static const textYourEmail = 'Nhập email';
  static const textPass = 'Nhập mật khẩu';
  static const textUsername = 'Tên đăng nhập';
  static const textDateOfBirth = 'Ngày sinh';
  static const textGender = 'Giới tính';
  static List<String> notiErrorEmail = [
    'Chưa nhập email',
    'Email phải có dạng abc@gmail.com',
  ];
  static List<String> notiErrorFirstName = [
    'Chưa nhập họ',
    'Họ không được chứa số',
  ];
  static List<String> notiErrorLastName = [
    'Chưa nhập tên',
    'Tên không được chứa số',
  ];
  static List<String> notiErrorUsername = [
    'Chưa nhập username',
    'Username phải lớn hơn 6 kí tự',
  ];
  static List<String> notiErrorPassword = [
    'Chưa nhập mật khẩu',
    'Mật khẩu phải chứa ít nhất 1 kí tự đặc biệt',
    'Mật khẩu phải lớn hơn 8 kí tự',
    'Mật khẩu không khớp',
  ];
  static List<String> notiErrorDateOfBirth = [
    'Chưa nhập ngày sinh',
    'Ngày không được vượt quá ngày hiện tại',
  ];
}
