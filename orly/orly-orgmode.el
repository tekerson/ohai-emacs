;;; orly-orgmode --- Summary

;;; Commentary:

;;; Code:
(require 'ohai-orgmode)

(defun orly/tangle-on-save ()
  "Automatically tangle `org-mode' files if the `tangle-on-save' option is set to t in the file somewhere. ie, #+OPTIONS: tangle-on-save:t."
  (save-excursion
    (widen)
    (goto-char (point-min))
    (when (and
           (eq major-mode 'org-mode)
           (eq buffer-read-only nil)
           (re-search-forward "^#\\+OPTIONS:.*tangle-on-save:t" (point-max) t)
           t) (org-babel-tangle))))

(use-package org
  :bind (("\C-ca" . org-agenda)
         ("\C-cc" . org-capture))
  :init
  (setq org-ditaa-jar-path "/usr/local/bin/ditaa")
  (setq org-hide-emphasis-markers t)
  (setq org-export-backends
        '(ascii
          beamer
          latex
          confluence
          md))

  :config
  (customize-set-variable
   'org-capture-templates
   '(("t" "Todo" entry (file+headline org-default-notes-file "Tasks")
      (file "~/.emacs.d/orly/org-templates/todo.org"))
     ("i" "Idea" entry (file+headline org-default-notes-file "Ideas")
      (file "~/.emacs.d/orly/org-templates/idea.org"))
     ("r" "Reading" entry (file+headline (concat org-directory "/reading.org") "Inbox")
      (file "~/.emacs.d/orly/org-templates/reading.org"))
     ("j" "Journal" entry (file+datetree (concat org-directory "/journal.org"))
      (file "~/.emacs.d/orly/org-templates/journal.org"))
     ("s" "Snippet" entry (file+headline (concat org-directory "/snippets.org") "Inbox")
      (file "~/.emacs.d/orly/org-templates/snippet.org"))))

  (customize-set-variable 'org-default-notes-file (concat org-directory "/notes.org"))
  (customize-set-variable 'org-refile-targets '((nil :level . 1)
                                                (org-agenda-files :level . 1)))
  (customize-set-variable 'org-refile-use-outline-path (quote file))
  (customize-set-variable 'org-refile-allow-creating-parent-nodes  'confirm)
  (customize-set-variable 'org-outline-path-complete-in-steps nil)
  (customize-set-variable 'org-clock-into-drawer "TIMESHEET")
  (customize-set-variable 'org-enforce-todo-dependencies t)
  (customize-set-variable 'org-enforce-todo-checkbox-dependencies t)

  ;; Allow in-word emphases (e.g. *thing*s like th~is~ w_ork_)
  ;; (setcar org-emphasis-regexp-components " \t('\"{[:alpha:]")
  ;; (setcar (nthcdr 1 org-emphasis-regexp-components) "[:alpha:]- \t.,:!?;'\")}\\")
  ;; (org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)

  ;; Make all org-mode headings the same size
  (dolist (face '(org-level-1 org-level-2 org-level-3 org-level-4 org-level-5
                         org-document-title org-document-info org-document-info-keyword))
    (set-face-attribute face nil :weight 'semi-bold :height 1.0))

  ;; Allow embedding languages in org-mode
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((shell . t)
     (java . t)
     (js . t)
     (ruby . t)
     (python . t)
     (R . t)
     (ditaa . t)
     (dot . t)))

  ;; Auto-tangle
  (add-hook 'org-mode-hook
            (lambda () (add-hook 'before-save-hook 'orly/tangle-on-save nil t)))

  (add-hook
   'org-mode-hook
   (lambda ()
     (visual-line-mode 1)
     (set-visual-wrap-column 0))))

(provide 'orly-orgmode)
;;; orly-orgmode.el ends here
