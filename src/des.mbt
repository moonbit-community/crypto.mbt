///|
pub fn des_encrypt(
  data : Array[Byte],
  key : Array[Byte],
  mode~ : AESMode = ECB,
  padding~ : Padding = PKCS7,
) -> Array[Byte] {
  ...
}
