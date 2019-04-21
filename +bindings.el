;;; ~/.doom.d/+bindings_custom2.el -*- lexical-binding: t; -*-

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

(map!
 :nmvo doom-leader-key nil
 :nmvo doom-localleader-key nil

 ;; --- Global keybindings ---------------------------
 ;; A little sandbox to run code in
 :gnvime "M-;" #'eval-expression
 :gnvime "M-:" #'doom/open-scratch-buffer

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
 :nvimo "0" #'evil-first-non-blank
 :nvimo "H" #'evil-first-non-blank
 :nvimo "L" #'evil-end-of-line
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

  ;; Buffer management
   :n "[" #'previous-buffer
   :n "]" #'next-buffer
   :n "d" #'kill-this-buffer
   :n "D" #'doom/kill-other-buffers
  
   :n "q" #'delete-window
   :n "w" #'save-buffer

   :n "P" #'find-file
   :n "p" #'project-find-file
   :n "e" #'neotree-toggle

   :n "r" #'evil-show-registers
   :n "/" #'evil-ex-nohighlight

   :n "a" #'org-agenda
   :n "c" #'evil-commentary

   :gnvime "x" #'execute-extended-command

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

   (:desc "workspace" :prefix "TAB"
     :desc "Display tab bar"          :n "TAB" #'+workspace/display
     :desc "New workspace"            :n "n"   #'+workspace/new
     :desc "Load workspace from file" :n "l"   #'+workspace/load
     :desc "Switch workspace"         :n "."   #'+workspace/switch-to

     :desc "Kill all buffers"         :n "x"   #'doom/kill-all-buffers
     :desc "Delete session"           :n "X"   #'+workspace/kill-session

     :desc "Delete this workspace"    :n "d"   #'+workspace/delete

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

   (:desc "Extra commands" :prefix "z"
     :desc "Private config" :n "p" #'doom/open-private-config
     :desc "Sudo this file" :n "s" #'doom/sudo-this-file
     :desc "Restart and restore"  :n "r" #'doom/restart-and-restore)


   )

 ;; ivy
 ;; Need this to use escape to close stuff
 (:after ivy
   :map ivy-minibuffer-map
   [escape] #'keyboard-escape-quit
   )

 (:after magit
   :map magit-blame-mode-map
   :n "q" #'magit-blame-quit)

 ;; neotree
 (:after neotree
   :map neotree-mode-map
   :n "g"         nil
   :n [tab]       #'neotree-quick-look
   :n "RET"       #'neotree-enter
   :n [backspace] #'evil-window-prev
   :n "c"         #'neotree-create-node
   :n "j"         #'neotree-next-line
   :n "k"         #'neotree-previous-line
   :n "n"         #'neotree-next-line
   :n "p"         #'neotree-previous-line
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
   :n "R"         #'neotree-refresh)

 ;; company
 :i "C-SPC"    #'+company/complete
 (:after company
   :map company-active-map
   [tab]         #'company-complete-common-or-cycle
   "H-j"         #'company-select-next
   "H-k"         #'company-select-previous
   "C-l"         #'company-next-page
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
