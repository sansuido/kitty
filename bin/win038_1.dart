// http://wisdom.sakura.ne.jp/system/winapi/win32/win38.html
import 'dart:ffi';
import 'package:kitty/win32.dart';

final hInstance = GetModuleHandle(nullptr);

int windowProc(int hWnd, int uMsg, int wParam, int lParam) {
  switch (uMsg) {
    case WM_DESTROY:
      PostQuitMessage(0);
      return 0;
    case WM_PAINT:
      final osInfo = OSVERSIONINFO.allocate();
      final ps = PAINTSTRUCT.allocate();
      final rect = RECT.allocate();
      final hdc = BeginPaint(hWnd, ps.addressOf);
      GetClientRect(hWnd, rect.addressOf);
      GetVersionEx(osInfo.addressOf);
      var str = 'dwMajorVersion : ' + osInfo.dwMajorVersion.toString() + '\n';
      str += 'dwMinarVersion : ' + osInfo.dwMinorVersion.toString() + '\n';
      str += 'dwBuildNumber : ' + osInfo.dwBuildNumber.toString() + '\n';
      str += 'dwPlatformId : ' + osInfo.dwPlatformId.toString() + '\n';
      str += 'szCSDVersion : ' + osInfo.szCSDVersion;
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