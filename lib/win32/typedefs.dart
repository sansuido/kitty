import 'dart:ffi';

import 'package:ffi/ffi.dart';

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
