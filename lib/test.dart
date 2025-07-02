import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class AppRouters{
 final routeKey=GlobalKey<NavigatorState>();


final routes =GoRouter(
  initialExtra: "path",
  routes: [

    GoRoute(path: "path",
    name: "amarjee",
    builder: (BuildContext context,state)=>Container()//widget name here
    )
  ],
);


}