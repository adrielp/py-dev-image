FROM python:3.10-buster
ARG MY_UID
ARG MY_GID
ARG MY_USERNAME
ARG MY_GROUPNAME

RUN useradd -m -u $MY_UID -g $MY_GROUPNAME $MY_USERNAME \
    && passwd -d $MY_USERNAME \
    && mkdir /home/$MY_USERNAME/python -p \
    && chown -R $MY_USERNAME:$MY_GROUPNAME /home/$MY_USERNAME/python

RUN pip install --upgrade pip \
    && pip install ruamel.yaml \
    && pip install tensorflow

RUN apt-get update \
    && apt-get install zsh -y \
    && apt-get clean \
    && chsh -s "$(which zsh)" $MY_USERNAME

RUN curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage; \
	chmod +x nvim.appimage; \
	./nvim.appimage  --appimage-extract

RUN curl -LO https://nodejs.org/dist/v14.16.0/node-v14.16.0-linux-x64.tar.xz \
	&& mkdir -p /usr/lib/nodejs \
	&& tar -xJvf node-v14.16.0-linux-x64.tar.xz -C /usr/lib/nodejs \
    && rm node-v14.16.0-linux-x64.tar.xz

ENV PATH=/usr/lib/nodejs/node-v14.16.0-linux-x64/bin:/squashfs-root/usr/bin:$PATH

RUN npm i -g pyright

COPY --chown="$MY_USERNAME:$MY_GROUPNAME" \
    src/.zshrc \
    /home/$MY_USERNAME/.zshrc

COPY --chown="$MY_USERNAME:$MY_GROUPNAME" \
    src/init.vim \
    /home/$MY_USERNAME/.config/nvim/init.vim

USER $MY_USERNAME

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" \
    && mv /home/$MY_USERNAME/.zshrc.pre-oh-my-zsh /home/$MY_USERNAME/.zshrc

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' \
      && nvim -c 'PlugInstall --sync' +qall

WORKDIR /home/$MY_USERNAME

LABEL maintainer="$MY_USERNAME" \
    description="Python container development environment with NeoVim and LSP." \
    version="1.0.0"
