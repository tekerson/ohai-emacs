;;; orly-typescript --- Summary
;;; -*- lexical-binding: t -*-
(require 'ohai-package)
(require 'ohai-lib)

(require 'tide)

;;; Commentary:

;;; Code:

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (company-mode +1))

;; aligns annotation to the right hand side
;; (setq company-tooltip-align-annotations t)

(use-package typescript-mode
  :config
  (bind-keys :map typescript-mode-map
             ("C-]" . tide-jump-to-definition-reuse-window)
             ("M-j" . delete-indentation))

  ;; Pretty arrow functions & ellipsiseses in TS
  (with-eval-after-load "js2-mode"
    (ohai/font-lock-replace-symbol 'js2-mode "\\(=>\\)" "⇒")
    (ohai/font-lock-replace-symbol 'js2-mode "\\(\\.\\.\\.\\)" "…")
    (ohai/font-lock-replace-symbol 'js2-mode "\\(!==\\)" "≢")
    (ohai/font-lock-replace-symbol 'js2-mode "\\(===\\)" "≡")
    (ohai/font-lock-replace-symbol 'js2-mode "\\(!=\\)" "≠")
    (ohai/font-lock-replace-symbol 'js2-mode "\\(<=\\)" "≤")
    (ohai/font-lock-replace-symbol 'js2-mode "\\(>=\\)" "≥"))

  ;; formats the buffer before saving
  (add-hook 'before-save-hook 'tide-format-before-save)
  (add-hook 'typescript-mode-hook #'setup-tide-mode))

(provide 'orly-typescript)
;;; orly-typescript.el ends here
