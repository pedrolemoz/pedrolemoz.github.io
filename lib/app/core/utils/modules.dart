import 'routes.dart';

enum Modules {
  initialModule('/', {Routes.initialPage}),
  aboutMeModule('/about_me', {Routes.aboutMePage}),
  workExperienceModule('/work_experience', {Routes.workExperiencePage});

  const Modules(this.value, this.routes);

  final String value;
  final Set<Routes> routes;
}
