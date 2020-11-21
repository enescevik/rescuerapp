abstract class BaseModel<T> {
  BaseModel<T> fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}
