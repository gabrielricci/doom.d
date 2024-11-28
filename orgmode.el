;;; orgmode.el -*- lexical-binding: t; -*-

(use-package! org
  ;; set up custom variables
  :custom
  (org-hide-emphasis-markers nil)
  (org-tags-column 0)
  (org-directory "~/Documents/Org")
  (org-agenda-files '("~/Documents/Org/Tasks.org"))
  (org-log-done t)
  (org-startup-indented t)
  (org-log-into-drawer t)
  (org-special-ctrl-a/e t)
  (org-special-ctrl-k t)
  (org-return-follows-links t)
  (org-pretty-entities t)
  (org-return-follows-link t)
  (org-agenda-start-with-log-mode nil)
  (org-auto-align-tags t)
  (org-insert-heading-respect-content t)
  (org-ellipsis "...")
  (org-adapt-indentation t)


  (org-tag-alist
   '(;; Places
     ("@home" . ?h)
     ("@work" . ?w)

     ;; Actions
     ("@schedule" . ?s)
     ("@read" . ?r)

     ;; themes
     ("@coding" . ?c)
     ("@finance" . ?f )

     ;; work
     ("@uber" . ?u)
     ("@personal" . ?p )))

  :hook
  (org-mode . visual-line-mode)
  (org-mode . variable-pitch-mode)
  (org-mode . (lambda ()
                ;; disable completition
                (company-mode -1)
                (hl-line-mode -1)

                ;; disable other modes
                (menu-bar-mode -1)
                (tool-bar-mode -1)
                (scroll-bar-mode -1)

                ;; set margins
                (progn
                  (setq line-spacing 0.25)
                  (setq left-margin-width 40)
                  (setq right-margin-width 40)
                  (set-window-buffer nil (current-buffer)))

                ;; remove line numbers
                (setq-local display-line-numbers nil)

                ;; set org-todo values
                (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
                                          (sequence "BACKLOG(b)" "PROGRESS(p)" "HOLD(h)" "|" "COMPLETED(c)" "CANCEL(k)")))

                (setq org-todo-keywords-for-agenda '("TODO(t)" "NEXT(n)" "|" "DONE(d!)" "BACKLOG(b)"
                                                     "PROGRESS(p)" "HOLD(h)" "|" "COMPLETED(c)"
                                                     "CANCEL(k)"))

                (setq org-todo-keyword-faces '(
                                               ("TODO" . (:foreground "#FF6C6B" :bold t :weight bold))
                                               ("PROGRESS" . (:foreground "#ECBE7B" :bold t :weight bold))
                                               ("DONE" . (:foreground "#98BE65" :bold t :weight bold))
                                               ))

                (setq org-priority-faces '((?A . (:height 0.9 :foreground "#FF6C6B" :weight bold))
                                           (?B . (:height 0.9 :foreground "#ECBE7B"))
                                           (?C . (:height 0.9 :foreground "#98BE65"))))

                ;; Ensure tables and fixed-width elements use fixed-pitch font
                (set-face-attribute 'org-table nil :family "Menlo":inherit 'fixed-pitch)
                (set-face-attribute 'org-code nil :family "Menlo" :inherit 'fixed-pitch)
                (set-face-attribute 'org-block nil :family "Menlo" :inherit 'fixed-pitch)
                (set-face-attribute 'org-block-begin-line nil :family "Menlo" :inherit 'fixed-pitch)
                (set-face-attribute 'org-block-end-line nil :family "Menlo" :inherit 'fixed-pitch)
                (set-face-attribute 'org-drawer nil :family "Menlo" :inherit 'fixed-pitch)
                (set-face-attribute 'org-special-keyword nil :family "Menlo" :inherit 'fixed-pitch)

                ;; set heading fonts
                (custom-theme-set-faces
                 'user
                 '(org-level-1 ((t (:font "Lucida Grande" :weight bold :height 1.1 :foreground "#fff"))))
                 '(org-level-2 ((t (:font "Lucida Grande" :weight bold :height 1.1 :foreground "#fff"))))
                 '(org-level-3 ((t (:font "Lucida Grande" :weight bold :height 1.1 :foreground "#fff"))))
                 '(org-level-4 ((t (:font "PT Sans" :weight bold :height 1.0 :foreground "#fff"))))
                 '(org-level-5 ((t (:font "PT Sans" :weight bold :height 1.0 :foreground "#fff"))))
                 '(org-level-6 ((t (:font "PT Sans" :weight bold :height 1.0 :foreground "#fff"))))
                 '(org-level-7 ((t (:font "PT Sans" :weight bold :height 1.0 :foreground "#fff"))))
                 '(org-level-8 ((t (:font "PT Sans" :weight bold :height 1.0 :foreground "#fff"))))
                 '(org-drawer ((t (:font "PT Sans" :weight normal :height 0.7 :foreground "#ccc"))))
                 '(org-special-keyword ((t (:font "PT Sans" :weight normal :height 0.8 :foreground "#ccc"))))
                 '(org-document-title ((t (:font "PT Sans" :weight regular :height 0.8 :foreground "#fff"))))
                 '(org-property-value ((t (:font "PT Sans" :weight regular :height 0.7 ))))
                 '(org-document-info-keyword ((t (:font "PT Sans" :weight regular :height 0.8 :foreground "#ccc"))))
                 '(org-meta-line ((t (:font "PT Sans" :weight regular :height 0.8 :foreground "#ccc"))))
                 '(org-link ((t (:weight bold :height 0.9 ))))
                 '(org-date ((t (:weight regular :height 0.8 ))))
                 '(org-todo ((t (:weight regular :height 0.9))))
                 '(org-done ((t (:weight regular :height 0.9 :foregroud "#fff" :background: "green"))))
                 '(org-tag ((t (:weight regular :height 0.8 :foreground "#fff"))))
                 '(org-block-begin-line ((t (:background "#121212" :foreground "#579c4c" :inherit))))
                 '(org-block-end-line ((t (:background "#121212" :foreground "#579c4c" :inherit))))
                 '(org-headline-done ((t (:font "PT Sans" :foreground "#ccc")))))

                ;; Preserve fixed-pitch font for agenda
                (add-hook 'org-agenda-finalize-hook
                          (lambda ()
                            (set-face-attribute 'org-agenda-structure nil :inherit 'fixed-pitch)
                            (set-face-attribute 'org-agenda-date nil :inherit 'fixed-pitch)
                            (set-face-attribute 'org-agenda-date-today nil :inherit 'fixed-pitch)
                            (set-face-attribute 'org-agenda-date-weekend nil :inherit 'fixed-pitch)))

                ))

  )

