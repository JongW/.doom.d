;;; ~/.doom.d/+theme.el -*- lexical-binding: t; -*-

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 1)
        company-global-modes '(not org-mode))

(setq doom-font (font-spec :family "Iosevka Term" :size 35))
;; (setq doom-font (font-spec :family "Iosevka Term" :size 18))

(setq-default display-line-numbers-type 'relative)
(custom-set-faces '(line-number-current-line ((t :weight bold
                                                 :foreground "#fabd2f"
                                                 :background "slate gray"))))

(set-frame-parameter (selected-frame) 'alpha '(90))
(add-to-list 'default-frame-alist '(alpha . (90)))

(require 'doom-themes)

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
;; (load-theme 'doom-opera t)
;; (load-theme 'doom-vibrant t)
;; (load-theme 'doom-dracula t)
;; (load-theme 'doom-spacegrey t)
;; (load-theme 'doom-tomorrow-night t)
(load-theme 'doom-molokai t)
;; (load-theme 'doom-city-lights t)
;;
;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
(doom-themes-neotree-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)
