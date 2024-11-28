;; Here are some additional functnions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; [org] visual tidy up
(use-package! org
  ;; set up custom variables
  :custom
  (org-hide-emphasis-markers t)
  (org-ellipsis "[+]")
  (org-tags-column 0)
  (org-directory "~/Documents/Org")
  (org-agenda-files '("~/Documents/todo.org" "~/Documents/notes.org"))
  (org-log-done t)
  (org-startup-indented t)
  (org-log-into-drawer t)
  (org-special-ctrl-a/e t)
  (org-special-ctrl-k t)
  (org-return-follows-links t)
  (org-pretty-entities t)
  (org-return-follows-link t)
  (org-modern-hide-stars t)
  (org-auto-align-tags nil)
  (org-tags-column 0)
  (org-insert-heading-respect-content t)
  (org-pretty-entities t)
  (org-agenda-tags-column 0)
  (org-tag-alist
   '(;; Places
     ("@home" . ?h)
     ("@work" . ?w)

     ;; Actions
     ("@schedule" . ?s)
     ("@read" . ?r)

     ;; pics
     ("@programming" . ?p)
     ("@finance" . ?f )))

  ;; set up custom face


  ;; set up hooks
  :hook
  (org-mode . visual-line-mode)
  (org-mode . variable-pitch-mode)
  (org-mode . (lambda ()
                ;; set org-todo values
                (setq org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!)")
                                          (sequence "BACKLOG(b)" "PROGRESS(p)" "HOLD(h)" "|" "COMPLETED(c)" "CANCEL(k)")))
