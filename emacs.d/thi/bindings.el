;;; Global key bindigns

;; How to Define Keyboard Shortcuts in Emacs
;; http://xahlee.org/emacs/keyboard_shortcuts.html

;; FIXME, this is used for testing purposes only
(global-set-key [f1] 'yas/expand)
(global-set-key [f2] 'hippie-expand)
(global-set-key [f3] 'dabbrev-expand)


(global-set-key [f4] 'query-replace)
(global-set-key [f5] 'git-grep)

(global-set-key (kbd "C-x g") 'magit-status)

;; replace buffermenu with ibuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; smex stuff
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;key-chords
(key-chord-define-global "fg" 'iy-go-to-char)
(key-chord-define-global "df" 'iy-go-to-char-backward)


;; Map the window manipulation keys to meta 0, 1, 2, o
;; (global-set-key (kbd "M-3") 'split-window-horizontally) ; was digit-argument
;; (global-set-key (kbd "M-2") 'split-window-vertically) ; was digit-argument
;; (global-set-key (kbd "M-1") 'delete-other-windows) ; was digit-argument
;; (global-set-key (kbd "M-0") 'delete-window) ; was digit-argument
;; (global-set-key (kbd "M-o") 'other-window) ; was facemenu-keymap

;; Replace dired's M-o
(add-hook 'dired-mode-hook (lambda () (define-key dired-mode-map (kbd "M-o") 'other-window))) ; was dired-omit-mode
;; Replace ibuffer's M-o
(add-hook 'ibuffer-mode-hook (lambda () (define-key ibuffer-mode-map (kbd "M-o") 'other-window))) ; was ibuffer-visit-buffer-1-window

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
