;;; Global key bindigns

;; (global-set-key "\C-h" 'delete-backward-char)

(global-unset-key (kbd "M-l")) ;; downcase-word

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

;; (global-set-key [f1] 'query-replace)
;; (global-set-key [f1] 'yas/expand)
;; (global-set-key [f1] 'hippie-expand)
(global-set-key [f1] 'kmacro-start-macro-or-insert-counter)
(global-set-key [(shift f1)] 'kmacro-end-or-call-macro)

(global-set-key (kbd "<C-f3>") 'persp-switch)

(defun switch-to-previous-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))
;; (global-set-key (kbd "<f3>") 'switch-to-previous-buffer)

;; (global-set-key [f3] 'dabbrev-expand)


;; (global-set-key [f4] 'query-replace)
;; (global-set-key [f4] 'replace-in-buffer)
;; (global-set-key [f4] 're-builder)
;; (global-set-key [f5] 'magit-grep)
;; (global-set-key [f6] 'magit-status)
(global-set-key [f7] 'magit-run-gitk)
(global-set-key [f8] 'open-file-at-cursor)
(global-set-key (kbd "<S-f9>") 'my-compile)
(global-set-key (kbd "<f9>") 'quickrun)
(global-set-key [f10] 'toggle-frame-fullscreen)
(global-set-key [f11] 'helm-mini)
;; (global-set-key [f11] 'recentf-ido-find-file)
(global-set-key [S-f11] 'recentf-ido-find-dir)

(global-set-key (kbd "<C-return>") 'other-window)

(global-set-key (kbd "C-c t") 'visit-term-buffer)

;; TOGGLE MENU BAR
(global-set-key (kbd "C-%") 'menu-bar-mode)

(global-set-key (kbd "M-p") 'ace-window)

(global-set-key (kbd "M-P") 'pin-buffer)

;; (global-set-key (kbd "M-x") 'helm-M-x) ;; i don't like this
(global-set-key (kbd "M-x") (lambda () (interactive) (counsel-M-x "")))
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-q") 'quoted-insert)

;; hungry-delete
;; (global-set-key (kbd "M-<backspace>") #'hungry-delete-backward)

;;key-chords
;; (with-eval-after-load 'key-chord
;;   (key-chord-define-global "fg" 'iy-go-to-char))
;; (key-chord-define-global "df" 'iy-go-to-char-backward)

;; from better-defaults
(global-set-key (kbd "M-/") 'hippie-expand)
;; (global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)



;; TODO check if those key-bindings have already been added upstream
(define-key isearch-mode-map (kbd "M-<") 'isearch-beginning-of-buffer)
(define-key isearch-mode-map (kbd "M->") 'isearch-end-of-buffer)
;; TODO add more keybindings to isearch-mode-map, scrolling commands, ...



(defun my-c-mode-common-hook ()
  (define-key c-mode-base-map (kbd "M-o") 'eassist-switch-h-cpp)
  (define-key c-mode-base-map (kbd "M-m") 'eassist-list-methods))
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;; (defun my-python-mode-hook ()
;;   (define-key python-mode-map (kbd "M-m") 'eassist-list-methods))
;; (add-hook 'python-mode-hook 'my-python-mode-hook)

(define-key lisp-mode-shared-map (kbd "M-m") 'eassist-list-methods)

;; real Emacs hackers don't use the arrow keys
;; (global-set-key (kbd "<up>") (lambda ()
;;                                (interactive)
;;                                (message "Arrow key navigation is disabled. Use k instead.")))
;; (global-set-key (kbd "<down>") (lambda ()
;;                                  (interactive)
;;                                  (message "Arrow key navigation is disabled. Use j instead.")))
;; (global-set-key (kbd "<left>") (lambda ()
;;                                  (interactive)
;;                                  (message "Arrow key navigation is disabled. Use h instead.")))
;; (global-set-key (kbd "<right>") (lambda ()
;;                                   (interactive)
;;                                   (message "Arrow key navigation is disabled. Use l instead.")))


;; Map the window manipulation keys to meta 0, 1, 2, o
;; (global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
;; (global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
;; (global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
;; (global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
;; (global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap

;; Replace dired's M-o
;; (add-hook 'dired-mode-hook
;;           (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode

;; ;; Replace ibuffer's M-o
;; (add-hook 'ibuffer-mode-hook
;;           (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window

;; To help Unlearn C-x 0, 1, 2, o
;; (global-unset-key (kbd "C-x 3")) ; was split-window-horizontally
;; (global-unset-key (kbd "C-x 2")) ; was split-window-vertically
;; (global-unset-key (kbd "C-x 1")) ; was delete-other-windows
;; (global-unset-key (kbd "C-x 0")) ; was delete-window
;; (global-unset-key (kbd "C-x o")) ; was other-window


;;(define-key minibuffer-local-map (kbd "M-p") 'previous-complete-history-element)
;;(define-key minibuffer-local-map (kbd "M-n") 'next-complete-history-element)
(define-key minibuffer-local-map (kbd "<up>") 'previous-complete-history-element)
(define-key minibuffer-local-map (kbd "<down>") 'next-complete-history-element)

(global-set-key (kbd "C-c b") 'revert-buffer)

;; Handy key definitions
(define-key global-map "\M-Q" 'unfill-paragraph)
(define-key global-map "\M-\C-q" 'unfill-region)

;; (with-eval-after-load 're-builder
;;   (progn
;;      (define-key reb-mode-map (kbd "C-c %") 'my-reb-query-replace-regexp)
;;      (define-key reb-mode-map (kbd "C-s") 'reb-next-match)
;;      (define-key reb-mode-map (kbd "C-r") 'reb-prev-match)
;;      ;; C-c C-q -> C-g
;;      (define-key reb-mode-map (kbd "C-g") 'reb-copy-and-quit)))

(with-eval-after-load 'ibuffer
  (progn
     (define-key ibuffer-mode-map
       (vector 'remap 'end-of-buffer) 'ibuffer-jump-to-bottom)
     (define-key ibuffer-mode-map
       (vector 'remap 'beginning-of-buffer) 'ibuffer-back-to-top)))

;; (when (display-graphic-p)
;;   ;; without the display-graphic-p check cursor-up/down don't work in terminal mode
;;   (global-set-key (kbd "M-o") 'smart-open-line)
;;   (global-set-key (kbd "M-O") 'smart-open-line-above))

(global-set-key (kbd "C-c j") 'join-line-vim-style)
(global-set-key "\M-;" 'comment-dwim-line)

(global-set-key (kbd "C-S-d") 'duplicate-line)
(global-set-key (kbd "C-S-j") 'move-line-down)
(global-set-key (kbd "C-S-k") 'move-line-up)

;; vscode bindings:
(global-set-key [(meta shift up)] 'duplicate-line-up)
(global-set-key [(meta shift down)] 'duplicate-line-down)
(global-set-key [(meta up)] 'move-line-up)
(global-set-key [(meta down)] 'move-line-down)

;; TODO C-x o -> next-multiframe-window
;; +The @code{other-window} command will normally only switch to the next
;; +window in the current frame (unless otherwise configured).  If you
;; +work in a multi-frame environment and you want windows in all frames
;; +to be part of the cycle, you can rebind @kbd{C-x o} to the
;; +@code{next-multiframe-window} command.
