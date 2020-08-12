// http://wisdom.sakura.ne.jp/system/winapi/win32/win20.html
import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);
final title = TEXT('Kitty on your lap');

bool textOutClr(int hdc, int x, int y, Pointer<Utf16> str, int color) {
  if (hdc == NULL) return false;
  SaveDC(hdc);
  SetTextColor(hdc, color);
  TextOut(hdc, x, y, str, lstrlen(str));
  RestoreDC(hdc, -1);
  return true;
}

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_PAINT:
      final ps = PAINTSTRUCT.allocate();
      final tm = TEXTMETRIC.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      GetTextMetrics(hdc, tm.addressOf);
      textOutClr(hdc, 0, 0, title, RGB(0xff, 0, 0));
      TextOut(hdc, 0, tm.tmHeight, title, lstrlen(title));
      EndPaint(hWnd, ps.addressOf);
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
      title,
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