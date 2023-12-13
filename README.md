# dotfiles
Repo for my configuration files

## Recommended Setup

### Linux
- Clone repo into `/home/<username>/dotfiles`
    - `git clone https://<username>@github.com/JimroidZeus/dotfiles.git ./dotfiles`

- Backup existing `.bashrc` and `.bash_profile` files.
    - `cp ./.bashrc ./.bashrc.bak`
    - `cp ./.bash_profile ./.bash_profile.bak`

- Create Symlinks
    - 'ln -s /home/<username>/dotfiles/.bashrc /home/<username>/.bashrc'
    - 'ln -s /home/<username>/dotfiles/.bash_profile /home/<username>/.bash_profile'

### MacOS

### Windows