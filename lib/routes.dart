import 'package:get/get.dart';
import 'constants.dart';
import 'controllers/controllers.dart';
import 'views/views.dart';

const postRoute = '/postView';
const homeRoute = '/homeView';
const bookRoute = 'bookmarkView';

final List<GetPage> routes = [
  GetPage(
    name: bookRoute,
    page: () => BookmarkView(),
    binding: BindingsBuilder.put(
      () => BookMarkController(),
    ),
  ),
  GetPage(
    name: '/${profileMenu[0]}',
    page: () => NewStoryView(),
    binding: BindingsBuilder.put(
      () => NewStoryController(),
    ),
  ),
  GetPage(
    name: '/${profileMenu[profileMenu.length - 2]}',
    page: () => AboutView(),
    binding: BindingsBuilder.put(
      () => NewStoryController(),
    ),
  ),
  GetPage(
    name: homeRoute,
    page: () => HomeView(),
    bindings: [
      BindingsBuilder.put(
        () => HomeController(),
      ),
    ],
  ),
  GetPage(
    name: postRoute,
    page: () => PostView(),
    binding: BindingsBuilder.put(
      () => PostController(),
    ),
  ),

  // GetPage(
  //   name: postRoute,
  //   page: () => PostView(),
  // ),
];
