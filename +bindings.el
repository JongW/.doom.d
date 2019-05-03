;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

;; Custom functions
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

(defun vi-open-line-below ()
  "Insert a newline below the current line and put point at beginning."
  (interactive)
  (unless (eolp)
    (end-of-line))
  (newline-and-indent))

(defun vi-open-line-above ()
  "Insert a newline above the current line and put point at beginning."
  (interactive)
  (unless (bolp)
    (beginning-of-line))
  (newline)
  (forward-line -1)
 (indent-according-to-mode))


(defun yas-complete-or-company ()
  (interactive)
  (if (yas-maybe-expand-abbrev-key-filter 'yas-expand)
      (yas-expand)
    (company-yasnippet 'interactive)))

(defun company-yas-complete-or-company ()
  (interactive)
  (if (yas-maybe-expand-abbrev-key-filter 'yas-expand)
      (yas-expand)
    (company-abort)
    (company-yasnippet 'interactive)
    )
  )

(defun simulate-key-press (key)
  "Pretend that KEY was pressed.
KEY must be given in `kbd' notation."
  `(lambda () (interactive)
     (setq prefix-arg current-prefix-arg)
     (setq unread-command-events (listify-key-sequence (read-kbd-macro ,key)))))

(map!

 :nmvo doom-leader-key nil
 :nmvo doom-localleader-key nil

 ;; --- Global keybindings ---------------------------
 ;; A little sandbox to run code in
 :gnvime "M-:" #'doom/open-scratch-buffer

 :i "C-SPC"    #'+company/complete
 :i "C-s" 'yas-complete-or-company

 :n [tab] (general-predicate-dispatch nil
            (and (featurep! :editor fold)
                 (save-excursion (end-of-line) (invisible-p (point))))
            '+fold/toggle
            (fboundp 'evilmi-jump-items)
            'evilmi-jump-items)

 :v [tab] (general-predicate-dispatch nil
            (and (bound-and-true-p yas-minor-mode)
                 (or (eq evil-visual-selection 'line)
                     (and (fboundp 'evilmi-jump-items)
                          (save-excursion
                            (/= (point)
                                (progn (evilmi-jump-items nil)
                                       (point)))))))
            'yas-insert-snippet
            (fboundp 'evilmi-jump-items)
            'evilmi-jump-items)

 :i [remap newline] #'newline-and-indent  ; auto-indent on newline

 :gnvime (kbd "H-h") (kbd "<left>")
 :gnvime (kbd "H-j") (kbd "<down>")
 :gnvime (kbd "H-k") (kbd "<up>")
 :gnvime (kbd "H-l") (kbd "<right>")

 ;; Text-scaling
 "M-+"    (λ! (text-scale-set 0))
 "M-="    #'text-scale-increase
 "M--"    #'text-scale-decrease

 ;; Vim key bindings
 :n "o" 'vi-open-line-below
 :n "O" 'vi-open-line-above
 :v  "<"     #'+evil/visual-dedent  ; vnoremap < <gv
 :v  ">"     #'+evil/visual-indent  ; vnoremap > >gv

 :nvmo "0" #'evil-first-non-blank
 :nvmo "H" #'evil-first-non-blank
 :nvmo "L" #'evil-end-of-line

 :n "<up>" #'evil-scroll-line-up
 :n "<down>" #'evil-scroll-line-down

 :n "-" #'ranger

 (:leader
   ;; Window management
   :n  "h"   #'evil-window-left
   :n  "j"   #'evil-window-down
   :n  "k"   #'evil-window-up
   :n  "l"   #'evil-window-right
   :desc "Horizonal Split"        :n  "s"   #'split-window-below
   :desc "Vertical Split"         :n  "v"   #'evil-window-vsplit
     
   :desc "Increase H Size"        :n  "<right>"   (lambda! (evil-window-increase-width 10))
   :desc "Dercrease H Size"        :n  "<left>"   (lambda! (evil-window-decrease-width 10))

   :desc "Increase V Size"        :n  "<up>"   (lambda! (evil-window-increase-height 10))
   :desc "Dercrease V Size"        :n  "<down>"   (lambda! (evil-window-decrease-height 10))

   ;; Buffer management
   :n "[" #'previous-buffer
   :n "]" #'next-buffer

   :n "d" #'+lookup/documentation
   :n "D" #'doom/kill-other-buffers

   :n "m" #'doom/window-maximize-buffer
   :n "n" #'+popup/toggle

   :n "b" #'my-also-ignore-star-buffers

   :n "q" #'delete-window
   :n "w" #'save-buffer

   :n "P" #'counsel-find-file
   :n "p" #'+ivy/projectile-find-file
   :n "e" #'neotree-toggle

   :n "r" #'evil-show-registers
   :n "/" #'evil-ex-nohighlight

   :n "a" #'org-agenda
   :n "c" #'evil-commentary

   :gnvime "x" #'execute-extended-command

   :gnvime ";" #'eval-expression

   :desc "Terminal"            :n  "t" #'+term/open-popup
   :desc "Terminal in project" :n  "T" #'+term/open-popup-in-project

   :desc "Ivy open ALL buffers"  :n  "B"   #'ivy-switch-buffer
   :desc "Silver searcher"      :n  "f"   #'counsel-projectile-ag
   :desc "Find project"           :n  "."   #'projectile-switch-project

   (:prefix("g" . "git")
     :desc "Git status"        :n  "s" #'magit-status
     :desc "Git blame"         :n  "b" #'magit-blame
     :desc "Git timemachine branch" :n  "B" #'git-timemachine-switch-branch
     :desc "Git time machine"  :n  "t" #'git-timemachine-toggle
     :desc "Git revert hunk"   :n  "r" #'git-gutter:revert-hunk
     :desc "List gists"        :n  "g" #'+gist:list
     :desc "Next hunk"         :nv "]" #'git-gutter:next-hunk
     :desc "Previous hunk"     :nv "[" #'git-gutter:previous-hunk)

   (:prefix("TAB" . "workspace")
     :desc "Display tab bar"          :n "TAB" #'+workspace/display
     :desc "New workspace"            :n "n"   #'+workspace/new
     :desc "Load workspace from file" :n "l"   #'+workspace/load
     :desc "Switch workspace"         :n "."   #'+workspace/switch-to

     :desc "Kill all buffers"         :n "x"   #'doom/kill-all-buffers
     :desc "Delete session"           :n "X"   #'+workspace/kill-session

     :desc "Delete this workspace"    :n "d"   #'+workspace/delete
     :desc "Save workspace"           :n "s"   #'+workspace/save
     :desc "Next workspace"           :n "]"   #'+workspace/switch-right
     :desc "Previous workspace"       :n "["   #'+workspace/switch-left
     :desc "Rename workspace"         :n "r"   #'+workspace:rename

     :desc "Switch to 1st workspace"  :n "1"   (λ! (+workspace/switch-to 0))
     :desc "Switch to 2nd workspace"  :n "2"   (λ! (+workspace/switch-to 1))
     :desc "Switch to 3rd workspace"  :n "3"   (λ! (+workspace/switch-to 2))
     :desc "Switch to 4th workspace"  :n "4"   (λ! (+workspace/switch-to 3))
     :desc "Switch to 5th workspace"  :n "5"   (λ! (+workspace/switch-to 4))
     :desc "Switch to 6th workspace"  :n "6"   (λ! (+workspace/switch-to 5))
     :desc "Switch to 7th workspace"  :n "7"   (λ! (+workspace/switch-to 6))
     :desc "Switch to 8th workspace"  :n "8"   (λ! (+workspace/switch-to 7))
     :desc "Switch to 9th workspace"  :n "9"   (λ! (+workspace/switch-to 8)))

   (:prefix("z" . "Extra commands")
     :desc "Private config" :n "p" #'doom/open-private-config
     :desc "New window"  :n "n" #'make-frame
     :desc "Sudo this file" :n "s" #'doom/sudo-this-file
     :desc "Restart and restore"  :n "r" #'doom/restart-and-restore
     :desc "Insert snippets"  :n "s" #'yas-insert-snippet
     :desc "Reload theme"  :n "l" #'doom/reload-theme
     :desc "Neotree dir"  :n "e" #'neotree-dir
     :desc "Format code" :n "t" #'+format/buffer)

   )

 ;; ivy
 ;; Need this to use escape to close stuff
 (:after ivy
   :map ivy-minibuffer-map
   [escape] #'keyboard-escape-quit
   )

 (:after magit
   :map magit-blame-mode-map
   :n "q" #'magit-blame-quit
  
   :map with-editor-mode-map
   :n "q" #'with-editor-finish)

 ;; neotree
 (:after neotree
   :map neotree-mode-map
   :n "g"         nil
   :n [tab]       #'neotree-quick-look
   :n "RET"       #'neotree-enter
   :n [backspace] #'evil-window-prev

   :n "n"         #'neotree-create-node

   :n "j"         #'neotree-next-line
   :n "k"         #'neotree-previous-line
   :n "h"         #'+neotree/collapse-or-up
   :n "l"         #'+neotree/expand-or-open
   :n "J"         #'neotree-select-next-sibling-node
   :n "K"         #'neotree-select-previous-sibling-node
   :n "H"         #'neotree-select-up-node
   :n "L"         #'neotree-select-down-node

   :n "G"         #'evil-goto-line
   :n "gg"        #'evil-goto-first-line

   :n "v"         #'neotree-enter-vertical-split
   :n "s"         #'neotree-enter-horizontal-split

   :n "q"         #'neotree-hide
   :n "r"         #'neotree-refresh)

 ;; company
 (:after company
   :map company-active-map
   [tab]         #'company-complete-common-or-cycle
   ;; "C-q"      #'company-abort
   [escape]      #'company-abort
   "H-j"         #'company-select-next
   "H-k"         #'company-select-previous
   "C-l"         #'company-next-page
   "C-t"     (λ! (company-abort) (company-yasnippet 'interactive))
   "C-s"         'company-yas-complete-or-company
   "C-h"         #'company-previous-page
   "C-d"         #'company-show-doc-buffer
   )

 (:after org
   :map org-mode-map
   :n "M-h" #'org-metaleft
   :n "M-l" #'org-metaright
   :n "M-k" #'org-metaup
   :n "M-j" #'org-metadown

   ;; Tidy up whick-key and replace commands
   "C-c C-d" nil
   "C-c d" #'org-deadline
   "C-c C-t" nil
   "C-c t" #'org-todo
   "C-c C-n" nil

   ;; Just tidy up commands
   "C-c C-^" nil ;; org-up-element
   "C-c C-_" nil ;; org-down element
   "C-c C->" nil ;; org-outline-promote
   "C-c C-<" nil ;; org-outline-demote

   :n "\{" #'org-next-visible-heading
   :n "\}" #'org-previous-visible-heading

   :n "M-<left>" #'org-promote-subtree
   :n "M-<right>" #'org-demote-subtree

   :map evil-org-mode-map
   :n "o" #'vi-open-line-below
   :n "O" #'vi-open-line-above
   )
 )

;; This section is dedicated to "fixing" certain keys so that they behave
;; properly, more like vim. Ripped directly from hlissner
(map! (:map input-decode-map
        [?\C-i] [C-i]
        [S-iso-lefttab] [backtab]
        (:unless window-system "TAB" [tab])) ; Fix TAB in terminal

      ;; Make ESC quit all the things
      (:map (minibuffer-local-map
             minibuffer-local-ns-map
             minibuffer-local-completion-map
             minibuffer-local-must-match-map
             minibuffer-local-isearch-map)
        [escape] #'abort-recursive-edit
        "C-r" #'evil-paste-from-register)

      (:after view
        (:map view-mode-map "<escape>" #'View-quit-all)))

(doom--define-leader-key :states 'normal "o" (simulate-key-press "C-c"))

;; Center serach results w/ evil
(defun my-center-line (&rest _)
  (evil-scroll-line-to-center nil))

(advice-add 'evil-ex-search-next :after #'my-center-line)
(advice-add 'evil-ex-search-previous :after #'my-center-line)

;; Make jk even more global!
(after! ivy
  (key-chord-define ivy-minibuffer-map "jk" #'keyboard-escape-quit))
