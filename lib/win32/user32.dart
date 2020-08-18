import 'dart:ffi';
import 'typedefs.dart';

final _user32 = DynamicLibrary.open('user32.dll');

final GetKeyState = _user32.lookupFunction<getKeyStateNative, getKeyStateDart>('GetKeyState');