;;; ~/.doom.d/+clipboard.el -*- lexical-binding: t; -*-

(defun evil-paste-after-from-0 ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-paste-after)))

(defun evil-paste-after-from-clip ()
  (interactive)
  (let ((evil-this-register ?+))
    (call-interactively 'evil-paste-after)))

(defun evil-x-as-cut ()
  (interactive)
  (let ((evil-this-register ?0))
    (call-interactively 'evil-delete-char)))

(defun evil-c-into-void()
  (interactive)
  (let ((evil-this-register ?_))
    (call-interactively 'evil-change)))

(defun evil-d-into-void()
  (interactive)
  (let ((evil-this-register ?_))
    (call-interactively 'evil-delete)))

(define-key evil-normal-state-map "p" 'evil-paste-after-from-0)
(define-key evil-normal-state-map "x" 'evil-x-as-cut)
(define-key evil-normal-state-map "d" 'evil-d-into-void)

(define-key evil-insert-state-map (kbd "C-V") 'evil-paste-after-from-clip)

;; Shits bugged work around
(define-key evil-normal-state-map "C" 'evil-change)
