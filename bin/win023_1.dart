// http://wisdom.sakura.ne.jp/system/winapi/win32/win23.html
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);
final lpPointLength = 4;
final lpPoint = allocate<POINT>(count: lpPointLength);

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_CREATE:
      lpPoint[0].x = 100;
      lpPoint[0].y = 10;
      lpPoint[1].x = 130;
      lpPoint[1].y = 100;
      lpPoint[2].x = 40;
      lpPoint[2].y = 100;
      lpPoint[3].x = lpPoint[3].y = 10;
      return 0;
    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      MoveToEx(hdc, 10, 10, nullptr);
      PolylineTo(hdc, lpPoint, lpPointLength);
      EndPaint(hWnd, ps.addressOf);
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