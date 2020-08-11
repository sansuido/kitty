// http://wisdom.sakura.ne.jp/system/winapi/win32/win6.html
import 'package:kitty/win32.dart';

void main(List arguments) {
  var buffer = '';
  for (var argument in arguments) {
    if (buffer.isNotEmpty) buffer += ' ';
    buffer += argument.toString();
  }
  MessageBox(0, TEXT(buffer), TEXT('Kitty'), MB_ICONINFORMATION);
}