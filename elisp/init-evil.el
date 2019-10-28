;;; package --- EVIL init
;;; Commentary:
;;; Initialize EVIL mode and configure custome key-bindings
;;; Code:

(use-package undo-tree
  :ensure t)

(defun config-evil-leader()
  "Configure evil leader mod."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "W" 'whitespace-mode
    "p" 'projectile-file-file
    "w" 'save-buffer
    "x" 'helm-M-x))

(defun config-evil()
  "Configure evil mode."

  (dolist (mode '(ag-mode
                  custom-mode
                  custom-new-theme-mode
                  dired-mode
                  flycheck-error-list-mode
                  git-rebase-mode
                  term-mode))
    (add-to-list 'evil-emacs-state-modes mode))

  (delete 'term-mode evil-insert-state-modes)
  (delete 'eshell-mode evil-insert-state-modes)

  (dolist (mode '(magit-log-edit-mode))
    (add-to-list 'evil-insert-state-modes mode))

  (add-to-list 'evil-buffer-regexps '("\\*Flycheck"))


  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/") 'evil-search-forward
    (kbd "n") 'evil-search-next
    (kbd "N") 'evil-search-previous
    (kbd "C-d") 'evil-scroll-down
    (kbd "C-u") 'evil-scroll-up
    (kbd "C-w C-w") 'other-window)

  ;; global bindings
  (evil-define-key 'normal global-map (kbd "<down>") 'evil-next-visual-line)
  (evil-define-key 'normal global-map (kbd "<up>") 'evil-previous-visual-line)
  (evil-define-key 'normal global-map (kbd "-") 'helm-find-files)
  (evil-define-key 'normal global-map (kbd "C-e") 'end-of-line))

(use-package evil
  :ensure t
  :commands (evil-mode evil-define-key)
  :config
  (add-hook 'evil-mode-hook 'config-evil)
  (evil-mode 1)


  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode)
    (config-evil-leader))

  (use-package evil-indent-textobject
    :ensure t))

(provide 'init-evil)
;;; init-evil.el ends here
