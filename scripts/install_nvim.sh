echo "Nvim setup"

echo "installing dependencies..."
sudo apt install cmake gettext lua5.1 liblua5.1-0-dev
sudo apt-get install ninja-build gettext cmake curl build-essential

echo "cloning repository..."
git clone -b v0.10.1 https://github.com/neovim/neovim $HOME/personal/neovim

echo "installing nvim..."
cd $HOME/personal/neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

echo "updating sim link..."
sudo update-alternatives --install /usr/bin/vim nvim /usr/local/bin/nvim 100
