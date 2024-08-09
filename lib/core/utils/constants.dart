class Constants {
  static String? getImageExtension(String? filename) {
    return filename?.split('.').last;
  }

  static const iconFallBack =
      'https://yt3.googleusercontent.com/viNp17XpEF-AwWwOZSj_TvgobO1CGmUUgcTtQoAG40YaYctYMoUqaRup0rTxxxfQvWw3MvhXesw=s900-c-k-c0x00ffffff-no-rj';
}
