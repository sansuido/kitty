import 'dart:ffi';

import 'typedefs.dart';

final _gdi32 = DynamicLibrary.open('gdi32.dll');

final RestoreDC =
    _gdi32.lookupFunction<restoreDCNative, restoreDCDart>('RestoreDC');

final SetPixel =
    _gdi32.lookupFunction<setPixelNative, setPixelDart>('SetPixel');

final GetPixel =
    _gdi32.lookupFunction<getPixelNative, getPixelDart>('GetPixel');

final PolylineTo =
    _gdi32.lookupFunction<polylineToNative, polylineToDart>('PolylineTo');

final PolyPolyline =
    _gdi32.lookupFunction<polyPolylineNative, polyPolylineDart>('PolyPolyline');

final Rectangle =
    _gdi32.lookupFunction<rectangleNative, rectangleDart>('Rectangle');

final Ellipse = _gdi32.lookupFunction<ellipseNative, ellipseDart>('Ellipse');

final RoundRect =
    _gdi32.lookupFunction<roundRectNative, roundRectDart>('RoundRect');

final Arc = _gdi32.lookupFunction<arcNative, arcDart>('Arc');

final Pie = _gdi32.lookupFunction<pieNative, pieDart>('Pie');

final Chord = _gdi32.lookupFunction<chordNative, chordDart>('Chord');
