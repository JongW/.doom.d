;;; ~/.doom.d/+theme.el -*- lexical-binding: t; -*-
(require 'company)
(setq company-idle-delay 0
      company-minimum-prefix-length 1)

(setq doom-font (font-spec :family "Iosevka Term" :size 18))

(setq-default display-line-numbers-type 'relative)
(custom-set-faces '(line-number-current-line ((t :weight bold
                                                 :foreground "#fabd2f"
                                                 :background "slate gray"))))

(set-frame-parameter (selected-frame) 'alpha '(90))
(add-to-list 'default-frame-alist '(alpha . (90)))
