import 'package:get/get.dart';
import 'constants.dart';
import 'controllers/controllers.dart';
import 'views/views.dart';

final List<GetPage> routes = [
  GetPage(
    name: '/${profileMenu[0]}',
    page: () => NewStoryView(),
    binding: BindingsBuilder.put(
      () => NewStoryController(),
    ),
  ),
];
