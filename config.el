;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Gabriel Ricci"
      user-mail-address "gabrielricci@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


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

;; [projectile] xcustom projectile config
(setq projectile-project-search-path '("~/Projects/gabrielricci-knowledge-base"))

;; kill whole line instead of emptying it
(setq kill-whole-line t)

;; disable exit confirmation
(setq confirm-kill-emacs nil)

;; [org] visual tidy up
(use-package! org
  ;; set up custom variables
  :custom
  (org-hide-emphasis-markers t)
  (org-ellipsis "[+]")
  (org-tags-column 0)
  (org-directory "~/Documents")
  (org-log-done t)
  (org-startup-indented t)
  (org-log-into-drawer t)
  (org-special-ctrl-a/e t)
  (org-special-ctrl-k t)
  (org-return-follows-links t)
  (org-pretty-entities t)
  (org-return-follows-link t)
  (org-modern-hide-stars t)

  ;; set up custom face
  :custom-face
  (variable-pitch ((t (:family "Avenir Next" :height 140 :weight light))))
  (fixed-pitch ((t (:family "Fira Code Retina" :height 100))))

  ;; set up hooks
  :hook
  (org-mode . visual-line-mode)
  (org-mode . variable-pitch-mode)
  (org-mode . (lambda ()
                ;; disable completition
                (company-mode -1)
                (hl-line-mode -1)

                ;; set margins
                (progn
                  (setq left-margin-width 40)
                  (setq right-margin-width 40)
                  (set-window-buffer nil (current-buffer)))

                ;; remove line numbers
                (setq-local display-line-numbers nil)

                ;; set fonts
                (let* ((variable-tuple
                        (cond ((x-list-fonts   "ETBembo")         '(:font   "ETBembo"))
                              ((x-list-fonts   "Source Sans Pro") '(:font   "Source Sans Pro"))
                              ((x-list-fonts   "Lucida Grande")   '(:font   "Lucida Grande"))
                              ((x-list-fonts   "Verdana")         '(:font   "Verdana"))
                              ((x-family-fonts "Sans Serif")      '(:family "Sans Serif"))
                              (nil (warn "Cannot find a Sans Serif Font."))))
                       (base-font-color (face-foreground 'default nil 'default))
                       (headline `(:inherit default :weight bold
                                   :foreground ,base-font-color)))

                  ;; set heading fonts
                  (custom-theme-set-faces
                   'user
                   `(org-level-8        ((t (,@headline ,@variable-tuple))))
                   `(org-level-7        ((t (,@headline ,@variable-tuple))))
                   `(org-level-6        ((t (,@headline ,@variable-tuple))))
                   `(org-level-5        ((t (,@headline ,@variable-tuple))))
                   `(org-level-4        ((t (,@headline ,@variable-tuple :height 1.1))))
                   `(org-level-3        ((t (,@headline ,@variable-tuple :height 1.2))))
                   `(org-level-2        ((t (,@headline ,@variable-tuple :height 1.3))))
                   `(org-level-1        ((t (,@headline ,@variable-tuple :height 1.4))))
                   `(org-headline-done  ((t (,@headline ,@variable-tuple :strike-through t))))
                   `(org-document-title ((t (,@headline ,@variable-tuple))))))

                ;; make sure tables are correctly rendered
                (set-face-attribute 'org-table nil :inherit 'fixed-pitch))))

;; [org-modern] init
(use-package! org-modern
  :config
  (add-hook 'org-mode-hook (lambda () (org-modern-mode()))))

;; [lsp-dart]
(use-package! dart-mode
  :hook (dart-mode-hook . lsp))

(setq openai-key "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")
(setq url-debug t)
