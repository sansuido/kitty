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

final PolyBezierTo =
    _gdi32.lookupFunction<polyBezierToNative, polyBezierToDart>('PolyBezierTo');

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

final SelectObject =
    _gdi32.lookupFunction<selectObjectNative, selectObjectDart>('SelectObject');

final CreatePen =
    _gdi32.lookupFunction<createPenNative, createPenDart>('CreatePen');

final CreatePenIndirect =
    _gdi32.lookupFunction<createPenIndirectNative, createPenIndirectDart>(
        'CreatePenIndirect');

final CreateHatchBrush =
    _gdi32.lookupFunction<createHatchBrushNative, createHatchBrushDart>(
        'CreateHatchBrush');

final SetROP2 = _gdi32.lookupFunction<setROP2Native, setROP2Dart>('SetROP2');

final SetPolyFillMode =
    _gdi32.lookupFunction<setPolyFillModeNative, setPolyFillModeDart>(
        'SetPolyFillMode');

final Polygon = _gdi32.lookupFunction<polygonNative, polygonDart>('Polygon');

final CreateRectRgn = _gdi32
    .lookupFunction<createRectRgnNative, createRectRgnDart>('CreateRectRgn');

final FillRgn = _gdi32.lookupFunction<fillRgnNative, fillRgnDart>('FillRgn');

final PaintRgn =
    _gdi32.lookupFunction<paintRgnNative, paintRgnDart>('PaintRgn');

final FrameRgn =
    _gdi32.lookupFunction<frameRgnNative, frameRgnDart>('FrameRgn');

final CreateEllipticRgn =
    _gdi32.lookupFunction<createEllipticRgnNative, createEllipticRgnDart>(
        'CreateEllipticRgn');

final CreateRoundRectRgn =
    _gdi32.lookupFunction<createRoundRectRgnNative, createRoundRectRgnDart>(
        'CreateRoundRectRgn');

final CreatePolygonRgn =
    _gdi32.lookupFunction<createPolygonRgnNative, createPolygonRgnDart>(
        'CreatePolygonRgn');

final CombineRgn =
    _gdi32.lookupFunction<combineRgnNative, combineRgnDart>('CombineRgn');

final GetDeviceCaps = _gdi32.lookupFunction<getDeviceCapsNative, getDeviceCapsDart>('GetDeviceCaps');