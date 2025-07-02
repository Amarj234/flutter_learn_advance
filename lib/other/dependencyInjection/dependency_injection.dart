import 'package:get_it/get_it.dart';
import 'package:learn_more/other/dependencyInjection/injection_widget.dart';
final getIt = GetIt.instance;
void setupLocator() {
  getIt.registerLazySingleton<ApiService>(() => ApiService());
  getIt.registerFactory<HomeViewModel>(() => HomeViewModel(getIt<ApiService>()));
 
}


// | Method                           | What it does                                                                         |
// | -------------------------------- | ------------------------------------------------------------------------------------ |
// | `registerSingleton`              | Immediately creates & registers a single instance, always returns the same instance. |
// | `registerLazySingleton`          | Creates the instance **only on first use**, then reuses it.                          |
// | `registerFactory`                | Creates a **new instance each time** you request it.                                 |
// | `registerSingletonAsync`         | Registers an **async singleton**, waits for future to complete.                      |
// | `registerLazySingletonAsync`     | Like `LazySingleton`, but asynchronous.                                              |
// | `reset()` / `resetLazySingleton` | Clears all or specific lazy singletons.                                              |



// | Method                        | When to use                                                     |
// | ----------------------------- | --------------------------------------------------------------- |
// | `registerSingleton`           | You want the instance **immediately created**, always the same. |
// | `registerLazySingleton`       | Only create when **first needed**, reuse afterwards.            |
// | `registerFactory`             | You want **a new instance every time**.                         |
// | `registerSingletonAsync`      | You need async init immediately.                                |
// | `registerLazySingletonAsync`  | Async init, but only when first used.                           |
// | `reset`, `resetLazySingleton` | Testing, clear instance(s).                                     |
