# Installation

## Move your current nvim

```bash
mv ~/.config/nvim ~/.config/nvim.bak
```


## Remove nvim from cache and local, optional but recommended
```bash
rm -fr ~/.cache/nvim ~/.local/share/nvim ~/.local/state/nvim
```

## Clone the repo

```bash
git clone https://github.com/nahumtv/nvim.git ~/.config/nvim
```
## Install dependecies
### Mac
```bash
brew install fd ripgrep
```
### Ubuntu

```bash
sudo apt install fd-find ripgrep
```
```bash
sudo ln -s $(which fdfind) /usr/local/bin/fd
```


## Start NeoVim

```bash
nvim .

```
