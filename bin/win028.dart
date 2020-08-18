// http://wisdom.sakura.ne.jp/system/winapi/win32/win28.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      SetROP2(hdc, R2_XORPEN);
      Rectangle(hdc, 10, 10, 200, 50);
      Ellipse(hdc, 100, 25, 300, 100);
      EndPaint(hWnd, ps.addressOf);
      return 0;
  }
  return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

int main(List arguments) {
  final wc = WNDCLASS.allocate();
  wc.style = CS_HREDRAW | CS_VREDRAW;
  wc.lpfnWndProc = Pointer.fromFunction<WindowProc>(windowProc, 0);
  wc.hInstance = hInstance;
  wc.hIcon = LoadIcon(0, IDI_APPLICATION);
  wc.hCursor = LoadCursor(0, IDC_ARROW);
  wc.hbrBackground = GetStockObject(WHITE_BRUSH);
  wc.lpszMenuName = nullptr;
  wc.lpszClassName = TEXT('KITTY');
  if (RegisterClass(wc.addressOf) == 0) return 0;
  final hWnd = CreateWindowEx(
      0,
      TEXT('KITTY'),
      TEXT('Kitty on your lap'),
      WS_OVERLAPPEDWINDOW | WS_VISIBLE,
      CW_USEDEFAULT,
      CW_USEDEFAULT,
      CW_USEDEFAULT,
      CW_USEDEFAULT,
      NULL,
      NULL,
      hInstance,
      nullptr);
  final msg = MSG.allocate();
  while (GetMessage(msg.addressOf, NULL, 0, 0) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }
  return msg.wParam;
}