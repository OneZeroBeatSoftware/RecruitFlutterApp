class ImageModel {
  factory ImageModel() =>_getInstance();
  static ImageModel _instance;
  static ImageModel get instance => _getInstance();
  ImageModel._internal() {
    //TODO
  }

  static ImageModel _getInstance() {
    if (_instance == null) {
      _instance = new ImageModel._internal();
    }
    return _instance;
  }


}
