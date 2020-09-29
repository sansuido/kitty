import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:win32/win32.dart';
import 'structs.dart';

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

// HGDIOBJ SelectObject(
//   HDC     hdc,
//   HGDIOBJ h
// );
typedef selectObjectNative = IntPtr Function(IntPtr hdc, IntPtr h);
typedef selectObjectDart = int Function(int hdc, int h);

// HPEN CreatePen(
//   int      iStyle,
//   int      cWidth,
//   COLORREF color
// );
typedef createPenNative = IntPtr Function(Int32 iStyle, Int32 cWidth, Int32 color);
typedef createPenDart = int Function(int iStyle, int cWidth, int color);

// HPEN CreatePenIndirect(
//   const LOGPEN *plpen
// );
typedef createPenIndirectNative = IntPtr Function(Pointer<LOGPEN> plpen);
typedef createPenIndirectDart = int Function(Pointer<LOGPEN> plpen);

// HBRUSH CreateHatchBrush(
//   int      iHatch,
//   COLORREF color
// );
typedef createHatchBrushNative = IntPtr Function(Int32 iHatch, Int32 color);
typedef createHatchBrushDart = int Function(int iHatch, int color);

// int SetROP2(
//   HDC hdc,
//   int rop2
// );
typedef setROP2Native = Int32 Function(IntPtr hdc, Int32 rop2);
typedef setROP2Dart = int Function(int hdc, int rop2);

// int SetPolyFillMode(
//   HDC hdc,
//   int mode
// );
typedef setPolyFillModeNative = Int32 Function(IntPtr hdc, Int32 mode);
typedef setPolyFillModeDart = int Function(int hdc, int mode);

// BOOL Polygon(
//   HDC         hdc,
//   const POINT *apt,
//   int         cpt
// );
typedef polygonNative = Int32 Function(IntPtr hdc, Pointer<POINT> apt, Int32 cpt);
typedef polygonDart = int Function(int hdc, Pointer<POINT> apt, int cpt);

// HRGN CreateRectRgn(
//   int x1,
//   int y1,
//   int x2,
//   int y2
// );
typedef createRectRgnNative = Int32 Function(Int32 x1, Int32 y1, Int32 x2, Int32 y2);
typedef createRectRgnDart = int Function(int x1, int y1, int x2, int y2);

// BOOL FillRgn(
//   HDC    hdc,
//   HRGN   hrgn,
//   HBRUSH hbr
// );
typedef fillRgnNative = Int32 Function(IntPtr hdc, IntPtr hrgn, IntPtr hbr);
typedef fillRgnDart = int Function(int hdc, int hrgn, int hbr);

// BOOL PaintRgn(
//   HDC  hdc,
//   HRGN hrgn
// );
typedef paintRgnNative = Int32 Function(IntPtr hdc, IntPtr hrgn);
typedef paintRgnDart = int Function(int hdc, int hrgn);

// BOOL FrameRgn(
//   HDC    hdc,
//   HRGN   hrgn,
//   HBRUSH hbr,
//   int    w,
//   int    h
// );
typedef frameRgnNative = Int32 Function(IntPtr hdc, IntPtr hrgn, IntPtr hbr, Int32 w, Int32 h);
typedef frameRgnDart = int Function(int hdc, int hrgn, int hbr, int w, int h);

// HRGN CreateEllipticRgn(
//   int x1,
//   int y1,
//   int x2,
//   int y2
// );
typedef createEllipticRgnNative = IntPtr Function(Int32 x1, Int32 y1, Int32 x2, Int32 y2);
typedef createEllipticRgnDart = int Function(int x1, int y1, int x2, int y2);

// HRGN CreateRoundRectRgn(
//   int x1,
//   int y1,
//   int x2,
//   int y2,
//   int w,
//   int h
// );
typedef createRoundRectRgnNative = IntPtr Function(Int32 x1, Int32 y1, Int32 x2, Int32 y2, Int32 w, Int32 h);
typedef createRoundRectRgnDart = int Function(int x1, int y1, int x2, int y2, int w, int h);

// HRGN CreatePolygonRgn(
//   const POINT *pptl,
//   int         cPoint,
//   int         iMode
// );
typedef createPolygonRgnNative = IntPtr Function(Pointer<POINT> pptl, Int32 cPoint, Int32 iMode);
typedef createPolygonRgnDart = int Function(Pointer<POINT> pptl, int cPoint, int iMode);

// int CombineRgn(
//   HRGN hrgnDst,
//   HRGN hrgnSrc1,
//   HRGN hrgnSrc2,
//   int  iMode
// );
typedef combineRgnNative = Int32 Function(IntPtr hrgnDst, IntPtr hrgnSrc1, IntPtr hrgnSrc2, Int32 iMode);
typedef combineRgnDart = int Function(int hrgnDst, int hrgnSrc1, int hrgnSrc2, int iMode);

// int GetDeviceCaps(
//   HDC hdc,
//   int index
// );
typedef getDeviceCapsNative = Int32 Function(IntPtr hdc, Int32 index);
typedef getDeviceCapsDart = int Function(int hdc, int index);

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

// user32.dll
// SHORT GetKeyState(
//   int nVirtKey
// );
typedef getKeyStateNative = Int16 Function(Int32 nVirtKey); 
typedef getKeyStateDart = int Function(int nVirtKey);

// BOOL InvalidateRgn(
//   HWND hWnd,
//   HRGN hRgn,
//   BOOL bErase
// );
typedef invalidateRgnNative = Int32 Function(IntPtr hWnd, IntPtr hRgn, Int32 bErase);
typedef invalidateRgnDart = int Function(int hWnd, int hRgn, int bErase);

// BOOL ValidateRect(
//   HWND       hWnd,
//   const RECT *lpRect
// );
typedef validateRectNative = Int32 Function(IntPtr hWnd, Pointer<RECT> lpRect);
typedef validateRectDart = int Function(int hWnd, Pointer<RECT> lpRect);

// int GetSystemMetrics(
//   int nIndex
// );
typedef getSystemMetricsNative = Int32 Function(Int32 nIndex);
typedef getSystemMetricsDart = int Function(int nIndex);

