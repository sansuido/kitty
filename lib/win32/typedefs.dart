import 'dart:ffi';

import 'package:ffi/ffi.dart';

// shell32.dll
// UINT DragQueryFileW(
//   HDROP  hDrop,   // internal structure handle
//   UINT   iFile,   // file index
//   PTSTR  pszFile, // buffer for file name
//   UINT   cch      // buffer size
// );
typedef dragQueryFileNative = Uint32 Function(
    IntPtr hDrop, Uint32 iFile, Pointer<Utf16> pszFile, Uint32 cch);
typedef dragQueryFileDart = int Function(
    int hDrop, int iFile, Pointer<Utf16>, int cch);
// void DragFinish(
//   HDROP hDrop
// );
typedef dragFinishNative = Void Function(IntPtr hDrop);
typedef dragFinishDart = void Function(int hDrop);
