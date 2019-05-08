;;; ~/.doom.d/+lang.el -*- lexical-binding: t; -*-

(require 'company)
(after! company
  (setq company-idle-delay 0
        company-minimum-prefix-length 1))

(set-company-backend! 'org-mode 'company-yasnippet)
;; (set-company-backend! 'python-mode 'company-yasnippet 'company-anaconda 'company-lsp)
;; (set-company-backend! 'company-yasnippet 'company-anaconda 'company-lsp)

(after! lsp-ui
  (setq lsp-ui-doc-max-height 95))

(after! web-mode
  (setq web-mode-enable-engine-detection t))

(defvar python-dotbrackets (make-face 'python-dotbrackets))
(set-face-attribute 'python-dotbrackets nil :foreground "#83a598")

(defvar python-keywords (make-face 'python-keywords))
(set-face-attribute 'python-keywords nil :foreground "blue")


(font-lock-add-keywords 'python-mode '(("\\<\\([a-zA-Z_]*\\) *("(1 'python-dotbrackets))) t)
(font-lock-add-keywords 'python-mode '(("\s*def.*\(\\([a-zA-Z_]*\\)\)"(1 'python-keywords))) t)

(def-project-mode! +web-django-mode
  :modes (web-mode html-mode anaconda-mode css-mode js-mode)
  :files (or "bin/django-admin" "bin/django-admin.py")

  :on-enter
  (when (eq major-mode 'web-mode)
    (web-mode-set-engine "django")))

;; Auto start lsp for python files
(add-hook 'python-mode-hook #'lsp)
