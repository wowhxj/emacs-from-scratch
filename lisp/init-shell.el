;;; init-shell.el --- (E)shell settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package eshell
  :ensure nil
  :functions eshell/alias
  :hook ((eshell-mode . (lambda ()
                          (term-mode-common-init)
                          ;; Remove cmd args word by word
                          (modify-syntax-entry ?- "w")
                          (visual-line-mode 1)
                          (setenv "PAGER" "cat")))
         )
  :config
  (defun term-mode-common-init ()
  "The common initialization for term."
  (setq-local scroll-margin 0)
  (setq-local truncate-lines t)
  )
  
  ;; 在Emacs里输入vi，直接在buffer里打开文件
  (defalias 'eshell/vi 'find-file)
  (defalias 'eshell/vim 'find-file)

  ;; 语法高亮显示
  (defun eshell/bat (file)
    "cat FILE with syntax highlight."
    (with-temp-buffer
      (insert-file-contents file)
      (let ((buffer-file-name file))
        (delay-mode-hooks
          (set-auto-mode)
          (font-lock-ensure)))
      (buffer-string)))
  (defalias 'eshell/cat 'eshell/bat)

  ;; 交互式进入目录
  (defun eshell/z ()
    "cd to directory with completion."
    (let ((dir (completing-read "Directory: " (ring-elements eshell-last-dir-ring) nil t)))
      (eshell/cd dir)))

  ;; 查找文件
  (defun eshell/f (filename &optional dir)
    "Search for files matching FILENAME in either DIR or the
current directory."
    (let ((cmd (concat
                ;; using find
                (executable-find "find")
                " " (or dir ".")
                " -not -path '*/.git*'"            ; ignore .git directory
                " -and -not -path 'build'"         ; ignore cmake build directory
                " -and -not -path '*/eln-cache*'"  ; ignore eln cache
                " -and -type f -and -iname "
                "'*" filename "*'")))
      (eshell-command-result cmd)))

  :custom
  (eshell-banner-message
   '(format "%s %s\n"
            (propertize (format " %s " (string-trim (buffer-name)))
                        'face 'mode-line-highlight)
            (propertize (current-time-string)
                        'face 'font-lock-keyword-face)))
  (eshell-scroll-to-bottom-on-input 'all)
  (eshell-scroll-to-bottom-on-output 'all)
  (eshell-kill-on-exit t)
  (eshell-kill-processes-on-exit t)
  ;; Don't record command in history if starts with whitespace
  (eshell-input-filter 'eshell-input-filter-initial-space)
  (eshell-error-if-no-glob t)
  (eshell-glob-case-insensitive t)
  ;; set scripts
  (eshell-rc-script (locate-user-emacs-file "etc/eshell/profile"))
  (eshell-login-script (locate-user-emacs-file "etc/eshell/login"))
  )

(use-package em-rebind
  :ensure nil
  :commands eshell-delchar-or-maybe-eof)

(use-package esh-mode
  :ensure nil
  :bind (:map eshell-mode-map
              ("C-d" . eshell-delchar-or-maybe-eof)
              ("C-r" . consult-history)
              ("C-l" . eshell/clear))
  )

(use-package em-hist
  :ensure nil
  :defer t
  :custom
  (eshell-history-size 1024)
  (eshell-hist-ignoredups t)
  (eshell-save-history-on-exit t))

;; following commands will run on term instead
(use-package em-term
  :ensure nil
  :defer t
  :custom
  (eshell-visual-commands '("top" "htop" "less" "more"))
  (eshell-visual-subcommands '(("git" "help" "lg" "log" "diff" "show")))
  (eshell-visual-options '(("git" "--help" "--paginate")))
  (eshell-destroy-buffer-when-process-dies t))

(use-package eshell-git-prompt
  :ensure t
  :after esh-mode
  :custom-face
  (eshell-git-prompt-multiline2-dir-face ((t (:foreground "#c09035" :bold t))))
  :config
  (eshell-git-prompt-use-theme 'multiline2)
  )

(use-package eshell-syntax-highlighting
  :after esh-mode
  :ensure t
  :hook (eshell-mode . eshell-syntax-highlighting-global-mode)
  :custom-face
  (eshell-syntax-highlighting-shell-command-face ((t (:foreground "#7cc77f" :bold t))))
  )

(use-package esh-autosuggest
  :ensure t
  :hook (eshell-mode . esh-autosuggest-mode)
  )

(use-package eshell-up
  :ensure t
  :commands (eshell-up eshell-up-peek)
  :config
  ;; to print the matching parent directory before changing to it
  (setq eshell-up-print-parent-dir t)
  )

(provide 'init-shell)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-shell.el ends here
