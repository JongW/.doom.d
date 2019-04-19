;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 1)

(setq doom-font (font-spec :family "Iosevka Term" :size 18))

(setq display-line-numbers 'relative)

(set-frame-parameter (selected-frame) 'alpha '(90))
(add-to-list 'default-frame-alist '(alpha . (90)))

(global-set-key (kbd "H-h") (kbd"<left>"))
(global-set-key (kbd "H-j") (kbd"<down>"))
(global-set-key (kbd "H-k") (kbd"<up>"))
(global-set-key (kbd "H-l") (kbd"<right>"))

(evil-define-key evil-normal-state-map (kbd "o") 'evil-insert-line)
