;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
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
(defun evil-paste-after-from-0 ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-paste-after)))

(defun evil-x-as-cut ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-delete-char)))

(define-key evil-normal-state-map "p" 'evil-paste-after-from-0)
(define-key evil-normal-state-map "x" 'evil-x-as-cut)

(define-key evil-normal-state-map (kbd "o") 'vi-open-line-below)
(define-key evil-normal-state-map (kbd "O") 'vi-open-line-above)

(load! "+theme.el")
(load! "+bindings_custom2")
