# astronvim_config

**Make a backup of your current nvim folder**

mv ~/.config/nvim ~/.config/nvim.bak

**Clean old plugins**

mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak

**Cleanup cache**

rm -rf ~/.cache/nvim

**Clone the AstroNvim repository**

git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

**Clone custom configuration**

git clone https://github.com/ezcafe/astronvim_config.git ~/.config/nvim/lua/user

**Initialize AstroNvim**

nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
