import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'package:win32/win32.dart';

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
typedef setPixelNative = Int32 Function(
    IntPtr hdc, Int32 x, Int32 y, Int32 color);
typedef setPixelDart = int Function(int hdc, int x, int y, int color);

// COLORREF GetPixel(
//   HDC hdc,
//   int x,
//   int y
// );
typedef getPixelNative = Int32 Function(IntPtr hdc, Int32 x, Int32 y);
typedef getPixelDart = int Function(int hdc, int x, int y);

// BOOL PolylineTo(
//   HDC         hdc,
//   const POINT *apt,
//   DWORD       cpt
// );
typedef polylineToNative = Int32 Function(
    IntPtr hdc, Pointer<POINT> apt, Int32 cpt);
typedef polylineToDart = int Function(int hdc, Pointer<POINT> apt, int cpt);

// BOOL PolyBezierTo(
//   HDC         hdc,
//   const POINT *apt,
//   DWORD       cpt
// );
typedef polyBezierToNative = Int32 Function(
    IntPtr hdc, Pointer<POINT> apt, Int32 cpt);
typedef polyBezierToDart = int Function(int hdc, Pointer<POINT> apt, int cpt);

// BOOL PolyPolyline(
//   HDC         hdc,
//   const POINT *apt,
//   const DWORD *asz,
//   DWORD       csz
// );
typedef polyPolylineNative = Int32 Function(
    IntPtr hdc, Pointer<POINT> apt, Pointer<Int32> asz, Int32 csz);
typedef polyPolylineDart = int Function(
    int hdc, Pointer<POINT> apt, Pointer<Int32> asz, int csz);

// BOOL Rectangle(
//   HDC hdc,
//   int left,
//   int top,
//   int right,
//   int bottom
// );
typedef rectangleNative = Int32 Function(
    IntPtr hdc, Int32 left, Int32 top, Int32 right, Int32 bottom);
typedef rectangleDart = int Function(
    int hdc, int left, int top, int right, int bottom);

// BOOL Ellipse(
//   HDC hdc,
//   int left,
//   int top,
//   int right,
//   int bottom
// );
typedef ellipseNative = Int32 Function(
    IntPtr hdc, Int32 left, Int32 top, Int32 right, Int32 bottom);
typedef ellipseDart = int Function(
    int hdc, int left, int top, int right, int bottom);

// BOOL RoundRect(
//   HDC hdc,
//   int left,
//   int top,
//   int right,
//   int bottom,
//   int width,
//   int height
// );
typedef roundRectNative = Int32 Function(IntPtr hdc, Int32 left, Int32 top,
    Int32 right, Int32 bottom, Int32 width, Int32 height);
typedef roundRectDart = int Function(
    int hdc, int left, int top, int right, int bottom, int width, int height);

// BOOL Arc(
//   HDC hdc,
//   int x1,
//   int y1,
//   int x2,
//   int y2,
//   int x3,
//   int y3,
//   int x4,
//   int y4
// );
typedef arcNative = Int32 Function(IntPtr hdc, Int32 x1, Int32 y1, Int32 x2,
    Int32 y2, Int32 x3, Int32 y3, Int32 x4, Int32 y4);
typedef arcDart = int Function(
    int hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4);

// BOOL Pie(
//   HDC hdc,
//   int left,
//   int top,
//   int right,
//   int bottom,
//   int xr1,
//   int yr1,
//   int xr2,
//   int yr2
// );
typedef pieNative = Int32 Function(IntPtr hdc, Int32 left, Int32 top,
    Int32 right, Int32 bottom, Int32 xr1, Int32 yr1, Int32 xr2, Int32 yr2);
typedef pieDart = int Function(int hdc, int left, int top, int right,
    int bottom, int xr1, int yr1, int xr2, int yr2);

// BOOL Chord(
//   HDC hdc,
//   int x1,
//   int y1,
//   int x2,
//   int y2,
//   int x3,
//   int y3,
//   int x4,
//   int y4
// );
typedef chordNative = Int32 Function(IntPtr hdc, Int32 x1, Int32 y1, Int32 x2,
    Int32 y2, Int32 x3, Int32 y3, Int32 x4, Int32 y4);
typedef chordDart = int Function(
    int hdc, int x1, int y1, int x2, int y2, int x3, int y3, int x4, int y4);

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
