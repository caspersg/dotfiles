
# install

brew install neovim

brew install ripgrep

<!-- from https://gist.github.com/davidteren/898f2dcccd42d9f8680ec69a3a5d350e -->

brew tap homebrew/cask-fonts
brew install --cask font-mononoki-nerd-font

# install kickstart

git clone https://github.com/nvim-lua/kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

rm .git from nvim
setup soft link in my ~/projects/vimrc

# install terminal
## kitty

brew install --cask kitty

configure kitty font

font_family Monoki Nerd Font Mono
bold_font auto
italic_font auto
bold_italic_font auto

font_size 16.0

scrolling and buffers are weird

## iterm
gone back to iterm2
fullscreen mode:
- disable macos animations
- iterm2 disable native fullscreen
install Github dark color scheme
use Mononoki Nerd Font Mono
ignore cmd-P

## windows terminal ubuntu WSL

# configure neovim
follow https://github.com/nvim-lua/kickstart.nvim

brew install ripgrep fd


# setup git
vim-fugitive
caspersg/shell/git_aliases.sh
diffview.nvm
neogit

# CAPS to ctrl and esc
## xcape
https://gist.github.com/tanyuan/55bca522bf50363ae4573d4bdcf06e2e?permalink_comment_id=4271644
xcape not on macos

## hammerspoon
https://github.com/jasonrudolph/ControlEscape.spoon
```
mkdir -p ~/.hammerspoon/Spoons

git clone https://github.com/jasonrudolph/ControlEscape.spoon.git ~/.hammerspoon/Spoons/ControlEscape.spoon

cd ~/.hammerspoon/Spoons/ControlEscape.spoon

script/setup
```

works!

## windows
https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows
the "fwompner" option, saved in scripts/

compile to exe
add link to startup dir

# open links in neovim from iterm2

https://gist.github.com/rpapallas/31dfdf0626d078a357fccd46cdf6eafd

# ruby debugger
nvim-dap
nvim-dap-ui
nvim-dap-ruby

# not needed
<!-- bundle add readapt --group "development, test" -->
<!-- gem install readapt -->

# TODO
- [x] better theme
-- tokyodark
- [x] ruby lsp 
-- solargraph has goto definition
-- [ ] goto def across files.
--- works for some constants
- [x] neogit 
-- telescope, diffview
- [x] caps as ctrl and esc
- [x] install chatgpt
-- [ ] try out features
- [x] debugger
- [ ] spelling plugin?
- [ ] rebuild ruby env?
- [x] python lsp
-- installed
- [ ] java lsp
-- installed
- [ ] learn vim registers
- [ ] learn jumplists, changelists, and taglists
- [x] learn vim marks
- [ ] profile neovim performance
- [x] look through https://github.com/rockerBOO/awesome-neovim


# testing

( ( hi ) )

[ { "json": "d"} ]
