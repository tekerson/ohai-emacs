;;; -*- lexical-binding: t -*-

;; Do idris stuff
(require 'ohai-package)

(use-package haskell-mode
  :commands haskell-mode
  :config

  ;; Change some ASCII art syntax into their corresponding Unicode characters.
  ;; Rebind the same Unicode characters to insert their ASCII art versions
  ;; if entered from the keyboard.
  ;; This is very much a matter of taste, feel free to disable it. Or better yet,
  ;; if you're into that sort of thing, see https://wiki.haskell.org/Unicode-symbols
  ;; for native Unicode support.
  (with-eval-after-load "haskell-mode"
    (ohai/font-lock-replace-symbol 'haskell-mode "\\(->\\)" "→")
    (ohai/font-lock-replace-symbol 'haskell-mode "\\(<-\\)" "←")
    (ohai/font-lock-replace-symbol 'haskell-mode "\\(=>\\)" "⇒")
    (ohai/font-lock-replace-symbol 'haskell-mode "\\(<=\\)" "≤")
    (ohai/font-lock-replace-symbol 'haskell-mode "\\(>=\\)" "≥")))

(provide 'orly-haskell)
