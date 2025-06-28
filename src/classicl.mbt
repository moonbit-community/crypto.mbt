///|
pub fn caesar_encrypt(plaintext : String, offset~ : Int = 3) -> String raise {
  // TODO: add key
  let old = plaintext.to_bytes().to_fixedarray()
  let new = FixedArray::make(old.length(), b'\x00')
  let oft = offset % 26
  for i = 0; i < old.length(); i = i + 2 {
    if old[i + 1].to_int() == 0 {
      if old[i].to_int() >= 65 && old[i].to_int() <= 90 {
        new[i] = ((old[i].to_int() - 65 + oft + 26) % 26 + 65).to_byte()
      } else if old[i].to_int() >= 97 && old[i].to_int() <= 122 {
        new[i] = ((old[i].to_int() - 97 + oft + 26) % 26 + 97).to_byte()
      } else {
        new[i] = old[i]
      }
    } else {
      new[i] = old[i]
    }
    new[i + 1] = old[i + 1]
  }
  @encoding.decoder(UTF16).decode(@bytes.from_fixedarray(new))
}

///|
pub fn caesar_decrypt(ciphertext : String, offset~ : Int = 3) -> String raise {
  let oft = offset % 26
  caesar_encrypt(ciphertext, offset=-oft)
}
