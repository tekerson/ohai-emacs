;;; orly-javascript --- Summary
;;; -*- lexical-binding: t -*-
(require 'ohai-javascript)

(require 'js-align)
(require 'tide)

;;; Commentary:

;;; Code:

(defun setup-tide-mode ()
  (interactive)
  (when (projectile-verify-file "**/tsconfig.json")
    (tide-setup)
    ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
    (tide-hl-identifier-mode t)))

(use-package js2-mode
  :config
  (bind-keys :map js2-mode-map
             ("C-m" . js2-line-break)
             ("M-j" . delete-indentation)
             ("C-c \\" . "λ"))

  (js2-mode-hide-warnings-and-errors)

  (custom-set-variables
   '(js2-mode-indent-ignore-first-tab nil)
   '(js2-strict-inconsistent-return-warning nil)
   '(js-indent-level 2)
   '(js-switch-indent-offset 2)
   '(js2-bounce-indent-p t))
   ;; js2-global-externs '("module" "require" "__dirname" "process" "console" "JSON" "$" "_" "describe" "it" "expect"))

  ;; Pretty arrow functions & ellipsiseses in JS
  (with-eval-after-load "js2-mode"
            (ohai/font-lock-replace-symbol 'js2-mode "\\(=>\\)" "⇒")
            (ohai/font-lock-replace-symbol 'js2-mode "\\(\\.\\.\\.\\)" "…")
            (ohai/font-lock-replace-symbol 'js2-mode "\\(!==\\)" "≢")
            (ohai/font-lock-replace-symbol 'js2-mode "\\(===\\)" "≡")
            (ohai/font-lock-replace-symbol 'js2-mode "\\(!=\\)" "≠")
            (ohai/font-lock-replace-symbol 'js2-mode "\\(<=\\)" "≤")
            (ohai/font-lock-replace-symbol 'js2-mode "\\(>=\\)" "≥")
            ;; Fix silly js2-mode indentation
            (js-align-activate))

  (use-package flycheck
    :config
    (setq-default flycheck-disabled-checkers '(javascript-jscs javascript-jshint))
    (flycheck-add-next-checker 'javascript-eslint '(error . javascript-tide)))
    ;; (setq-default js2-strict-inconsistent-return-warning nil)
    ;; (setq-default js2-strict-trailing-comma-warning nil))

  ;; Use the Typescript Checker
  ;;(add-hook 'js2-mode-hook #'setup-tide-mode)
  )

(provide 'orly-javascript)
;;; orly-javascript.el ends here
