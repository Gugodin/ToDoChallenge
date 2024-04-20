import 'package:auto_route/auto_route.dart';
import 'package:todoapp/config/routes/routes.gr.dart';

/* Rutas de la APP*/

@AutoRouterConfig()      
class AppRouter extends $AppRouter {      
   
 @override      
 List<AutoRoute> get routes => [      
  /// routes go here     
  AutoRoute(page: ToDoHomeRoute.page,initial: true)
  ];    
}    