// http://wisdom.sakura.ne.jp/system/winapi/win32/win7.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);

int main(List arguments) {
  final hWnd = CreateWindowEx(WS_EX_TOOLWINDOW, TEXT('STATIC'), TEXT('Kitty on your lap'),
      WS_CAPTION, 100, 100, 200, 200, 0, 0, hInstance, nullptr);
  if (hWnd == 0) return 0;
  ShowWindow(hWnd, SW_SHOW);
  MessageBox(0, TEXT('Kitty on your lap'), TEXT('Kitty'), MB_ICONINFORMATION);
  return 0;
}
