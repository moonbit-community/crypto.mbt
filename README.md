# crypto.mbt

一些加密算法与各种编码方式,主要为[moonbitlang/x](https://github.com/moonbitlang/x/tree/main/crypto)中暂未支持的类型,用moonbit原生实现     

~~并非web3~~

## why

因为问了下说建议单开个库,所以就有了这个库

![](/assets/add.png)

## TODO 

### Classicl

- [X] Caesar

### Modern

- [ ] AES **暂不稳定, 谨慎使用**
- [ ] SM4
- [ ] DES


## Usage

还没发包呢

```bash
moon update
moon add FrenchPicnic/cryptox
```

```moonbit
inspect(@FrenchPicnic/cryptox.caesar_encrypt("Hello"), content="Khoor")
inspect(@FrenchPicnic/cryptox.caesar_encrypt("World", offset=5), content="Btwqi")
```