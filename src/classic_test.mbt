///|
fn caesar_en_test(s : String, offset~ : Int = 3) -> String {
  @bytes.from_fixedarray(caesar_encrypt(s.to_bytes().to_fixedarray(), offset~)).to_unchecked_string()
}

///|
fn caesar_de_test(s : String, offset~ : Int = 3) -> String {
  @bytes.from_fixedarray(caesar_decrypt(s.to_bytes().to_fixedarray(), offset~)).to_unchecked_string()
}

///|
test "caesar_encrypt" {
  let a = "he1llo"
  assert_eq(caesar_en_test(a), "kh1oor")
  let a = "moonbit"
  assert_eq(caesar_en_test(a, offset=-100), "qssrfmx")
}

///|
test "caesar_decrypt" {
  let a = "kh1oor"
  assert_eq(caesar_de_test(a), "he1llo")
  let a = "qssrfmx"
  assert_eq(caesar_de_test(a, offset=-100), "moonbit")
}
