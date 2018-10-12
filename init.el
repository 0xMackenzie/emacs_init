;;; package --- Summary
;;; Commentary:
;;; Root file of configuration.
;;; Code:
(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

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

(defvar backup-dir "~/.emacs.d/backups/")
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq make-backup-files nil)

(put 'narror-to-region 'disabled nil)
(put 'dired-find-alternate-file'disable nil)

(require 'init-org)

(defun my-minibuffer-setup-hook ()
  "Increase GC cons threshold."
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  "Set GC cons threshold to its default value."
  (setq gc-cons-threshold 1000000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

(setq evil-want-C-i-jump nil)
(require 'init-evil)

(use-package s
  :ensure t
  :defer 1)

(use-package dash :ensure t)

(use-package visual-fill-column :ensure t)

(use-package all-the-icons :ensure t)

(use-package all-the-icons-dired :ensure t)

(use-package helm-projectile
  :commands (helm-projectile helm-projectile-switch-project)
  :ensure t)

(use-package helm
  :ensure t
  :diminish helm-mode
  :commands helm-mode
  :config
  (helm-mode 1)
  (setq helm-buffers-fuzzy-matching t)
  (setq helm-autoresize-mode t)
  (setq helm-buffer-max-length 40)
  (define-key helm-map (kbd "S-SPC") 'helm-toggle-visible-mark)
  (define-key helm-find-files-map (kbd "C-k") 'helm-find-files-up-one-level))

(if (functionp 'display-line-numbers-mode)
    (and (add-hook 'display-line-numbers-mode-hook
                   (lambda () (setq display-line-numbers-type 'relative)))
         (add-hook 'prog-mode-hook #'display-line-numbers-mode))
  (use-package nlinum-relative
    :ensure t
    :config
    (nlinum-relative-setup-evil)
    (setq nlinum-relative-redisplay-delay 0)
    (add-hook 'prog-mode-hook #'display-line-numbers-mode)))

(require 'init-flycheck)

(use-package gruvbox-theme :ensure t)

(use-package smart-mode-line
  :ensure t
  :config
  (setq sml/theme 'dark)
  (sml/setup))

(require 'init-powerline)

;; use arrows to navigate windows
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

;; Make windmove work in org-mode:
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

(provide 'init)
;;; init.el ends here
