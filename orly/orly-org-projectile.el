;;; -*- lexical-binding: t -*-
;; (require 'ohai-package)
;; (require 'orly-orgmode)
;; (use-package org-projectile
;;   :config
;;   (progn
;;     (setq org-projectile-projects-file
;;           (concat org-directory "/projects.org"))
;;     (add-to-list 'org-capture-templates
;;                  (org-projectile-project-todo-entry
;;                   :capture-character "l"
;;                   :capture-template "* TODO %? %a\n"
;;                   :capture-heading "Linked Project TODO"))
;;     (add-to-list 'org-capture-templates
;;                  (org-projectile-project-todo-entry
;;                   :capture-character "p"))
;;     (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
;;     (push (org-projectile-project-todo-entry) org-capture-templates))
;;   :ensure t
;;   :bind (("C-c c" . org-capture)))

;; (provide 'orly-org-projectile)
