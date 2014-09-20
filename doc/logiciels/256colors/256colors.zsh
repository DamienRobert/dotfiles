#!/usr/bin/zsh

spectrum_ls() {
  for code in {000..255}; do
print -P -- "$code: %F{$code}Test color%f"
  done
}

spectrum_ls
