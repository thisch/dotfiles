;; -*- coding: utf-8 -*-
;; (setq debug-on-error t)

(dolist (p '("" "/vendor" "/el-get/el-get"))
  (add-to-list 'load-path (expand-file-name
                           (concat user-emacs-directory p))))

(defvar thi::cache-file-dir (expand-file-name
                             (concat (or (getenv "XDG_CACHE_HOME") "~/.cache") "/emacs")))
(defvar thi::config-dir (expand-file-name
                         (concat user-emacs-directory "/thi")))
(setq custom-file (concat thi::config-dir "/custom.el"))
(load custom-file 'noerror)
(mkdir thi::cache-file-dir t)

;; Each file named <somelibrary>.conf.el is loaded just after the library is
;; loaded.
(dolist (file (directory-files thi::config-dir))
  (when (string-match (format "^\\(.+\\)\\.conf\\.el$") file)
    (eval-after-load (match-string-no-properties 1 file)
      `(load ,(concat thi::config-dir "/" file)))))


(setq thi::packages
        '(auto-complete
          magit
          magithub
          git-modes
          org-mode
          cmake-mode
          eassist
          markdown-mode
          yaml-mode
          expand-region
          ace-jump-mode
          yasnippet
          naquadah-theme
          smex
          dired+
          dired-details
          ethan-wspace
          gnuplot-mode
          iedit
          protobuf-mode
          rainbow-mode
          rainbow-delimiters
          highlight-indentation
          browse-kill-ring
          ;; textlint ;; not needed atm
          ;; nognus
          ;; go-mode
          el-get
          multi-term
          browse-kill-ring
          goto-last-change
          idle-highlight-mode
          mmm-mode))

;; Require el-get to install packages
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (let (el-get-master-branch)
       (goto-char (point-max))
       (eval-print-last-sexp)))))

(add-to-list 'el-get-recipe-path (concat thi::config-dir "/recipes"))

;; (el-get 'sync)
;; (setq el-get-is-lazy t)
;; (setq el-get-byte-compile nil)
(el-get 'sync thi::packages)

(load-theme 'naquadah)

(load "thi/defuns")
(load "thi/global")
(load "thi/vc")
(load "thi/bindings")
(load "thi/projects")
(load "thi/ido")
(load "thi/ccmode")
(load "thi/latex")
(load "thi/recentf")
(load "thi/nxml")
(load "thi/compilation")
;; (load "thi/matlab") ;; not needed ATM
(load "thi/flymake-pre")
(vendor 'flymake-cursor)

(tabbar-mode) ;; try this for a while


;;customizations for el-get packages
;;TODO automatically load these files when the el-get packs are loaded
(load "thi/auto-complete")
(load "thi/yasnippet")

(load "vendor/lambda-mode") ;; useful for python development
(vendor 'python)



;;elpa packages
(elpa-vendor 'evil "0.0.0")
;; (load "thi/undo-tree") ;; FIXME why does this not work ?

;; (load "vendor/key-chord") ;; from emacs-rocks
;; (load "vendor/iy-go-to-char")
;; (key-chord-mode 1)

;; TODO activate this when you think you need it
;; (vendor 'auto-mark)

;; keyboard scroll one line at a time
;; http://www.emacswiki.org/emacs/SmoothScrolling
;; -------------------------------------
;; following commands do not work - still no smooth scrolling
;; -- (setq scroll-step 1)
;; -- (setq scroll-conservatively 10000)
;; however this works: (still not as smooth as in vim :( )
;;(vendor 'smooth-scrolling)
