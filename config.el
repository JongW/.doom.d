;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(require 'company)
(setq company-idle-delay 0
      company-minimum-prefix-length 1)

(setq doom-font (font-spec :family "Iosevka Term" :size 18))

;; (setq-default display-line-numbers 'relative)
;; (setq display-line-numbers "relative")

(setq-default display-line-numbers 'visual
              display-line-numbers-widen t
              ;; this is the default
              display-line-numbers-current-absolute t)

(defun noct:relative ()
  (setq-local display-line-numbers 'visual))

(defun noct:absolute ()
  (setq-local display-line-numbers t))

(add-hook 'evil-insert-state-entry-hook #'noct:absolute)
(add-hook 'evil-insert-state-exit-hook #'noct:relative)

;; example of customizing colors
;; (custom-set-faces '(line-number-current-line ((t :weight bold
;;                                                  :foreground "goldenrod"
;;                                                  :background "slate gray"))))

(set-frame-parameter (selected-frame) 'alpha '(90))
(add-to-list 'default-frame-alist '(alpha . (90)))

(global-set-key (kbd "H-h") (kbd"<left>"))
(global-set-key (kbd "H-j") (kbd"<down>"))
(global-set-key (kbd "H-k") (kbd"<up>"))
(global-set-key (kbd "H-l") (kbd"<right>"))

(defun vi-open-line-below ()
"Insert a newline below the current line and put point at beginning."
(interactive)
(unless (eolp)
(end-of-line))
(newline-and-indent))

(defun vi-open-line-above ()
"Insert a newline above the current line and put point at beginning."
(interactive)
(unless (bolp)
(beginning-of-line))
(newline)
(forward-line -1)
(indent-according-to-mode))

;; (defun my-center-line (&rest _)
;;   (evil-scroll-line-to-center nil))

;; (advice-add 'evil-search-next :after #'my-center-line)

(define-key evil-normal-state-map (kbd "o") 'vi-open-line-below)
(define-key evil-normal-state-map (kbd "O") 'vi-open-line-above)

(load! "+bindings_custom")
