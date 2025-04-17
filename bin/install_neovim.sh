# Create Dir
mkdir -p ~/.local/opt/bin
cd ~/.local/opt

# dl neovim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
tar -xzf nvim-linux64.tar.gz
rm -rf nvim
mv nvim-linux64 nvim

# link
ln -sf ~/.local/opt/nvim/bin/nvim ~/.local/opt/bin/nvim
