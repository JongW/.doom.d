;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here

(use-package key-chord
  :config
  (setq key-chord-two-keys-delay 0.1)
  (key-chord-mode 1))

(use-package company
  :config
  (setq company-idle-delay 0.3
        company-minimum-prefix-length 1))

;; (use-package eglot
;;   :hook
;;   (python-mode . eglot-ensure))
;; (setq eglot-auto-display-help-buffer nil)
;; (setq eglot-put-doc-in-help-buffer t)


(use-package lsp-mode                          
  :commands lsp
  :hook
  (python-mode . lsp)
  :config
  ;; Disable that pesky document popup on the side
  ;; Use <ldr> + d for documentationl
  (setq lsp-ui-doc-enable nil)
  (setq lsp-pyls-plugins-rope-completion-enabled nil)
  (setq lsp-pyls-plugins-jedi-completion-include-params nil))

(use-package company-lsp
  :config
  (setq company-lsp-enable-snippet nil))

;; Stray hooks and configs
(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
      (set-process-query-on-exit-flag proc nil))))

(add-hook 'term-mode-hook 'set-no-process-query-on-exit)

(add-hook 'org-mode-hook '+org-pretty-mode)

(after! counsel
  (setq counsel-evil-registers-height 300))

(setq python-shell-interpreter "python3")
;; end stray hooks and configs

(load! "+lang.el")
(load! "+theme.el")
(load! "+misc.el")
(load! "+clipboard.el")
(load! "+bindings.el")
