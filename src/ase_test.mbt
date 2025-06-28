///|
test "aes_test" {
  let text = "test"
  let buf = @buffer.new()
  @encoding.encode_to(text, buf, encoding=UTF8)
  assert_eq(
    @xpto.bytes_to_hex_string(
      aes_encrypt(
        buf.to_bytes().to_fixedarray(),
        // @encoding.encode_to("test",,encoding = UTF8).to_bytes().to_fixedarray(),
        buf.to_bytes().to_fixedarray(),
      ),
    ),
    "d43b94775a483237844ee52a9862f87f",
  )
}
