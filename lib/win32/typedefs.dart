import 'dart:ffi';

import 'package:ffi/ffi.dart';

// gdi32.dll
// BOOL RestoreDC(
//   HDC hdc,
//   int nSavedDC
// );
typedef restoreDCNative = Int32 Function(IntPtr hdc, Int32 nSavedDC);
typedef restoreDCDart = int Function(int hdc, int nSavedDC);

// COLORREF SetPixel(
//   HDC      hdc,
//   int      x,
//   int      y,
//   COLORREF color
// );
typedef setPixelNative = Int32 Function(IntPtr hdc, Int32 x, Int32 y, Int32 color);
typedef setPixelDart = int Function(int hdc, int x, int y, int color);

// COLORREF GetPixel(
//   HDC hdc,
//   int x,
//   int y
// );
typedef getPixelNative = Int32 Function(IntPtr hdc, Int32 x, Int32 y);
typedef getPixelDart = int Function(int hdc, int x, int y);

// kernel32.dll
// int lstrlenW(
//   LPCWSTR lpString
// );
typedef lstrlenNative = Int32 Function(Pointer<Utf16> lpString);
typedef lstrlenDart = int Function(Pointer<Utf16> lpString);

// shell32.dll
// UINT DragQueryFileW(
//   HDROP  hDrop,
//   UINT   iFile,
//   LPWSTR lpszFile,
//   UINT   cch
// );
typedef dragQueryFileNative = Uint32 Function(
    IntPtr hDrop, Uint32 iFile, Pointer<Utf16> pszFile, Uint32 cch);
typedef dragQueryFileDart = int Function(
    int hDrop, int iFile, Pointer<Utf16> pszFile, int cch);
// void DragFinish(
//   HDROP hDrop
// );
typedef dragFinishNative = Void Function(IntPtr hDrop);
typedef dragFinishDart = void Function(int hDrop);
