enum Routes {
  initialPage('/', 'Home'),
  aboutMePage('/about_me', 'About Me'),
  workExperiencePage('/work_experience', 'Work Experience');

  const Routes(this.value, this.title);

  final String value;
  final String title;
}
