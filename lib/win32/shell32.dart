import 'dart:ffi';
import 'typedefs.dart';

final _shell32 = DynamicLibrary.open('shell32.dll');

final DragQueryFile =
  _shell32.lookupFunction<dragQueryFileNative, dragQueryFileDart>('DragQueryFileW');


final DragFinish =
  _shell32.lookupFunction<dragFinishNative, dragFinishDart>('DragFinish');