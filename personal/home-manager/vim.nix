# Decent vim setup with some plugins.
{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {

  # Vim plugins and vimrc
  # maxboisvert/vim-simple-complete
  # madox2/vim-ai is still the best one I've ever used
  # but it started short-changing my output :(
  programs.vim = {
    enable = true;
    plugins = with pkgs.vimPlugins; [
      ai-vim
      calendar-vim
      copilot-vim
      fzf-vim
      nerdtree
      vim-airline
      vim-fugitive
      vim-lastplace
      vim-markdown-toc
      vim-nix
      vim-polyglot
      vimwiki
      vim-zettel
    ];

    extraConfig = ''
      "Blessed on Feb 16 2024

      let wiki_1 = {}
      let wiki_1.path = '~/vimwiki/'
      let wiki_1.syntax = 'markdown'
      let wiki_1.ext = '.md'
      let g:vimwiki_list = [wiki_1]

      "Use with :GenTocXXX to limit ToC depth"
      let g:vmt_max_level=2

      set nocompatible
      filetype on
      filetype plugin on
      syntax on
      set hlsearch

      set tabstop=4 shiftwidth=4 expandtab

      autocmd FileType bash,c,cpp,java set formatoptions+=ro
      autocmd FileType bash,c,cpp,java set omnifunc=ccomplete#Complete
      autocmd FileType bash,c,cpp,java set tabstop=4 shiftwidth=4 expandtab

      autocmd FileType ruby,html,eruby,css set omnifunc=ccomplete#Complete
      autocmd FileType ruby,html,eruby,css set tabstop=2 shiftwidth=2 expandtab

      autocmd FileType html,eruby set omnifunc=htmlcomplete#CompleteTags

      autocmd FileType Jenkinsfile set tabstop=2 shiftwidth=2 expandtab

      autocmd FileType make set tabstop=8 softtabstop=8

      au BufNewFile ~/Sync/personal/vimwiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template '%'

      let g:netrw_winsize=24

      set tags=./tags;/
    '';
  };
}
