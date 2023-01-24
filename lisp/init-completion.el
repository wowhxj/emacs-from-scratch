;;; init-completion.el --- Completion settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

  (use-package vertico
    :ensure t
    :hook (after-init . vertico-mode)
    :bind (:map minibuffer-local-map
                ("M-<DEL>" . my/minibuffer-backward-kill)
                :map vertico-map
                ("M-q" . vertico-quick-insert)) ; use C-g to exit
    :config
    (defun my/minibuffer-backward-kill (arg)
      "When minibuffer is completing a file name delete up to parent
  folder, otherwise delete a word"
      (interactive "p")
      (if minibuffer-completing-file-name
          ;; Borrowed from https://github.com/raxod502/selectrum/issues/498#issuecomment-803283608
          (if (string-match-p "/." (minibuffer-contents))
              (zap-up-to-char (- arg) ?/)
            (delete-minibuffer-contents))
        (backward-kill-word arg)))

    ;; Do not allow the cursor in the minibuffer prompt
    (setq minibuffer-prompt-properties
          '(read-only t cursor-intangible t face minibuffer-prompt))
    (add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
    
    (setq vertico-cycle t)                ; cycle from last to first
    :custom
    (vertico-count 15)                    ; number of candidates to display, default is 10
    )

;; support Pinyin first character match for orderless, avy etc.
(use-package pinyinlib
  :ensure t)

;; orderless 是一种哲学思想
(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless partial-completion basic))
  (setq orderless-component-separator "[ &]") ; & is for company because space will break completion
  (setq completion-category-defaults nil)
  (setq completion-category-overrides nil)
  :config
  ;; make completion support pinyin, refer to
  ;; https://emacs-china.org/t/vertico/17913/2
  (defun completion--regex-pinyin (str)
    (orderless-regexp (pinyinlib-build-regexp-string str)))
  (add-to-list 'orderless-matching-styles 'completion--regex-pinyin)
  )

