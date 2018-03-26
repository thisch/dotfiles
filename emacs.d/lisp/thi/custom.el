(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#373b41"))
 '(blink-cursor-mode nil)
 '(comint-input-ignoredups t)
 '(comint-prompt-read-only t)
 '(cursor-color nil)
 '(custom-safe-themes
   '("408e753da5ce585ad73a0388b50749ef4dcf2b047583fb1378516576e40fa71b" "790e74b900c074ac8f64fa0b610ad05bcfece9be44e8f5340d2d94c1e47538de" "001240593e0c4d5322cbf44da17d5987618809acf22f60c0d22a0dc71971a0f2" "bed4d169698488b8b5b90f7dbdbaca2e7b9c4a18727adbb7b3ddcb4df0577ce0" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "6a37be365d1d95fad2f4d185e51928c789ef7a4ccf17e7ca13ad63a8bf5b922f" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))
 '(elpy-eldoc-show-current-function nil)
 '(elpy-modules
   '(elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-sane-defaults))
 '(evil-mode-line-format 'before)
 '(fci-rule-color "#232A2F")
 '(flycheck-pycheckers-checkers '(pylint pep8))
 '(git-commit-known-pseudo-headers
   '("Signed-off-by" "Acked-by" "Modified-by" "Cc" "Suggested-by" "Reported-by" "Tested-by" "Reviewed-by" "Fixes" "Related" "Change-Id"))
 '(git-commit-mode-hook '(turn-on-auto-fill) t)
 '(global-eldoc-mode nil)
 '(grep-find-ignored-directories
   '("SCCS" "RCS" "CVS" "MCVS" ".src" ".svn" ".git" ".hg" ".bzr" "_MTN" "_darcs" "{arch}" "build"))
 '(ido-auto-merge-delay-time 2.7)
 '(ido-max-window-height 30)
 '(ido-use-faces t)
 '(jedi:get-in-function-call-delay 0.4)
 '(magit-completing-read-function 'magit-ido-completing-read)
 '(magit-status-buffer-switch-function 'switch-to-buffer t)
 '(magit-use-overlays nil)
 '(matlab-indent-level 2)
 '(mode-require-final-newline nil)
 '(notmuch-fcc-dirs "Sent")
 '(notmuch-saved-searches
   '((:name "INBOX (folder)" :query "folder:INBOX" :key "I")
     (:name "inbox" :query "tag:inbox" :key "i")
     (:name "unread" :query "tag:unread" :key "u")
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d")
     (:name "all mail" :query "*" :key "a")))
 '(notmuch-show-logo nil)
 '(org-file-apps
   '((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("pdf" . "evince %s")))
 '(org-log-done nil)
 '(package-archives
   '(("melpa" . "http://melpa.org/packages/")
     ("gnu" . "http://elpa.gnu.org/packages/")
     ("elpy" . "http://jorgenschaefer.github.io/packages/")))
 '(package-selected-packages
   '(posframe panda-theme pos-tip docker-compose-mode flycheck-pycheckers paredit highlight-function-calls emojify magit-gerrit which-key sr-speedbar python-switch-quotes pip-requirements lua-mode ini-mode flx visual-fill-column page-break-lines cython-mode better-shell cython-anaconda picpocket elpy help-mode+ build-helper company-jedi bshell rainbow-identifiers jabber counsel ivy swiper ivy-bibtex bonjourmadame color-theme-sanityinc-solarized mmm-mode fireplace anaconda-mode auto-complete-mode indent-guide bpr pdf-tools ranger helm-flx jenkins org-beautify-theme org-bullets rainbow-delimiters ein aurora-theme ido-completing-read+ helm-github-stars paradox spinner sequences minimap js2-mode imenu-anywhere rust-mode ocodo-svg-modelines ace-jump-mode multiple-cursors color-identifiers-mode matlab-mode zotelo stickyfunc-enhance highlight-indentation yasnippet projectile helm fill-column-indicator magit evil discover zop-to-char yaml-mode window-numbering use-package undo-tree sx solarized-theme smex smart-mode-line project-persist project-explorer perspective origami moz-controller magit-filenotify julia-mode json-mode iedit hydra htmlize helm-projectile gitignore-mode gitconfig-mode flycheck flx-ido f expand-region ethan-wspace dynamic-fonts direx company color-theme-sanityinc-tomorrow cmake-mode bbdb-vcard aggressive-indent ace-window 2048-game))
 '(paradox-github-token t)
 '(persp-init-frame-behaviour nil)
 '(preview-default-option-list
   '("displaymath" "floats" "graphics" "textmath" "showlabels"))
 '(preview-scale-function 1.5)
 '(preview-transparent-color '(highlight :background))
 '(projectile-git-command "git ls-files -zc --exclude-standard")
 '(projectile-globally-ignored-directories
   '(".idea" ".ensime_cache" ".eunit" ".git" ".hg" ".fslckout" "_FOSSIL_" ".bzr" "_darcs" ".tox" ".svn" ".stack-work" "build"))
 '(python-shell-prompt-detect-enabled nil)
 '(recentf-exclude '("COMMIT_EDITMSG" ".newsrc-dribble" "ido.last"))
 '(rm-blacklist
   '(" hl-p" " Undo-Tree" " Projectile" " yas" " ew:mnlt" " AC" " Interaction"))
 '(rm-excluded-modes
   '(" hl-p" " Undo-Tree" " Projectile" " yas" " ew:mnlt" " AC" " Interaction"))
 '(safe-local-variable-values
   '((encoding . utf-8)
     (whitespace-style face tabs trailing lines-tail)
     (TeX-master)
     (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
           (add-hook 'write-contents-functions
                     (lambda nil
                       (delete-trailing-whitespace)
                       nil))
           (require 'whitespace)
           "Sometimes the mode needs to be toggled off and on."
           (whitespace-mode 0)
           (whitespace-mode 1))
     (whitespace-line-column . 80)
     (whitespace-style face trailing lines-tail)
     (c-offsets-alist
      (inexpr-class . +)
      (inexpr-statement . +)
      (lambda-intro-cont . +)
      (inlambda . c-lineup-inexpr-block)
      (template-args-cont c-lineup-template-args +)
      (incomposition . +)
      (inmodule . +)
      (innamespace . +)
      (inextern-lang . +)
      (composition-close . 0)
      (module-close . 0)
      (namespace-close . 0)
      (extern-lang-close . 0)
      (composition-open . 0)
      (module-open . 0)
      (namespace-open . 0)
      (extern-lang-open . 0)
      (objc-method-call-cont c-lineup-ObjC-method-call-colons c-lineup-ObjC-method-call +)
      (objc-method-args-cont . c-lineup-ObjC-method-args)
      (objc-method-intro .
                         [0])
      (friend . 0)
      (cpp-define-intro c-lineup-cpp-define +)
      (cpp-macro-cont . +)
      (cpp-macro .
                 [0])
      (inclass . +)
      (stream-op . c-lineup-streamop)
      (arglist-cont-nonempty c-lineup-gcc-asm-reg c-lineup-arglist)
      (arglist-cont c-lineup-gcc-asm-reg 0)
      (arglist-intro . +)
      (catch-clause . 0)
      (else-clause . 0)
      (do-while-closure . 0)
      (label . 2)
      (access-label . -)
      (substatement-label . 2)
      (substatement . +)
      (statement-case-open . 0)
      (statement-case-intro . +)
      (statement-block-intro . +)
      (statement-cont . +)
      (statement . 0)
      (brace-entry-open . 0)
      (brace-list-entry . 0)
      (brace-list-intro . +)
      (brace-list-close . 0)
      (brace-list-open . 0)
      (block-close . 0)
      (inher-cont . c-lineup-multi-inher)
      (inher-intro . +)
      (member-init-cont . c-lineup-multi-inher)
      (member-init-intro . +)
      (annotation-var-cont . +)
      (annotation-top-cont . 0)
      (topmost-intro-cont . c-lineup-topmost-intro-cont)
      (topmost-intro . 0)
      (knr-argdecl . 0)
      (func-decl-cont . +)
      (inline-close . 0)
      (inline-open . +)
      (class-close . 0)
      (class-open . 0)
      (defun-block-intro . +)
      (defun-close . 0)
      (defun-open . 0)
      (string . c-lineup-dont-change)
      (arglist-close . c-lineup-arglist)
      (substatement-open . 0)
      (case-label . 0)
      (block-open . 0)
      (c . 1)
      (comment-intro . 0)
      (knr-argdecl-intro . -))
     (c-cleanup-list scope-operator brace-else-brace brace-elseif-brace brace-catch-brace empty-defun-braces list-close-comma defun-close-semi)
     (c-hanging-semi&comma-criteria c-semi&comma-no-newlines-before-nonblanks)
     (c-hanging-colons-alist
      (member-init-intro before)
      (inher-intro)
      (case-label after)
      (label after)
      (access-label after))
     (c-hanging-braces-alist
      (substatement-open after)
      (brace-list-open after)
      (brace-entry-open)
      (defun-open after)
      (class-open after)
      (inline-open after)
      (block-open after)
      (block-close . c-snug-do-while)
      (statement-case-open after)
      (substatement after))
     (c-comment-only-line-offset . 0)
     (c-tab-always-indent . t)
     (TeX-master . "manuscript.tex")
     (nxml-child-indent . 4)
     (TeX-master . t)))
 '(semantic-new-buffer-setup-functions
   '((c-mode . semantic-default-c-setup)
     (c++-mode . semantic-default-c-setup)
     (html-mode . semantic-default-html-setup)
     (java-mode . wisent-java-default-setup)
     (js-mode . wisent-javascript-setup-parser)
     (scheme-mode . semantic-default-scheme-setup)
     (srecode-template-mode . srecode-template-setup-parser)
     (texinfo-mode . semantic-default-texi-setup)
     (makefile-automake-mode . semantic-default-make-setup)
     (makefile-gmake-mode . semantic-default-make-setup)
     (makefile-makepp-mode . semantic-default-make-setup)
     (makefile-bsdmake-mode . semantic-default-make-setup)
     (makefile-imake-mode . semantic-default-make-setup)
     (makefile-mode . semantic-default-make-setup)))
 '(sml/active-background-color "gray25")
 '(sml/hidden-modes
   '(" hl-p" " Undo-Tree" " Projectile" " yas" " ew:mnlt" " AC" " Interaction"))
 '(sml/mode-width 10)
 '(sml/name-width 14)
 '(tramp-syntax 'default nil (tramp))
 '(tramp-verbose 2 nil (tramp))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ido-first-match ((t (:foreground "#ad7f8a" :weight bold))))
 '(ido-subdir ((((min-colors 88) (class color)) (:foreground "DarkGoldenrod1"))))
 '(magit-item-highlight ((t (:inherit nil))))
 '(python-cell ((t (:inherit highlight :background "gray94"))) t)
 '(tabbar-default ((t (:background "gray17" :foreground "gray" :height 0.9 :family "Mono"))) t)
 '(tabbar-selected ((t (:inherit tabbar-default :foreground "gold" :box (:line-width 1 :color "white" :style pressed-button)))) t)
 '(window-numbering-face ((t (:foreground "DeepPink" :underline "DeepPink" :weight bold))) t))
 ;; '(tabbar-button ((t (:foreground "#ad7f8a"))))
 ;;'(tabbar-selected ((t (:background "DarkGoldenrod1" :foreground "Black"))))
 ;;'(tabbar-separator ((t (:height 0.5))))
 ;;'(tabbar-unselected ((t nil))))
