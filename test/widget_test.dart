import 'package:flutter_test/flutter_test.dart';
import 'package:sotong_saju_promo/main.dart';

void main() {
  testWidgets('PromoApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const PromoApp());
    await tester.pump();

    expect(find.text('소통사주'), findsWidgets);
  });
}
