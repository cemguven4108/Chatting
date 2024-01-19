enum MessageType {
  text,
  image;

  String toJson() {
    return name;
  }

  factory MessageType.fromJson(String json) {
    return values.byName(json);
  }
}