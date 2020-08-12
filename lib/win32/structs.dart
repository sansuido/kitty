import 'dart:ffi';
import 'package:ffi/ffi.dart';

// typedef struct tagLOGPEN {
//   UINT     lopnStyle;
//   POINT    lopnWidth;
//   COLORREF lopnColor;
// } LOGPEN, *PLOGPEN, *NPLOGPEN, *LPLOGPEN;
class LOGPEN extends Struct {
  @Int32()
  int lopnStyle;
  @Int32()
  int lopnWidthX;
  @Int32()
  int lopnWidthY;
  @Int32()
  int lopnColor;

  factory LOGPEN.allocate() => allocate<LOGPEN>().ref
    ..lopnStyle = 0
    ..lopnWidthX = 0
    ..lopnWidthY = 0
    ..lopnColor = 0;
}
