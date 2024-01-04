# Clipboard management mappings
set-option global scrolloff 30,0

add-highlighter global/ number-lines -relative
add-highlighter global/ wrap -word
add-highlighter global/ show-matching
add-highlighter global/ show-whitespaces

map global normal <c-s> ':write-all<ret>'
map global insert <c-s> '<a-;>:write-all<ret>'
map global normal <c-x> ':write-all;quit<ret>'
map global insert <c-x> '<a-;>:write-all;quit<ret>'

map global normal <F5> ':%{ buffile }<ret>'

# PLUGINS
source "%val{config}/plugins/plug.kak/rc/plug.kak"
plug "andreyorst/plug.kak" noload

plug "lePerdu/kakboard" %{
    hook global WinCreate .* %{ kakboard-enable }
}

plug "andreyorst/powerline.kak" defer powerline_gruvbox %{
    powerline-theme gruvbox
} config %{
    powerline-start
}

plug "natasky/kakoune-multi-file"

plug 'delapouite/kakoune-auto-percent'

plug 'crizan/kak-rainbower' do %{
    gcc rc/rainbower.cpp -O2 -o rc/rainbower
} config %{
    hook global WinCreate .* rainbow-enable-window
}

plug "kak-lsp/kak-lsp" do %{
    cargo install --locked --force --path .
    # optional: if you want to use specific language servers
    mkdir -p ~/.config/kak-lsp
    cp -n kak-lsp.toml ~/.config/kak-lsp/
}

plug "andreyorst/smarttab.kak"
