// http://wisdom.sakura.ne.jp/system/winapi/win32/win30.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);
var iWidth = 10;

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_KEYDOWN:
      final hdc = GetDC(hWnd);
      iWidth++;
      SelectObject(hdc, GetStockObject(WHITE_PEN));
      Rectangle(hdc, 0, 0, 400, 400);
      final tcRe = TEXT('wParam=0x' + wParam.toRadixString(16) + ' lParam=0x' + lParam.toRadixString(16));
      print(lParam.toRadixString(16));
      TextOut(hdc, 10, 150, tcRe, lstrlen(tcRe));
      SelectObject(hdc, GetStockObject(BLACK_BRUSH));
      for (var iCount = 0; iCount < 1000; iCount++) {
        Rectangle(hdc, 10, 10, iWidth, 100);
      }
      ReleaseDC(hWnd, hdc);
      return 0;
  }
  return DefWindowProc(hWnd, uMsg, wParam, lParam);
}

int main(List arguments) {
  final wc = WNDCLASS.allocate();
  wc.style = CS_VREDRAW | CS_HREDRAW;
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