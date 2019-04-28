;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here
(require 'key-chord)
(setq key-chord-two-keys-delay 0.1)
(key-chord-mode 1)

(require 'indent-guide)
(indent-guide-global-mode)

(load! "+theme.el")
(load! "+lang.el")
(load! "+misc.el")
(load! "+clipboard.el")
(load! "+bindings.el")
