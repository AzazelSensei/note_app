abstract class NetworkModel<T> {

  Map<String, dynamic> toJson(
    T model,
  );
  
  T fromJson(
    Map<String, dynamic> json,
  );
}
