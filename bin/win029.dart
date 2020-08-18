// http://wisdom.sakura.ne.jp/system/winapi/win32/win29.html
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);

final po = allocate<POINT>(count: 8);
var imode;

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_CREATE:
      po[0].x = 10;
      po[0].y = 50;
      po[1].x = 150;
      po[1].y = 50;
      po[2].x = 150;
      po[2].y = 150;
      po[3].x = 50;
      po[3].y = 150;
      po[4].x = 50;
      po[4].y = 10;
      po[5].x = 200;
      po[5].y = 10;
      po[6].x = 200;
      po[6].y = 125;
      po[7].x = 10;
      po[7].y = 125;
      final mb = MessageBox(
          hWnd, TEXT('多角形モードを変更しますか'), TEXT('SetPolyFillMode'), MB_YESNO);
      if (mb == IDYES) {
        imode = WINDING;
      } else {
        imode = ALTERNATE;
      }
      return 0;
    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      SelectObject(hdc, CreateSolidBrush(0xff));
      SetPolyFillMode(hdc, imode);
      Polygon(hdc, po, 8);
      EndPaint(hWnd, ps.addressOf);
      DeleteObject(SelectObject(hdc, GetStockObject(WHITE_BRUSH)));
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
  wc.hIcon = LoadIcon(0, IDI_APPLICATION);
  wc.hbrBackground = GetStockObject(WHITE_BRUSH);
  wc.hCursor = LoadCursor(0, IDC_ARROW);
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
