///|
test "aes_test" {
  let text = "test"
  let buf = @buffer.new()
  @encoding.encode_to(text, buf, encoding=UTF8)
  let buff = @buffer.new()
  @encoding.encode_to("testtesttesttest", buff, encoding=UTF8)
  assert_not_eq(
    aes_encrypt(
      buf.to_bytes().to_array(),
      // @encoding.encode_to("test",,encoding = UTF8).to_bytes().to_fixedarray(),
      buf.to_bytes().to_array(),
    ).to_string(),
    "0502c0926ec94669d76074a9c6159f5aa816ce96f6dfc4199fcd2c0b4847aeec",
  )
}
