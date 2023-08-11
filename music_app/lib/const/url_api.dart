class UrlApi {
  static const baseUrl = 'https://music-player-hit.onrender.com/v1';
  static const login = '/auth/login';
  static const signup = '/auth/register';
  static const song = '/songs/?populate=singers';
  static const singer = '/singers';
  static const album = '/albums?populate=songs,singers';
  static const playing = '';
  static const forgetAccount = '/auth/forgot-password-otp';
  static const verifyOtpForgetPassword = '/auth/verify-otp';
  static const resetPassword = '/auth/reset-password-otp';
  static const tokenAccess = '';
  static const favoriteSongs = '/users/favorite-songs';
  static const infoUser = '/users/profile';
  static const findSong = '/songs/?populate=singers&title=';
}
