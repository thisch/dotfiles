
(defvar user-cache-file-dir (expand-file-name (concat (or (getenv "XDG_CACHE_HOME") "~/.cache") "/emacs/")))

;; don't clutter dirs with backup files - use this dir instead
;; maybe not useful for files inside dropbox (add exception ?)
(setq backup-by-copying t)
(setq backup-dir-alist '(("." . ,user-cache-file-dir)))
(setq auto-save-list-file-prefix
      (concat user-cache-file-dir ".auto-saves-"))
(setq auto-save-file-name-transforms
      `((".*" ,user-cache-file-dir t)))

;;maybe move into auto-complete local file ?
(setq ac-comphist-file (concat user-cache-file-dir "ac-comphist.dat"))
(setq abbrev-file-name (concat user-cache-file-dir "abbrev_defs"))

;:::::::::::::::::::::::::::::::::::::::::::::::
;: Appearance
;:::::::::::::::::::::::::::::::::::::::::::::::

(setq inhibit-startup-screen t)

;: LINUM
(global-linum-mode 1)
;; linum should be disabled for certain modes where linenumbers do not
;; make sense
;; http://www.emacswiki.org/emacs/LineNumbers
(setq linum-disabled-modes-list '(eshell-mode
                                  org-mode
                                  wl-summary-mode
                                  compilation-mode))
(defun linum-on ()
    (unless (or (minibufferp) (member major-mode linum-disabled-modes-list)
              (string-match "*" (buffer-name))
              )
    (linum-mode 1)))
;;(set-face-foreground 'linum "white")
;;(set-face-background 'linum "black")


;: LINE Highlighting (highlight the current line)
;; (faces are set in color-theme)
;;optional: set a custom face, so we can
;; recognize from the normal marking (selection)
;;(defface hl-line '((t (:background "Gray")))
;;  "Face to use for `hl-line-face'." :group 'hl-line)
;;(setq hl-line-face 'hl-line)
(global-hl-line-mode t) ; turn it on for all modes by default
;; exceptions where hl-line is not desired:
(defun local-hl-line-mode-off ()
  (interactive)
  (make-local-variable 'global-hl-line-mode)
  (setq global-hl-line-mode nil))

(dolist (hook '(org-mode-hook))
  (add-hook hook 'local-hl-line-mode-off))


(setq column-number-mode t)
(tool-bar-mode -1)
(set-scroll-bar-mode nil)

;;default font is now set in .Xdefaults
;;(set-default-font "ProFont-9")


;:::::::::::::::::::::::::::::::::::::::::::::::
;: Logical Behavour
;:::::::::::::::::::::::::::::::::::::::::::::::

;; automatically adds marks
(eval-after-load 'auto-mark
  '(global-auto-mark-mode 1))

;; "y or n" instead of "yes or no"
(fset 'yes-or-no-p 'y-or-n-p)

;; Spaces instead of tabs
(setq-default indent-tabs-mode nil)

;; If there is a tab, make it the size of 2 spaces
(setq-default tab-width 2)

(dolist (hook '(erc-mode-hook
        LaTeX-mode-hook
        org-mode-hook
        edit-server-start-hook
        markdown-mode-hook))
  (add-hook hook (lambda () (variable-pitch-mode t))))

;; Go into proper mode according to file extension
(setq auto-mode-alist
      (append '(("\\.C$"    . c++-mode)
        ("\\.cc$"   . c++-mode)
        ("\\.cpp$"  . c++-mode)
        ("\\.cxx$"  . c++-mode)
        ("\\.hxx$"  . c++-mode)
        ("\\.h$"    . c++-mode)
        ("\\.hh$"   . c++-mode)
        ("\\.idl$"  . c++-mode)
        ("\\.ipp$"  . c++-mode)
        ("\\.c$"    . c-mode)
        ("\\.ma?k\\'" . makefile-mode)
        ("\\(M\\|m\\|GNUm\\)akefile\\(\\.in\\)?" . makefile-mode)
        ("\\.pl$"   . perl-mode)
        ("\\.pm$"   . perl-mode)
        ("\\.java$" . java-mode)
        ("\\.txt$"  . text-mode)
        ("\\.tex$" . latex-mode)
        ("\\.sty$" . latex-mode)
        ("\\.bbl$" . latex-mode)
        ("\\.html$" . html-helper-mode)
        ("\\.el\\'" . emacs-lisp-mode)
        ("\\.texinfo\\'" . texinfo-mode)
        ("\\.texi\\'" . texinfo-mode)
        ("\\.s\\'" . asm-mode)
        ("\\.S\\'" . asm-mode)
        ("\\.asm\\'" . asm-mode)
        ("\\.F90\\'" . f90-mode)
        ("ChangeLog\\'" . change-log-mode)
        ("change\\.log\\'" . change-log-mode)
        ("changelo\\'" . change-log-mode)
        ("ChangeLog\\.[0-9]+\\'" . change-log-mode)
        ("changelog\\'" . change-log-mode)
        ("changelog\\.[0-9]+\\'" . change-log-mode)
        ("\\$CHANGE_LOG\\$\\.TXT" . change-log-mode)
        ("\\.tar\\'" . tar-mode)
        ("\\.\\(arc\\|zip\\|lzh\\|zoo\\|jar\\)\\'" . archive-mode)
        ("\\.\\(ARC\\|ZIP\\|LZH\\|ZOO\\|JAR\\)\\'" . archive-mode)
        ("[]>:/\\]\\..*emacs\\'" . emacs-lisp-mode)
        ("\\`\\..*emacs\\'" . emacs-lisp-mode)
        ("[:/]_emacs\\'" . emacs-lisp-mode)
        ("\\.gp$" . gnuplot-mode)
        )
              auto-mode-alist))

(add-hook 'text-mode-hook 'turn-on-auto-fill)

;; add warning face for certain keywords
(defvar warning-words-regexp
  (regexp-opt '("FIXME" "TODO" "BUG" "XXX" "DEBUG") 'words)
  "Regexp matching words that commonly denote something that
 warrants attention in programs.")

(setq warning-words-font-lock-spec
      (cons warning-words-regexp
            (list
             0 ;; use whole match
             'font-lock-warning-face
             t ;; OVERRIDE
             )))

(font-lock-add-keywords
 'c-mode ;; or nil for current buffer
 (list
  warning-words-font-lock-spec))


;:::::::::::::::::::::::::::::::::::::::::::::::
;: Yank and Paste
;:::::::::::::::::::::::::::::::::::::::::::::::

; http://www.emacswiki.org/emacs/CopyAndPaste
; You need an emacs with bug #902 fixed for this to work properly. It
; has now been fixed in CVS HEAD it makes "highlight/middlebutton"
; style (X11 primary selection based) copy-paste work as expected if
; you're used to other modern apps (that is to say, the mere act of
; highlighting doesn't overwrite the clipboard or alter the kill ring,
; but you can paste in merely highlighted text with the mouse if you
; want to)
(global-set-key [mouse-2] 'mouse-yank-primary)  ; make mouse middle-click only paste from primary X11 selection, not clipboard and kill ring.

;; automatically indent yanked code
;; http://www.emacswiki.org/emacs/AutoIndentation
(dolist (command '(yank yank-pop mouse-yank-primary))
  (eval `(defadvice ,command (after indent-region activate)
           (and (not current-prefix-arg)
                (member major-mode '(emacs-lisp-mode
                                     lisp-mode
                                     clojure-mode
                                     scheme-mode
                                     haskell-mode
                                     ruby-mode
                                     rspec-mode
                                     python-mode
                                     ada-mode
                                     c-mode
                                     c++-mode
                                     java-mode
                                     objc-mode
                                     latex-mode
                                     plain-tex-mode))
                (let ((mark-even-if-inactive transient-mark-mode))
                  (indent-region (region-beginning) (region-end) nil))))))
