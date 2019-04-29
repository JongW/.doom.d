;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-
;; Place your private configuration here
(require 'key-chord)
(setq key-chord-two-keys-delay 0.1)
(key-chord-mode 1)

(require 'indent-guide)
(indent-guide-global-mode)

(require 'solaire-mode)

;; Enable solaire-mode anywhere it can be enabled
(solaire-global-mode +1)
;; To enable solaire-mode unconditionally for certain modes:
(add-hook 'ediff-prepare-buffer-hook #'solaire-mode)

;; ...if you use auto-revert-mode, this prevents solaire-mode from turning
;; itself off every time Emacs reverts the file
(add-hook 'after-revert-hook #'turn-on-solaire-mode)

;; highlight the minibuffer when it is activated:
(add-hook 'minibuffer-setup-hook #'solaire-mode-in-minibuffer)

(load! "+theme.el")
(load! "+lang.el")
(load! "+misc.el")
(load! "+clipboard.el")
(load! "+bindings.el")

(add-hook 'doom-init-theme-hook #'solaire-modeswap-bg t)
