## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```


The following challenge specified in CHALLENGE.md is devoloped using the Foundry

## scripts for testing are ran using the commands

`forge test` & `forge script/Interact.s.sol:TestInteract --rpc-url {rpc url} --private-key {private key} --broadcast --legacy -vvvv`

## scripts for deployment are ran using the command

`forge script/AccessControl.s.sol:Deploy --rpc-url {rpc url} --private-key {private key} --broadcast --legacy`

All deployed contracts from scripts can be seen in the broadcast folder


## For the ethers/js script

`npm i`

`export PRIVATE_KEY=your_private_key_value`

`npx run ethersScript.ts`


## verified deployment address

https://testnet-scan.bitlayer.org/address/0x78a02fC3E0aaF8Fe95B63f7025e39bdFd51251de?tab=Contract