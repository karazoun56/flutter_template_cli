import 'src/feature/app/domain/bootstrap.dart';

void main() async {
  final container = await Bootstrap.init();
  Bootstrap.run(container);
}
