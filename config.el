;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here
(defun my-center-line (&rest _)
  (evil-scroll-line-to-center nil))

(advice-add 'evil-ex-search-next :after #'my-center-line)
(advice-add 'evil-ex-search-previous :after #'my-center-line)

;; Changing evil change mode
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

(defun simulate-key-press (key)
  "Pretend that KEY was pressed.
KEY must be given in `kbd' notation."
  `(lambda () (interactive)
     (setq prefix-arg current-prefix-arg)
     (setq unread-command-events (listify-key-sequence (read-kbd-macro ,key)))))

(doom--define-leader-key :states 'normal "o" (simulate-key-press "C-c"))

;; (defun simulate-key-press (key) ('simulate-key-press-lambda key))

;; (defun simulate-key-press-lambda (key)
;;   (interactive)
;;      (setq prefix-arg current-prefix-arg)
;;      (setq unread-command-events (listify-key-sequence (read-kbd-macro ,key))))

;; (doom--define-leader-key :states 'normal "o" (simulate-key-press "C-c"))

(vimish-fold-global-mode 1)

(after! lsp-ui
  (setq lsp-ui-doc-max-height 95))

;; Auto start lsp for python files
(add-hook 'python-mode-hook #'lsp)

(load! "+clipboard.el")
(load! "+theme.el")
(load! "+bindings.el")
