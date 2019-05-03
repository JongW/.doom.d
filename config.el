;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here
(require 'key-chord)
(setq key-chord-two-keys-delay 0.1)
(key-chord-mode 1)

(defun set-no-process-query-on-exit ()
  (let ((proc (get-buffer-process (current-buffer))))
    (when (processp proc)
      (set-process-query-on-exit-flag proc nil))))

(add-hook 'term-mode-hook 'set-no-process-query-on-exit)

(load! "+theme.el")
(load! "+lang.el")
(load! "+misc.el")
(load! "+clipboard.el")
(load! "+bindings.el")
