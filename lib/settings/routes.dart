enum Routes {
  aboutMe('/', 'About Me'),
  workInformation('/work_information', 'Work Information');

  const Routes(this.value, this.title);

  final String value;
  final String title;
}