;; minibuffer helpful annotations
(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode)
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil)))

  (use-package consult
    :ensure t
    :after org
    :bind (([remap goto-line]                     . consult-goto-line)
           ([remap isearch-forward]               . consult-line-symbol-at-point) ; my-consult-ripgrep-or-line
           ([remap switch-to-buffer]              . consult-buffer)
           ([remap switch-to-buffer-other-window] . consult-buffer-other-window)
           ([remap switch-to-buffer-other-frame]  . consult-buffer-other-frame)
           ([remap yank-pop]                      . consult-yank-pop)
           ([remap apropos]                       . consult-apropos)
           ([remap bookmark-jump]                 . consult-bookmark)
           ([remap goto-line]                     . consult-goto-line)
           ([remap imenu]                         . consult-imenu)
           ([remap multi-occur]                   . consult-multi-occur)
           ([remap recentf-open-files]            . consult-recent-file)
           ("C-x j"                               . consult-mark)
           ("C-c g"                               . consult-ripgrep)
           ("C-c f"                               . consult-find)
           ("\e\ef"                               . consult-locate) ; need to enable locate first
           ("C-c n h"                             . my/consult-find-org-headings)
           :map org-mode-map
           ("C-c C-j"                             . consult-org-heading)
           :map minibuffer-local-map
           ("C-r"                                 . consult-history)
           :map isearch-mode-map
           ("C-;"                                 . consult-line)
           :map prog-mode-map
           ("C-c C-j"                             . consult-outline)
           )
    :hook (completion-list-mode . consult-preview-at-point-mode)
    :init
    ;; Optionally configure the register formatting. This improves the register
    ;; preview for `consult-register', `consult-register-load',
    ;; `consult-register-store' and the Emacs built-ins.
    (setq register-preview-delay 0
          register-preview-function #'consult-register-format)

    ;; Optionally tweak the register preview window.
    ;; This adds thin lines, sorting and hides the mode line of the window.
    (advice-add #'register-preview :override #'consult-register-window)

    ;; Use Consult to select xref locations with preview
    (setq xref-show-xrefs-function #'consult-xref
          xref-show-definitions-function #'consult-xref)

    ;; MacOS locate doesn't support `--ignore-case --existing' args.
    (setq consult-locate-args (pcase system-type
                                ('gnu/linux "locate --ignore-case --existing --regex")
                                ('darwin "mdfind -name")))
    :config
    (consult-customize
     consult-theme
     :preview-key '(:debounce 0.2 any)
     consult-ripgrep consult-git-grep consult-grep
     consult-bookmark consult-recent-file consult-xref
     consult--source-recent-file consult--source-project-recent-file consult--source-bookmark
     :preview-key (kbd "M-."))

    ;; Optionally configure the narrowing key.
    ;; Both < and C-+ work reasonably well.
    (setq consult-narrow-key "<") ;; (kbd "C-+")

    (autoload 'projectile-project-root "projectile")
    (setq consult-project-root-function #'projectile-project-root)

    ;; search all org file headings under a directory, see:
    ;; https://emacs-china.org/t/org-files-heading-entry/20830/4
    (defun my/consult-find-org-headings (&optional match)
      "find headngs in all org files."
      (interactive)
      (consult-org-heading match (directory-files org-directory t "^[0-9]\\{8\\}.+\\.org$")))

    ;; Use `consult-ripgrep' instead of `consult-line' in large buffers
    (defun consult-line-symbol-at-point ()
      "Consult line the synbol where the point is"
      (interactive)
      (consult-line (thing-at-point 'symbol)))
    )

(use-package corfu
  :ensure t
  :hook (after-init . global-corfu-mode)
  :bind
  (:map corfu-map
        ("SPC" . corfu-insert-separator)    ; configure space for separator insertion
        ("M-q" . corfu-quick-complete)      ; use C-g to exit
        ("TAB" . corfu-next)
        ([tab] . corfu-next)
        ("S-TAB" . corfu-previous)
        ([backtab] . corfu-previous))
  :config
  ;; TAB cycle if there are only few candidates
  (setq completion-cycle-threshold 0)
  (setq tab-always-indent 'complete)

  (defun corfu-enable-always-in-minibuffer ()
    "Enable Corfu in the minibuffer if Vertico/Mct are not active."
    (unless (or (bound-and-true-p mct--active)
                (bound-and-true-p vertico--input))
      ;; (setq-local corfu-auto nil) Enable/disable auto completion
      (corfu-mode 1)))
  (add-hook 'minibuffer-setup-hook #'corfu-enable-always-in-minibuffer 1)

  ;; enable corfu in eshell
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setq-local corfu-auto nil)
              (corfu-mode)))

  ;; For Eshell
  ;; ===========
  ;; avoid press RET twice in Eshell
  (defun corfu-send-shell (&rest _)
    "Send completion candidate when inside comint/eshell."
    (cond
     ((and (derived-mode-p 'eshell-mode) (fboundp 'eshell-send-input))
      (eshell-send-input))
     ((and (derived-mode-p 'comint-mode)  (fboundp 'comint-send-input))
      (comint-send-input))))
  ;; (advice-add #'corfu-insert :after #'corfu-send-shell)

  :custom
  (corfu-cycle t)                ;; Enable cycling for `corfu-next/previous'
  )

  (use-package cape
    :ensure t
    :init
    ;; Add `completion-at-point-functions', used by `completion-at-point'.
    (add-to-list 'completion-at-point-functions #'cape-file)
    (add-to-list 'completion-at-point-functions #'cape-dabbrev)
    (add-to-list 'completion-at-point-functions #'cape-keyword)  ; programming language keyword
    (add-to-list 'completion-at-point-functions #'cape-ispell)
    (add-to-list 'completion-at-point-functions #'cape-dict)
    (add-to-list 'completion-at-point-functions #'cape-symbol)   ; elisp symbol
    (add-to-list 'completion-at-point-functions #'cape-line)

    :config
    (setq cape-dict-file (expand-file-name "etc/hunspell_dict.txt" user-emacs-directory))

    ;; for Eshell:
    ;; ===========
    ;; Silence the pcomplete capf, no errors or messages!
    (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-silent)

    ;; Ensure that pcomplete does not write to the buffer
    ;; and behaves as a pure `completion-at-point-function'.
    (advice-add 'pcomplete-completions-at-point :around #'cape-wrap-purify)
    )

;; yasnippet settings
(use-package yasnippet
  :ensure t
  :diminish yas-minor-mode
  :hook ((after-init . yas-reload-all)
         ((prog-mode LaTeX-mode org-mode) . yas-minor-mode))
  :config
  ;; Suppress warning for yasnippet code.
  (require 'warnings)
  (add-to-list 'warning-suppress-types '(yasnippet backquote-change))

  (setq yas-prompt-functions '(yas-x-prompt yas-dropdown-prompt))
  (defun smarter-yas-expand-next-field ()
    "Try to `yas-expand' then `yas-next-field' at current cursor position."
    (interactive)
    (let ((old-point (point))
          (old-tick (buffer-chars-modified-tick)))
      (yas-expand)
      (when (and (eq old-point (point))
                 (eq old-tick (buffer-chars-modified-tick)))
        (ignore-errors (yas-next-field))))))

(provide 'init-completion)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-completion.el ends here
