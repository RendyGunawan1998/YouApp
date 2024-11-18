class AssetsHelper {
  static String imgBG = img("bg.png");
  static String imgBAdventure = img("adventure.jpg");

  static String icEye = ic("eye.png");
  static String icPen = ic("pen.png");
  // static String icEmail = ic("email.png");
  // static String icFile = ic("file.png");

  static String img(String name) {
    return "assets/images/$name";
  }

  static String ic(String name) {
    return "assets/icons/$name";
  }
}
