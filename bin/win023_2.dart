// http://wisdom.sakura.ne.jp/system/winapi/win32/win23.html
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);
var dw = allocate<Int32>(count: 2);
var po = allocate<POINT>(count: 5);

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_CREATE:
      dw[0] = 3;
      dw[1] = 2;
      po[0].x = 10;
      po[0].y = 10;
      po[1].x = 100;
      po[1].y = 10;
      po[2].x = 100;
      po[2].y = 100;
      po[3].x = 200;
      po[3].y = 10;
      po[4].x = 200;
      po[4].y = 200;
      return 0;
    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      PolyPolyline(hdc, po, dw, 2);
      EndPaint(hWnd, ps.addressOf);
      return 0;
  }
  return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

int main(List argments) {
  final wc = WNDCLASS.allocate();
  wc.style = CS_HREDRAW | CS_VREDRAW;
  wc.lpfnWndProc = Pointer.fromFunction<WindowProc>(windowProc, 0);
  wc.cbClsExtra = 0;
  wc.cbWndExtra = 0;
  wc.hIcon = LoadIcon(NULL, IDI_APPLICATION);
  wc.hCursor = LoadCursor(NULL, IDC_ARROW);
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
  if (hWnd == 0) return 0;
  final msg = MSG.allocate();
  while (GetMessage(msg.addressOf, NULL, 0, 0) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }
  return msg.wParam;
}