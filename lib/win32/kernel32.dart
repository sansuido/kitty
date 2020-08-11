import 'dart:ffi';

import 'typedefs.dart';

final _kernel32 = DynamicLibrary.open('kernel32.dll');

final lstrlen =
    _kernel32.lookupFunction<lstrlenNative, lstrlenDart>('lstrlenW');
