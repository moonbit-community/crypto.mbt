///|
pub fn caesar_encrypt(
  plaintext : FixedArray[Byte],
  offset~ : Int = 3
) -> FixedArray[Byte] {
  let text = FixedArray::make(plaintext.length(), b'\x00')
  let oft = offset % 26
  for i in 0..<plaintext.length() {
    // ugly
    if plaintext[i].to_int() >= 65 && plaintext[i].to_int() <= 90 {
      text[i] = ((plaintext[i].to_int() - 65 + oft + 26) % 26 + 65).to_byte()
    } else if plaintext[i].to_int() >= 97 && plaintext[i].to_int() <= 122 {
      text[i] = ((plaintext[i].to_int() - 97 + oft + 26) % 26 + 97).to_byte()
    } else {
      text[i] = plaintext[i]
    }
  }
  text
}

///|
pub fn caesar_decrypt(
  ciphertext : FixedArray[Byte],
  offset~ : Int = 3
) -> FixedArray[Byte] {
  let oft = offset % 26
  caesar_encrypt(ciphertext, offset=-oft)
}
