;; -*- no-byte-compile: t;; -*-
;;; ~/.doom.d/packages.el

;;; Examples:
;; (package! some-package)
(package! general :recipe (:fetcher github :repo "noctuid/general.el"))
(package! emacs-doom-themes :recipe (:fetcher github :repo "hlissner/emacs-doom-themes"))
(package! doom-modeline :recipe (:fetcher github :repo "seagle0128/doom-modeline"))
(package! key-chord :recipe (:fetcher github :repo "emacsorphanage/key-chord"))
(package! origami)

;; Packages to disable
(package! ace-window :disable t)
(package! tide :disable t)
(package! graphql-mode :disable t)
(package! dhall-mode :disable t)
(package! ivy-hydra :disable t)
(package! amx :disable t)


'+fold/toggle
