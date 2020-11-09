import 'package:get/get.dart';
import 'constants.dart';
import 'controllers/controllers.dart';
import 'views/views.dart';

const postRoute = '/postView';
const homeRoute = '/homeView';

final List<GetPage> routes = [
  GetPage(
    name: '/${profileMenu[0]}',
    page: () => NewStoryView(),
    binding: BindingsBuilder.put(
      () => NewStoryController(),
    ),
  ),
  GetPage(
    name: homeRoute,
    page: () => HomeView(),
    binding: BindingsBuilder.put(
      () => PostController(),
    ),
  ),
  GetPage(
    name: postRoute,
    page: () => PostView(),
  ),
];
