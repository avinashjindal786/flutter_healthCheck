
import 'package:flutter_assignment/UI/cart/book_appointment_screen.dart';
import 'package:flutter_assignment/UI/splash_screen/splash_screen.dart';
import 'package:stacked/stacked_annotations.dart';
import '../UI/cart/cart_screen.dart';
import '../UI/cart/success_screen.dart';
import '../UI/home/home_screen.dart';



@StackedApp(routes: [
  AdaptiveRoute(page: SplashScreen,initial: true), 
  AdaptiveRoute(page: HomeScreen,initial: false), 
  AdaptiveRoute(page: CartScreen, initial: false),
  AdaptiveRoute(page: BookAppointmentScreen, initial: false),
  AdaptiveRoute(page: SuccessScreen, initial: false), 
  // AdaptiveRoute(page: HomeScreen)
])
class App {
  //empty class, will be filled after code generation
}
