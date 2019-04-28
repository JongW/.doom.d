;;; ~/.doom.d/+theme.el -*- lexical-binding: t; -*-

;; (load! "doom_gruvbox_theme.el")
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

(setq doom-modeline-buffer-state-icon t)

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;; (load-theme 'doom-opera t)
;; (load-theme 'doom-vibrant t)
;; (load-theme 'doom-dracula t)
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-tomorrow-night t)
;; (load-theme 'doom-gruvbox t)
(setq doom-theme 'doom-gruvbox)
;; (load-theme 'doom-city-lights t)
;;
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

;; (setq doom-font (font-spec :family "Iosevka Term" :size 35))
(setq doom-font (font-spec :family "Iosevka Term" :size 20))
(setq all-the-icons-scale-factor 1)

;; (set-face-background 'line-number-current-line "#555556")
(setq display-line-numbers-type 'relative)
;; (custom-set-faces '(line-number-current-line ((t :weight bold
;;                                                  :foreground "#fabd2f"
;;                                                  :background "yellow"))))

;; ;; If this doesnt work go to list-faces-display and revert all the settings
;; (set-face-foreground 'indent-guide-face "#555556")
;; (set-face-background 'line-number-current-line "#555556")
;; (set-face-foreground 'line-number-current-line "white")
;; (set-face-background 'evil-ex-lazy-highlight "#d79921")

;; ;; (set-face-foreground 'font-lock-function-name-face "#555556")
;; (set-face-foreground 'font-lock-keyword-face "#fb4934")
;; (set-face-foreground 'font-lock-function-name-face "#8ec07c")
;; (set-face-foreground 'font-lock-negation-char-face "#d3869b")
;; (set-face-foreground 'font-lock-preprocessor-face "#d3869b")
;; (set-face-foreground 'font-lock-regexp-grouping-backslash "#d3869b")
;; (set-face-foreground 'font-lock-regexp-grouping-construct "#d3869b")
;; (set-face-foreground 'font-lock-type-face "#83a598")
;; (set-face-foreground 'highlight-quoted-symbol "#83a598")

;; (set-face-foreground 'highlight-quoted-symbol "#83a598")

(set-frame-parameter (selected-frame) 'alpha '(90))
(add-to-list 'default-frame-alist '(alpha . (90)))
