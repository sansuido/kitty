// http://wisdom.sakura.ne.jp/system/winapi/win32/win43.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);
var x = 0, y = 0;

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_NCHITTEST:
      x = LOWORD(lParam);
      y = HIWORD(lParam);
      InvalidateRect(hWnd, nullptr, TRUE);
      return HTNOWHERE;
    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      final rect = RECT.allocate();
      var str = 'x座標 = ' + x.toString() + '\n';
      str += 'y座標 = ' + y.toString();
      GetClientRect(hWnd, rect.addressOf);
      DrawText(hdc, TEXT(str), -1, rect.addressOf, DT_LEFT);
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
  while (GetMessage(msg.addressOf, NULL, 0, 0) != 0) {
    TranslateMessage(msg.addressOf);
    DispatchMessage(msg.addressOf);
  }
  return msg.wParam;
}