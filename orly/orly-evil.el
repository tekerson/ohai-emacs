;;; -*- lexical-binding: t -*-

;; Enable evil mode by default
(require 'ohai-package)

(use-package evil
  :bind (:map evil-motion-state-map
              ("C-a" . evil-first-non-blank)
              ("C-e" . evil-end-of-line)
              ("C-u" . evil-scroll-up))

  :init
  (evil-mode t)

  :config
  ;; Clear all bindings in insert mode, revert to emacs bindings
  (setq evil-insert-state-map (make-sparse-keymap))
  (define-key evil-insert-state-map (kbd "<escape>") 'evil-normal-state)

  (custom-set-variables
   '(evil-symbol-word-search t)))

(provide 'orly-evil)
