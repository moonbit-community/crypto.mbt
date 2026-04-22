///|
test "aes_test" {
  let text = "test"
  let buf = @encoding.encode(UTF8, text)
  assert_not_eq(
    aes_encrypt(
      buf.to_array(),
      // @encoding.encode_to("test",,encoding = UTF8).to_bytes().to_fixedarray(),
      buf.to_array(),
    ).to_string(),
    "0502c0926ec94669d76074a9c6159f5aa816ce96f6dfc4199fcd2c0b4847aeec",
  )
}
