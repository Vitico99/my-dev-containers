FROM docker.uclv.cu/python:3.9-alpine

RUN apk add -U --no-cache \
  nodejs npm bash curl neovim git

COPY ./.config/nvim /root/.config/nvim
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && nvim --headless +'PlugInstall --sync' +qa

