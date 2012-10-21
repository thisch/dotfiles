(setq el-get-is-lazy t)
(setq el-get-byte-compile nil)

(el-get nil
        '(auto-complete
          magit
          magithub
          git-modes
          org-mode
          cmake-mode
          markdown-mode
          yaml-mode
          expand-region
          ace-jump-mode
          ;; textlint ;; not needed atm
          yasnippet
          naquadah-theme
          smex
          ethan-wspace
          gnuplot-mode
          iedit
          protobuf-mode
          rainbow-mode
          rainbow-delimiters
          highlight-indentation
          browse-kill-ring
          ;; nognus
          ;; go-mode
          el-get
          multi-term
          browse-kill-ring
          goto-last-change
          idle-highlight-mode
          mmm-mode))
