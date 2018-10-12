;;; package --- Summary
;;; Commentary:
;;; Root file of configuration.
;;; Code:
(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(require 'init-elpa)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(blink-cursor-mode 0)
(when (boundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
(show-paren-mode 1)

(global-hl-line-mode 1)

(setq visual-line-fringe-indicator '(left-curly-arrow right-curly-arrow))
(setq-default left-fringe-width nil)
(setq-default indicate-empty-lines t)
(setq-default indent-tabs-mode nil)

(setq visible-bell t)
(setq vc-follow-symlinks t)
(setq large-file-warning-threshold nil)
(setq split-width-threshold nil)
(setq custom-safe-themes t)
(column-number-mode t)
(setq tab-width 2)
(setq tramp-default-method "ssh")

(require 'init-evil)

(use-package undo-tree
  :ensure t
  :diminish t
  :config
  (setq undo-tree-auto-save-history t)
  (setq undo-tree-history-directory-alist
        (list (cons "." (expand-file-name "undo-tree-history" user-emacs-directory)))))

(provide 'init)
;;; init.el ends here
