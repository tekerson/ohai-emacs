;;; -*- lexical-binding: t -*-

;; Do idris stuff
(require 'ohai-package)

(use-package idris-mode
  :commands idris-mode
  :config

  (bind-keys :map idris-mode-map
             ("C-c s" . idris-case-split))

  ;; Change some ASCII art syntax into their corresponding Unicode characters.
  ;; Rebind the same Unicode characters to insert their ASCII art versions
  ;; if entered from the keyboard.
  ;; This is very much a matter of taste, feel free to disable it. Or better yet,
  ;; if you're into that sort of thing, see https://wiki.haskell.org/Unicode-symbols
  ;; for native Unicode support.
  (with-eval-after-load "idris-mode"
    (ohai/font-lock-replace-symbol 'idris-mode "\\(->\\)" "→")
    (ohai/font-lock-replace-symbol 'idris-mode "\\(<-\\)" "←")
    (ohai/font-lock-replace-symbol 'idris-mode "\\(=>\\)" "⇒")))

(provide 'orly-idris)
