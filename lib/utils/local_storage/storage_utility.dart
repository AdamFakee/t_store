import 'package:get_storage/get_storage.dart';

class TLocalStorage {
  // private name-constructor 
  TLocalStorage._internal();


  // variable
  static TLocalStorage? _instance;
  GetStorage _storage = GetStorage();


  // when call this contructor => return _instance => singleton partten
  factory TLocalStorage() {
    return _instance ?? TLocalStorage._internal();
  }


  /// set [storageName] of local storage when init
  Future<void> init (String storageName) async {
    // init specific container
    await GetStorage.init(storageName);

    _instance = TLocalStorage._internal();

    // listen to specific container
    _instance!._storage = GetStorage(storageName);
  }



  // Generic method to save data
  Future<void> saveData<T>(String key, T value) async {
    await _storage.write(key, value);
  }

  // Generic method to read data
  T? readData<T>(String key) {
    return _storage.read<T>(key);
  }

  // Generic method to remove data
  Future<void> removeData(String key) async {
    await _storage.remove(key);
  }

  // Clear all data in storage
  Future<void> clearAll() async {
    await _storage.erase();
  }
}
