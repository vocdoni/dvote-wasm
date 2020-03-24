# DVote Wasm

Experimental prototype to run Wasm on NodeJS and attempt to run it in a browser too.

This repo is only used to generate the Wasm used by the User registry to hash public keys.

## Get started

```sh
make init
make all
```

## NodeJS

```js
const wasm = require("./pkg-node")
const pubKey = "0x045a126cbbd3c66b6d542d40d91085e3f2b5db3bbc8cda0d59615deb08784e4f833e0bb082194790143c3d01cedb4a9663cb8c7bdaaad839cb794dd309213fcf30"
const digestedKey = wasm.digest_hex_claim(pubKey)

console.log(digestedKey)
// EB2a00pTkDYoqlnPUQ49D8wUZ41YPwEVpaoaLr2YY5w=
```

```js
const wasm = require("./pkg-node")
const textClaim = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."

const hash = wasm.digest_string_claim(textClaim)

console.log(hash)
// I2rUN6QzXXAgyyx/B/7CgLYH1YrIXtsIb61lXON1Xok=
```

## Web browser

Work in progress
