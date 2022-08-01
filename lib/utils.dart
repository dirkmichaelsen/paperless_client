import 'dart:convert';

const latinEncoder = Latin1Encoder();
const utf8Decoder = Utf8Decoder();

Object? transformEncoding(Object? key, value) {
  if (value is String) {
    return utf8Decoder.convert(latinEncoder.convert(value));
  }
  return value;
}
