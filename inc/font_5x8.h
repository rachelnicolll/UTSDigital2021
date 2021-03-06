const unsigned char font[] =  {
    0x00, 0x00, 0x00, 0x00, 0x00,   //  Space
    0x00, 0x5E, 0x00, 0x00, 0x00,   //  !
    0x06, 0x06, 0x00, 0x00, 0x00,   //  "
    0x28, 0xFE, 0x28, 0xFE, 0x28,   //  #
    0x08, 0x54, 0xFE, 0x54, 0x20,   //  $
    0x40, 0x2C, 0x54, 0x68, 0x04,   //  %
    0x70, 0x4E, 0x7A, 0x26, 0x40,   //  &
    0x06, 0x00, 0x00, 0x00, 0x00,   //  '
    0x00, 0x7E, 0x81, 0x00, 0x00,   //  (
    0x81, 0x7E, 0x00, 0x00, 0x00,   //  )
    0x08, 0x04, 0x02, 0x04, 0x08,   //  *
    0x10, 0x10, 0x7C, 0x10, 0x10,   //  +
    0x00, 0xC0, 0x00, 0x00, 0x00,   //  ,
    0x20, 0x20, 0x00, 0x00, 0x00,   //  -
    0x00, 0x40, 0x00, 0x00, 0x00,   //  .
    0x70, 0x0E, 0x00, 0x00, 0x00,   //  /
    0x3C, 0x42, 0x42, 0x3C, 0x00,   //  0
    0x44, 0x7E, 0x40, 0x00, 0x00,   //  1
    0x62, 0x52, 0x4E, 0x00, 0x00,   //  2
    0x62, 0x4A, 0x7E, 0x00, 0x00,   //  3
    0x18, 0x14, 0x7E, 0x10, 0x00,   //  4
    0x4E, 0x4A, 0x7A, 0x00, 0x00,   //  5
    0x7E, 0x52, 0x72, 0x00, 0x00,   //  6
    0x02, 0x62, 0x1A, 0x06, 0x00,   //  7
    0x76, 0x4A, 0x76, 0x00, 0x00,   //  8
    0x4C, 0x52, 0x52, 0x3C, 0x00,   //  9
    0x00, 0x48, 0x00, 0x00, 0x00,   //  :
    0x00, 0xC8, 0x00, 0x00, 0x00,   //  ;
    0x10, 0x28, 0x28, 0x44, 0x00,   //  <
    0x28, 0x28, 0x28, 0x28, 0x00,   //  =
    0x44, 0x28, 0x28, 0x10, 0x00,   //  >
    0x04, 0x52, 0x0A, 0x0E, 0x00,   //  ?
    0x7C, 0x82, 0xBA, 0xAA, 0xBE,   //  @
    0x7C, 0x12, 0x12, 0x7C, 0x00,   //  A
    0x7E, 0x4A, 0x4A, 0x34, 0x00,   //  B
    0x3C, 0x42, 0x42, 0x42, 0x24,   //  C
    0x7E, 0x42, 0x42, 0x42, 0x3C,   //  D
    0x7E, 0x4A, 0x4A, 0x4A, 0x00,   //  E
    0x7E, 0x0A, 0x0A, 0x0A, 0x00,   //  F
    0x3C, 0x42, 0x42, 0x52, 0x34,   //  G
    0x7E, 0x08, 0x08, 0x08, 0x7E,   //  H
    0x42, 0x7E, 0x42, 0x00, 0x00,   //  I
    0x60, 0x42, 0x7E, 0x00, 0x00,   //  J
    0x7E, 0x08, 0x18, 0x24, 0x42,   //  K
    0x7E, 0x40, 0x40, 0x40, 0x00,   //  L
    0x7E, 0x04, 0x08, 0x04, 0x7E,   //  M
    0x7E, 0x04, 0x18, 0x20, 0x7E,   //  N
    0x3C, 0x42, 0x42, 0x42, 0x3C,   //  O
    0x7E, 0x12, 0x12, 0x0C, 0x00,   //  P
    0x3C, 0x42, 0xC2, 0xC2, 0xBC,   //  Q
    0x7E, 0x12, 0x12, 0x32, 0x4C,   //  R
    0x4C, 0x52, 0x52, 0x22, 0x00,   //  S
    0x02, 0x02, 0x7E, 0x02, 0x02,   //  T
    0x3E, 0x40, 0x40, 0x40, 0x3E,   //  U
    0x06, 0x38, 0x40, 0x38, 0x06,   //  V
    0x3E, 0x60, 0x18, 0x60, 0x3E,   //  W
    0x42, 0x24, 0x18, 0x24, 0x42,   //  X
    0x02, 0x0C, 0x70, 0x0C, 0x02,   //  Y
    0x62, 0x52, 0x4A, 0x46, 0x00,   //  Z
    0x00, 0xFF, 0x81, 0x00, 0x00,   //  [
    0x0E, 0x70, 0x00, 0x00, 0x00,   //  Backslash
    0x81, 0xFF, 0x00, 0x00, 0x00,   //  ]
    0x0C, 0x02, 0x0C, 0x00, 0x00,   //  ^
    0x80, 0x80, 0x80, 0x80, 0x80,   //  _
    0x01, 0x02, 0x00, 0x00, 0x00,   //  `
    0x68, 0x58, 0x78, 0x40, 0x00,   //  a
    0x7E, 0x48, 0x30, 0x00, 0x00,   //  b
    0x78, 0x48, 0x48, 0x00, 0x00,   //  c
    0x78, 0x48, 0x7E, 0x00, 0x00,   //  d
    0x30, 0x68, 0x50, 0x00, 0x00,   //  e
    0x08, 0x7C, 0x0A, 0x00, 0x00,   //  f
    0xB8, 0xA8, 0xF8, 0x00, 0x00,   //  g
    0x7E, 0x08, 0x70, 0x00, 0x00,   //  h
    0x7A, 0x00, 0x00, 0x00, 0x00,   //  i
    0x40, 0x7A, 0x00, 0x00, 0x00,   //  j
    0x7E, 0x30, 0x48, 0x00, 0x00,   //  k
    0x7E, 0x00, 0x00, 0x00, 0x00,   //  l
    0x78, 0x08, 0x70, 0x08, 0x78,   //  m
    0x78, 0x08, 0x70, 0x00, 0x00,   //  n
    0x30, 0x48, 0x48, 0x30, 0x00,   //  o
    0xF8, 0x48, 0x30, 0x00, 0x00,   //  p
    0x38, 0x28, 0xF8, 0x00, 0x00,   //  q
    0x78, 0x08, 0x08, 0x00, 0x00,   //  r
    0x58, 0x58, 0x68, 0x00, 0x00,   //  s
    0x7C, 0x48, 0x00, 0x00, 0x00,   //  t
    0x78, 0x40, 0x78, 0x00, 0x00,   //  u
    0x38, 0x40, 0x38, 0x00, 0x00,   //  v
    0x38, 0x60, 0x18, 0x60, 0x38,   //  w
    0x48, 0x30, 0x48, 0x00, 0x00,   //  x
    0x98, 0x60, 0x18, 0x00, 0x00,   //  y
    0x48, 0x68, 0x58, 0x00, 0x00,   //  z
    0x10, 0xEF, 0x81, 0x00, 0x00,   //  {
    0x00, 0xFF, 0x00, 0x00, 0x00,   //  |
    0x81, 0xEF, 0x10, 0x00, 0x00,   //  }
    0x10, 0x10, 0x20, 0x20, 0x00,   //  ~
};