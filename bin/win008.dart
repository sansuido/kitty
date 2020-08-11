// http://wisdom.sakura.ne.jp/system/winapi/win32/win8.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

int main(List arguments) {
  final wc = WNDCLASS.allocate();
  wc.style = CS_HREDRAW | CS_VREDRAW;
  wc.lpfnWndProc = Pointer.fromFunction<WindowProc>(windowProc, 0);
  wc.cbClsExtra = 0;
  wc.cbWndExtra = 0;
  wc.hInstance = hInstance;
  wc.hIcon = LoadIcon(NULL, IDI_APPLICATION);
  wc.hCursor = LoadCursor(NULL, IDC_ARROW);
  wc.hbrBackground = GetStockObject(WHITE_BRUSH);
  wc.lpszMenuName = nullptr;
  wc.lpszClassName = TEXT('KITTY');
  if (RegisterClass(wc.addressOf) == 0) return 0;
  final hWnd = CreateWindowEx(0, TEXT('KITTY'), TEXT('Kitty on your lap'),
      WS_OVERLAPPEDWINDOW, 100, 100, 200, 200, NULL, NULL, hInstance, nullptr);
  if (hWnd == 0) return 0;
  ShowWindow(hWnd, SW_SHOW);
  MessageBox(0, TEXT('Kitty on your lap'), TEXT('Kitty'), MB_ICONINFORMATION);
  return 0;
}
