tmux
=====

Installation
------------

Requirements:

  - tmux **`>= 2.1`** running inside Linux, Mac, OpenBSD, Cygwin or WSL (Bash on
    Ubuntu on Windows)
  - outside of tmux, `$TERM` must be set to `xterm-256color`

To install, run the following from your terminal: (you may want to backup your
existing `~/.tmux.conf` first)

```
$ cd
$ mv tmux ~/.tmux
$ ln -s -f .tmux/.tmux.conf
$ cp .tmux/.tmux.conf.local .
```
