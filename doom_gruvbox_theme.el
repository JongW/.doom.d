;; doom-gruvbox-theme.el --- inspired by Textmate's monokai
(require 'doom-themes)

;;
(defgroup doom-gruvbox-theme nil
  "Options for doom-gruvbox."
  :group 'doom-themes)

(defcustom doom-gruvbox-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-gruvbox-theme
  :type 'boolean)

(defcustom doom-gruvbox-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line. Can be an integer to
determine the exact padding."
  :group 'doom-gruvbox-theme
  :type '(or integer boolean))

;;
(def-doom-theme doom-gruvbox
  "A dark, vibrant theme inspired by Textmate's monokai."

  ;; name        gui       256       16
  ((bg         '("#282828" nil       nil          ))
   (bg-alt     '("#282828" nil       nil          ))
   (accent     '("#504945" nil       nil          ))
   (base0      '("#1B2229" "black"   "black"      ))
   (base1      '("#151617" "#101010" "brightblack"))
   (base2      '("#1d1f20" "#191919" "brightblack"))
   (base3      '("#2d2e2e" "#252525" "brightblack"))
   (base4      '("#4e4e4e" "#454545" "brightblack"))
   (base5      '("#555556" "#6b6b6b" "brightblack"))
   (base6      '("#767679" "#7b7b7b" "brightblack"))
   (base7      '("#cfc0c5" "#c1c1c1" "brightblack"))
   (base8      '("#ffffff" "#ffffff" "brightwhite"))
   (fg         '("#ebdbb2" "#dfdfdf" "brightwhite"))
   (fg-alt    '("#928374" "#dfdfdf" "brightwhite"))

   (grey       '("#555556" "#515154" "brightblack"))
   (red        '("#fb4934" "#e74c3c" "red"))
   (orange     '("#fe8019" "#fd971f" "brightred"))
   (green      '("#8ec07c" "#b6e63e" "green"))
   (teal       green)
   (olive     '("#b8bb26" nil       nil          ))
   (yellow     '("#fabd2f" "#e2c770" "yellow"))
   (blue       '("#268bd2" "#2686D6" "brightblue"))
   (dark-blue  '("#727280" "#727280" "blue"))
   (magenta    '("#fb2874" "#fb2874" "magenta"))
   (violet     '("#d3869b" "#9c91e4" "brightmagenta"))
   (cyan       '("#83a598" "#66d9ef" "brightcyan"))
   (dark-cyan  '("#458588" "#8FA1B3" "cyan"))

   ;; face categories
   (highlight      orange)
   (vertical-bar   grey)
   (selection      accent)
   (builtin        orange)

  ;;TODO change gruvbox brighter comments colors
   (comments       (if doom-gruvbox-brighter-comments violet (doom-lighten fg-alt 0.25)))
   (doc-comments   (if doom-gruvbox-brighter-comments (doom-lighten violet 0.1) (doom-lighten fg-alt 0.25)))

   (constants      yellow)
   (functions      green)
   (keywords       red)
   (methods        green)
   (operators      cyan)

   (type           green)

   (strings        olive)
   (variables      fg)

   (numbers        violet)
   (region         base4)
   (error          red)
   (warning        yellow)

   (success        green)
   (vc-modified    base4)
   (vc-added       (doom-darken green 0.15))
   (vc-deleted     red)

   ;; custom categories
   (-modeline-pad
    (when doom-gruvbox-padded-modeline
      (if (integerp doom-gruvbox-padded-modeline)
          doom-gruvbox-padded-modeline
        4)))

   (org-quote `(,(doom-lighten (car bg) 0.05) "#1f1f1f")))


  ;; --- extra faces ------------------------
  ((lazy-highlight :background yellow :foreground base0 :distant-foreground base0 :bold bold)
   (cursor :background "white")

   (hl-line :background nil)
   (indent-guide-face :foreground grey)
   (line-number-current-line :background grey :foreground "white")

  ;; doom modeline
   (mode-line
    :background accent :foreground (doom-lighten fg-alt 0.2)
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color base3)))

   (mode-line-inactive
    :background (doom-darken bg 0.2) :foreground base4
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color base2)))

   (doom-modeline-bar :background green)
   (doom-modeline-buffer-modified :inherit 'bold :foreground fg)
   (doom-modeline-buffer-path :inherit 'bold :foreground (doom-lighten fg-alt 0.2))
   (doom-modeline-project-dir :bold t :foreground (doom-lighten fg-alt 0.2))
   (doom-modeline-buffer-major-mode :foreground yellow :bold t)
   (doom-modeline-info :bold t :foreground orange)

   ((line-number &override) :foreground base5 :distant-foreground nil)
   ((line-number-current-line &override) :foreground base7 :distant-foreground nil)

   (isearch :foreground base0 :background yellow)

   ;; ediff
   (ediff-fine-diff-A :background (doom-blend red bg 0.3) :weight 'bold)

   ;; evil-mode
   (evil-search-highlight-persist-highlight-face :background orange)

   ;; evil-snipe
   (evil-snipe-first-match-face :foreground base0 :background yellow)
   (evil-snipe-matches-face     :foreground yellow :bold t :underline t)

   ;; flycheck
   (flycheck-error   :underline `(:style wave :color ,red)    :background base3)
   (flycheck-warning :underline `(:style wave :color ,yellow) :background base3)
   (flycheck-info    :underline `(:style wave :color ,green)  :background base3)

   ;; helm
   (helm-swoop-target-line-face :foreground magenta :inverse-video t)

   ;; ivy
   (ivy-current-match :background accent)
   (ivy-minibuffer-match-face-1 :background base1 :foreground base4)
   (ivy-minibuffer-match-face-2 :background nil :foreground red)

   ;; neotree
   (neo-dir-link-face   :foreground cyan)
   (neo-expand-btn-face :foreground magenta)
   (neo-root-dir-face :foreground yellow )

   ;; rainbow-delimiters
   (rainbow-delimiters-depth-1-face :foreground red)
   (rainbow-delimiters-depth-2-face :foreground orange)
   (rainbow-delimiters-depth-3-face :foreground green)
   (rainbow-delimiters-depth-4-face :foreground cyan)
   (rainbow-delimiters-depth-5-face :foreground red)
   (rainbow-delimiters-depth-6-face :foreground orange)
   (rainbow-delimiters-depth-7-face :foreground green)

   ;; (solaire-mode-line-face
   ;;  :background yellow)

   ;; (solaire-mode-line-inactive-face
   ;;  :background orange)

   (solaire-default-face :background bg)
   (solaire-minibuffer-face :background (doom-darken bg 0.15))

   ;; --- major-mode faces -------------------
   ;; css-mode / scss-mode
   (css-proprietary-property :foreground keywords)

  ;; TODO later
   ;; markdown-mode
   (markdown-blockquote-face :inherit 'italic :foreground dark-blue)
   (markdown-list-face :foreground magenta)
   (markdown-pre-face  :foreground cyan)
   (markdown-link-face :inherit 'bold :foreground blue)
   (markdown-code-face :background (doom-lighten base2 0.045))

   ;; org-mode
   (org-level-1 :foreground yellow :bold bold :height 1.2)
   (org-level-2 :inherit 'org-level-1 :foreground cyan)
   (org-level-3 :bold bold :foreground green)
   (org-level-4 :inherit 'org-level-3)
   (org-level-5 :inherit 'org-level-3)
   (org-level-6 :inherit 'org-level-3)
   (org-ellipsis :underline nil :background base2 :foreground orange)
   (org-tag :foreground yellow :bold nil)
   (org-quote :inherit 'italic :foreground base7 :background org-quote)
   (org-todo :foreground yellow :bold 'inherit)
   (org-list-dt :foreground yellow))


  ;; --- extra variables --------------------
  ;; ()
  )

;;; doom-gruvbox-theme.el ends here
