// http://wisdom.sakura.ne.jp/system/winapi/win32/win9.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);

int main(List arguments) {
  final hWnd = CreateWindowEx(
      0,
      TEXT('BUTTON'),
      TEXT('Kitty on your lap'),
      WS_CAPTION | WS_VISIBLE,
      100,
      100,
      200,
      200,
      NULL,
      NULL,
      hInstance,
      nullptr);
  if (hWnd == 0) return 0;
  final msg = MSG.allocate();
  while (true) {
    GetMessage(msg.addressOf, NULL, 0, 0);
    if (msg.message == WM_LBUTTONUP) break;
    DispatchMessage(msg.addressOf);
  }
  return 0;
}
