First: check this out to see if you really want to do this sort of thing:

  http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

Then, you'll probably just want to roll your own.

If you really, really want to use my setup then try this:

Installation:
  
    git clone https://github.com/wmhess/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

    ln -s ~/.vim/gvimrc ~/.gvimrc

