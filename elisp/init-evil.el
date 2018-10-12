;;; package --- EVIL init
;;; Commentary:
;;; Initialize EVIL mode and configure custome key-bindings
;;; Code:

(use-package evil
  :ensure t
  :commands (evil-mode)
  :config
  (add-hook 'evil-mode-hook)
  (evil-mode 1))

(provide 'init-evil)
;;; init-evil.el ends here
