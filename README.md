# fuse-simulations

DappTools project to simulate Fuse parameter changes.

## Installation

### Toolset

- First, install Nix:

```sh
# User must be in sudoers
curl -L https://nixos.org/nix/install | sh

# Run this or login again to use Nix
. "$HOME/.nix-profile/etc/profile.d/nix.sh"
```

- Then, install DappTools:

```sh
curl https://dapp.tools/install | sh
```

### Project Setup

- First, clone the repo locally:

```sh
git clone https://github.com/rari-capital/fuse-simulations
cd fuse-simulations
```

- Then, install the project's dependencies:

```sh
make
```

- Finally, rename `.env.example` to `.env` and set `ETH_RPC_URL` to a valid Ethereum RPC URL:

```sh
# Inside .env

ETH_RPC_URL=https://eth-mainnet.alchemyapi.io/v2/YOUR_ALCHEMY_KEY_HERE # Set this to a valid Ethereum RPC URL.
```

## Simulating

- First, update `Simulations.t.sol` to perform the actions you want to simulate on a mainnet fork.

- Then, simply run `dapp test` to view the results of your simulation.
