import 'dart:ffi';

import 'typedefs.dart';

final _gdi32 = DynamicLibrary.open('gdi32.dll');

final RestoreDC =
    _gdi32.lookupFunction<restoreDCNative, restoreDCDart>('RestoreDC');

final SetPixel =
    _gdi32.lookupFunction<setPixelNative, setPixelDart>('SetPixel');

final GetPixel =
    _gdi32.lookupFunction<getPixelNative, getPixelDart>('GetPixel');