;; Capture notes
(use-package! org-roam
  :custom
  (org-roam-directory "~/Documents/Org"))

(defun my/org-roam-capture-task-entry ()
  (interactive)
  (org-roam-capture- :node (org-roam-node-create)
                     :templates '(("u" "uber" plain "** TODO %? :@uber:"
                                   :if-new (file+head "Tasks.org" "#+title: Tasks\n"))
                                  ("p" "personal" plain "** TODO %? :@personal:"
                                   :if-new (file+head "Tasks.org" "#+title: Tasks\n")))))

(global-set-key (kbd "C-c n e") #'my/org-roam-capture-task-entry)


(after! org
  ;; associate all org files with org mode
  (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

  ;; custom agenda commands
  (setq org-agenda-custom-commands
        '(("u" "Uber"
           ((tags "@uber"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("TODO"  "DONE" "BACKLOG")))
                   (org-agenda-overriding-header "Uber - In progress")
                   (org-agenda-sorting-strategy '(priority-down))))

            (tags "@uber"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("PROGRESS" "DONE")))
                   (org-agenda-overriding-header "Uber - Todo")
                   (org-agenda-sorting-strategy '(priority-down))))

            (tags "@uber"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("PROGRESS" "TODO" "NEXT" "BACKLOG")))
                   (org-agenda-overriding-header "Uber - Done")
                   (org-agenda-sorting-strategy '(priority-down))))
            ))
          ("p" "Personal"
           ((tags "@personal"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("TODO"  "DONE" "BACKLOG")))
                   (org-agenda-overriding-header "Personal - In progress")
                   (org-agenda-sorting-strategy '(priority-down))))

            (tags "@personal"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("PROGRESS" "DONE")))
                   (org-agenda-overriding-header "Personal - Todo")
                   (org-agenda-sorting-strategy '(priority-down))))

            (tags "@personal"
                  ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo '("PROGRESS" "TODO" "NEXT" "BACKLOG")))
                   (org-agenda-overriding-header "Personal - Done")
                   (org-agenda-sorting-strategy '(priority-down))))
            ))))


  ;; set org-todo values
  (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
                            (sequence "BACKLOG(b)" "PROGRESS(p)" "HOLD(h)" "|" "COMPLETED(c)" "CANCEL(k)"))))
