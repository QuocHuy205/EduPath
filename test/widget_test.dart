import 'package:flutter_test/flutter_test.dart';
import 'package:edupath/main.dart';

void main() {
  testWidgets('EduPath app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const EduPathApp());

    // Kiểm tra các thành phần của màn hình Onboarding (01.png)
    expect(find.text('HỌC TẬP THÔNG MINH'), findsOneWidget);
    expect(find.text('Bắt đầu ngay'), findsOneWidget);
    expect(find.text('Nền tảng học tập và ôn luyện'), findsOneWidget);
  });
}
