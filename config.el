;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here

(defun my-ivy-switch-buffer (regex-list)
  (let ((ivy-ignore-buffers regex-list))
    (ivy-switch-buffer)))

(defun my-show-only-irc-buffers ()
  (interactive)
  (my-ivy-switch-buffer '("^[^#]")))

(defun my-also-ignore-star-buffers ()
  "ignore everything starting with a star along with whatever ivy's defaults are"
  (interactive)
  (my-ivy-switch-buffer (append ivy-ignore-buffers `("^\*"))))

(doom--define-leader-key :states 'normal "b" 'my-also-ignore-star-buffers)

(defun my-center-line (&rest _)
  (evil-scroll-line-to-center nil))

(advice-add 'evil-ex-search-next :after #'my-center-line)
(advice-add 'evil-ex-search-previous :after #'my-center-line)

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
;; (define-key evil-normal-state-map "d" 'evil-d-into-void)

(define-key evil-insert-state-map (kbd "C-V") 'evil-paste-after-from-clip)

;; (define-key evil-normal-state-map (kbd "o") 'vi-open-line-below)
;; (define-key evil-normal-state-map (kbd "O") 'vi-open-line-above)

;; Shits bugged work around
(define-key evil-normal-state-map "C" 'evil-change)

(general-define-key  :states 'normal "c" (general-key-dispatch 'evil-c-into-void
                                           "s" 'evil-surround-edit
                                           "S" 'evil-Surround-edit

                                           "w" (general-simulate-key ('evil-c-into-void "iw"))
                                           "W" (general-simulate-key ('evil-c-into-void "iW"))

                                           "\"" (general-simulate-key ('evil-c-into-void "i\""))
                                           "\'" (general-simulate-key ('evil-c-into-void "i\'"))

                                           "\(" (general-simulate-key ('evil-c-into-void "i\("))
                                           "\)" (general-simulate-key ('evil-c-into-void "i\)"))

                                           "{" (general-simulate-key ('evil-c-into-void "i{"))
                                           "}" (general-simulate-key ('evil-c-into-void "i}"))

                                           "\[" (general-simulate-key ('evil-c-into-void "i\]"))
                                           "\]" (general-simulate-key ('evil-c-into-void "i\["))

                                           "<" (general-simulate-key ('evil-c-into-void "i<"))
                                           ">" (general-simulate-key ('evil-c-into-void "i>"))
                   ))

;; (general-vmap "c" 'evil-change)

(defun simulate-key-press (key)
  "Pretend that KEY was pressed.
KEY must be given in `kbd' notation."
  `(lambda () (interactive)
     (setq prefix-arg current-prefix-arg)
     (setq unread-command-events (listify-key-sequence (read-kbd-macro ,key)))))

(doom--define-leader-key :states 'normal "o" (simulate-key-press "C-c"))
;; (global-set-key (kbd "C-x C-x") (simulate-key-press "C-c"))

(load! "+theme.el")
(load! "+bindings.el")
