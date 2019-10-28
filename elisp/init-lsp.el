;;; package --- LSP init
;;; Commentary:
;;; Initialize Language Server protocol
;;; Code:

(use-package eglot
  :ensure t)


(require 'init-elixir)

(add-to-list 'eglot-server-programs `(elixir-mode "~mackenzi/Documents/Projects/emacs-config/elixir-ls/release/language_server.sh"))

(provide 'init-lsp)
;;; init-lsp.el ends here
