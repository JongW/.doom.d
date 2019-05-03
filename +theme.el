;;; ~/.doom.d/+theme.el -*- lexical-binding: t; -*-

;; (load! "doom_gruvbox_theme.el")
(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

(setq doom-modeline-buffer-state-icon t)

(setq doom-theme 'doom-gruvbox)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(setq doom-font (font-spec :family "Iosevka Term" :size 35))
;; (setq doom-font (font-spec :family "Iosevka Term" :size 20))

(setq all-the-icons-scale-factor 1)

(setq display-line-numbers-type 'relative)

(set-frame-parameter (selected-frame) 'alpha '(90))
(add-to-list 'default-frame-alist '(alpha . (90)))

(setq  org-bullets-bullet-list '(
""
""
""
""
""
""
""
""
""
""
""
""
""
""
))
