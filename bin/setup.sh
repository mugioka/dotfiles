#!/bin/bash -e

formulas=(
  gh
  fzf
  bat
  asdf
  kube-ps1
  tmux
  homeport/tap/dyff
  zsh-syntax-highlighting
  tree
  wget
  git-secrets
  mysql-client
  cli53
  velero
  terraformer
  shellcheck
  ipcalc
  colordiff
)

echo "Running brew install formulas..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

$(brew --prefix)/opt/fzf/install

casks=(
  docker
  iterm2
  zoom
  slack
  lens
  pritunl
  gitify
  scroll-reverser
  spectacle
  bitwarden
  karabiner-elements
  multipass
)

echo "Running brew install casks..."
for cask in "${casks[@]}"; do
    brew install --cask $cask
done

tools=(
  fd
  golang
  kubectl
  kubie
  pre-commit
  k9s
  terraform
  awscli
  helm
  sops
  kustomize
  argo
  argocd
  jq
  yq
  kubetail
  nodejs
  terraform-docs
  hadolint
  terraform-ls
)

source /opt/homebrew/opt/asdf/libexec/asdf.sh

echo "Running asdf install tools..."
for tool in "${tools[@]}"; do
    asdf plugin add ${tool} && asdf install ${tool} latest && asdf global ${tool} latest
done

echo "Instaling vim-plug..."
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

tools=(
  awsp-plus
)

echo "Running npm install tools..."
echo ${tools} | xargs npm install -g
