// http://wisdom.sakura.ne.jp/system/winapi/win32/win40.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);
var x = 0, y = 0;

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_MOUSEMOVE:
      if (wParam & MK_LBUTTON != 0) {
        x = LOWORD(lParam);
        y = HIWORD(lParam);
        InvalidateRect(hWnd, nullptr, FALSE);
      }
      return 0;
    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      SelectObject(hdc, GetStockObject(BLACK_BRUSH));
      Ellipse(hdc, x - 2, y - 2, x + 2, y + 2);
      EndPaint(hWnd, ps.addressOf);
      return 0;
  }
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
  wc.lpszClassName = TEXT('KITTY');
  wc.lpszMenuName = nullptr;
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
  while (GetMessage(msg.addressOf, 0, NULL, NULL) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }
  return msg.wParam;
}