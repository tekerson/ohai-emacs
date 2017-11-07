;;; -*- lexical-binding: t -*-

;; Init paths to executables
;; (exec-path-from-shell-initialize)

;; General configuration variables
(custom-set-variables
 ;; "Common User Access" Ctrl-x/c/v/z cut/copy/paste/undo
 ;; '(cua-mode t nil (cua-base))
 '(default-major-mode 'text-mode))

;; Hacks because node isn't on my path by default
(setenv "PATH" (concat (getenv "PATH") ":/Users/brenton/.nvm/versions/node/v6.10.0/bin/"))
(setq exec-path (append exec-path '("/Users/brenton/.nvm/versions/node/v6.10.0/bin/")))

;; Load orly modules
(add-to-list 'load-path (concat dotfiles-dir "orly"))
(require 'orly-evil)
;; (require 'orly-neotree)
(require 'orly-haskell)
(require 'orly-idris)
(require 'orly-javascript)
(require 'orly-orgmode)
;; (require 'orly-org-projectile)

;; Ad-hoc configuration
(setq ring-bell-function 'ignore)
(global-undo-tree-mode)
;; (subword-mode t)

;; Only electric-pair if at the end of a line
(setq electric-pair-inhibit-predicate
      #'(lambda (char) (not (eolp))))

;; use helm for normal projectile things
(helm-projectile-on)

;; Make dark theme... not so dark
(add-hook 'ohai-appearance/dark-hook (lambda ()
          (set-face-background 'default "#263238")
          (set-face-background 'fringe "#263238")
          (set-face-background 'linum "#263238")))

;; Scroll by one line
(setq scroll-step 1)
(setq scroll-margin 4)

;; Use Command (⌘) as meta
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier nil))

;; don't make `#example.txt#` files
(setq make-backup-files nil)
(setq auto-save-default nil)

;; fix silly "No more flycheck errors"
(defun flycheck-or-norm-next-error (&optional n reset)
  (interactive "P")
  (if flycheck-mode
      (flycheck-next-error n reset)
    (next-error n reset)))
(defun flycheck-or-norm-previous-error (&optional n)
  (interactive "P")
  (if flycheck-mode
      (flycheck-previous-error n)
    (previous-error n)))

(use-package yasnippet
  :config
  (customize-set-variable 'yas-snippet-dirs "~/.emacs.d/snippets"))

(global-set-key (kbd "M-n") 'flycheck-or-norm-next-error)
(global-set-key (kbd "M-p") 'flycheck-or-norm-previous-error)

(set-register ?n (cons 'file "~/org/notes.org"))
(set-register ?p (cons 'file "~/org/projects.org"))
