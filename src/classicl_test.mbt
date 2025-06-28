///|
test "caesar_encrypt" {
  let a = "he1llo"
  assert_eq(caesar_encrypt(a), "kh1oor")
  let a = "moonbit"
  assert_eq(caesar_encrypt(a, offset=-100), "qssrfmx")
  let a = "moonbit世界さいこう【】；‘"
  assert_eq(
    caesar_encrypt(a, offset=-100),
    "qssrfmx世界さいこう【】；‘",
  )
}

///|
test "caesar_decrypt" {
  let a = "kh1oor"
  assert_eq(caesar_decrypt(a), "he1llo")
  let a = "qssrfmx"
  assert_eq(caesar_decrypt(a, offset=-100), "moonbit")
  let a = "ikkjxepさ"
  assert_eq(caesar_decrypt(a, offset=100), "moonbitさ")
}
