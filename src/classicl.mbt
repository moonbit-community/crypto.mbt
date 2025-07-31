///|
/// Encrypts a plaintext string using the Caesar cipher algorithm.
///
/// Parameters:
///
/// * `plaintext` : The string to be encrypted.
/// * `offset` : The number of positions to shift each letter in the alphabet
///   (default: 3).
/// * `encoding` : The character encoding to use for decoding the result
///   (default: UTF16).  
///   **Warning :** code dosn't support other encoding yet
///
/// Returns the encrypted string.
///
/// Throws an error when the encoding operation fails.
///
/// Example:
///
/// ```moonbit
/// inspect(@FrenchPicnic/cryptox.caesar_encrypt("Hello"), content="Khoor")
/// inspect(@FrenchPicnic/cryptox.caesar_encrypt("World", offset=5), content="Btwqi")
/// ```
///
pub fn caesar_encrypt(
  plaintext : String,
  offset~ : Int = 3,
  encoding~ : @encoding.Encoding = UTF16,
) -> String raise {
  // TODO: add key
  let old = plaintext.to_bytes().to_fixedarray()
  let new = FixedArray::make(old.length(), b'\x00')
  let oft = offset % 26
  // TODO: support other encode
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
  @encoding.decoder(encoding).decode(@bytes.from_fixedarray(new))
}

///|
/// Decrypts a Caesar cipher by reversing the character shift operation.
///
/// Parameters:
///
/// * `ciphertext` : The encrypted string to decrypt.
/// * `offset` : The number of positions each letter was shifted during
///   encryption (default: 3).
///
/// Returns the decrypted plaintext string.
///
/// Throws an error during the decoding process if the internal encoding
/// operations fail.
///
/// Example:
///
/// ```moonbit
/// let encrypted = caesar_encrypt("HELLO", offset=3)
/// let decrypted = caesar_decrypt(encrypted, offset=3)
/// inspect(decrypted, content="HELLO")
/// ```
///
pub fn caesar_decrypt(ciphertext : String, offset~ : Int = 3) -> String raise {
  let oft = offset % 26
  caesar_encrypt(ciphertext, offset=-oft)
}

///|
let bacon_box : Map[String, String] = {
  "AAAAA": "a",
  "AABBA": "g",
  "ABBAA": "n",
  "BAABA": "t",
  "AAAAB": "b",
  "AABBB": "h",
  "ABBAB": "o",
  "BAABB": "u-v",
  "AAABA": "c",
  "ABAAA": "i-j",
  "ABBBA": "p",
  "BABAA": "w",
  "AAABB": "d",
  "ABAAB": "k",
  "ABBBB": "q",
  "BABAB": "x",
  "AABAA": "e",
  "ABABA": "l",
  "BAAAA": "r",
  "BABBA": "y",
  "AABAB": "f",
  "ABABB": "m",
  "BAAAB": "s",
  "BABBB": "z",
}

///|
pub fn bacon_encrypt(plaintext : String) -> String raise {
  let mut result = ""
  for i = 0; i < plaintext.length(); i = i + 5 {
    if i + 5 <= plaintext.length() {
      result = result + bacon_box[plaintext[i:i + 5].to_string()].unwrap()
    }
  }
  result
}
