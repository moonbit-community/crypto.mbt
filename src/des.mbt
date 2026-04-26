///|
pub fn des_encrypt(
  data : Array[Byte],
  key : Array[Byte],
  mode? : AESMode = ECB,
  padding? : Padding = PKCS7,
) -> Array[Byte] {
  let _block_count = data.length() / 8
  let _key_length = key.length()
  match mode {
    ECB | CBC | CFB | OFB | CTR => ()
  }
  match padding {
    PKCS7 | ISO10126 | ISO7816 | ANSI_X923 | Zeros | NoPadding => ()
  }
  abort("des_encrypt is not implemented")
}
