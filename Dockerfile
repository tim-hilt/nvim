# INFO: Not functional right now! Adapt to packer
FROM archlinux:latest

RUN useradd -m dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers \
      && sed -i "s/#Color/Color/" /etc/pacman.conf \
      && sed -i "s/#ParallelDownloads/ParallelDownloads/" /etc/pacman.conf

RUN pacman --cachedir /tmp -Syu --noconfirm \
      fish \
      git \
      clang \
      starship \
      sudo \
      tmux \
      neovim \
      ranger \
      && rm -rf /tmp/* \
      && mkdir /home/dev/.config \
      && chown dev /home/dev/.config

USER dev

ENV HOME /home/dev

COPY --chown=dev:dev . /home/dev/.config/nvim
RUN mkdir /home/dev/.config/fish \
      && echo "starship init fish | source" >> /home/dev/.config/fish/config.fish

WORKDIR /home/dev

RUN curl -sfLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim -es -u /home/dev/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa" -V

ENTRYPOINT [ "fish" ]
