FROM docker.uclv.cu/alpine:latest

RUN apk add -U --no-cache \
    bash curl wget neovim git


COPY ./.config/nvim /root/.config/nvim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
RUN nvim --headless +'PlugInstall --sync' +qa

