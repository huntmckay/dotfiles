# dotfiles

The directory contains the common dotfiles I like to change on my linux systems

## Requirements

Ensure you have the following installed:

`apt install git stow vim -y`

## How to use

Check out this repo into your $HOME dir with git

```bash
$ git clone git@github.com:huntmckay/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create the symlinks

```bash
stow .
```

### TROUBLE

If you get a messages about a conflicting file use the `--adopt` flag 
