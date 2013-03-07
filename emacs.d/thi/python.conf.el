;; (setq
;;  python-shell-interpreter "ipython"
;;  python-shell-interpreter-args "--pylab"
;;  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;  python-shell-completion-setup-code ""
;;  python-shell-completion-string-code
;;  "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
;;  python-skeleton-autoinsert t )

;; (defvar ac-source-python
;;   '((candidates .
;;                 (lambda ()
;;                   (mapcar '(lambda (completion)
;;                              (first (last (split-string completion "\\." t))))
;;                           (python-symbol-completions (python-partial-symbol)))))))


;; (add-hook 'python-mode-hook
;;              (lambda() (setq ac-sources '(ac-source-python))))
(add-hook 'python-mode-hook #'lambda-mode 1)
(add-hook 'python-mode-hook 'jedi:setup)