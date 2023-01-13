;;; init-edit.el --- Editing settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(setq make-backup-files nil)                                  ; 不自动备份
(setq auto-save-default nil)                                  ; 不使用Emacs自带的自动保存

;; 解除不常用的快捷键定义
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "s-q") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "M-m") nil)
(global-set-key (kbd "C-x C-z") nil)
(global-set-key [mouse-2] nil)

;; Directly modify when selecting text
(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))

(use-package autorevert
  :ensure nil
  :hook (after-init . global-auto-revert-mode)
  :bind ("s-u" . revert-buffer)
  :custom
  (auto-revert-interval 10)
  (auto-revert-avoid-polling t)
  (auto-revert-verbose nil)
  (auto-revert-remote-files t)
  (auto-revert-check-vc-info t)
  (global-auto-revert-non-file-buffers t))

(use-package avy
  :ensure t
  :bind (("C-." . my/avy-goto-char-timer)
         ("C-。" . my/avy-goto-char-timer)
         :map isearch-mode-map
         ("C-." . avy-isearch))
  :config
  ;; Make `avy-goto-char-timer' support pinyin, refer to:
  ;; https://emacs-china.org/t/avy-avy-goto-char-timer/20900/2
  (defun my/avy-goto-char-timer (&optional arg)
    "Make avy-goto-char-timer support pinyin"
    (interactive "P")
    (let ((avy-all-windows (if arg
                               (not avy-all-windows)
                             avy-all-windows)))
      (avy-with avy-goto-char-timer
        (setq avy--old-cands (avy--read-candidates
                              'pinyinlib-build-regexp-string))
        (avy-process avy--old-cands))))

  (defun avy-action-kill-whole-line (pt)
    "avy action: kill the whole line where avy selection is"
    (save-excursion
      (goto-char pt)
      (kill-whole-line))
    (select-window
     (cdr
      (ring-ref avy-ring 0)))
    t)

  (defun avy-action-copy-whole-line (pt)
    "avy action: copy the whole line where avy selection is"
    (save-excursion
      (goto-char pt)
      (cl-destructuring-bind (start . end)
          (bounds-of-thing-at-point 'line)
        (copy-region-as-kill start end)))
    (select-window
     (cdr
      (ring-ref avy-ring 0)))
    t)

  (defun avy-action-yank-whole-line (pt)
    "avy action: copy the line where avy selection is and paste to current point"
    (avy-action-copy-whole-line pt)
    (save-excursion (yank))
    t)

  (defun avy-action-teleport-whole-line (pt)
    "avy action: kill the line where avy selection is and paste to current point"
    (avy-action-kill-whole-line pt)
    (save-excursion (yank)) t)

  (defun avy-action-helpful (pt)
    "avy action: get helpful information at point"
    (save-excursion
      (goto-char pt)
      (helpful-at-point))
    ;; (select-window
    ;;  (cdr (ring-ref avy-ring 0)))
    t)

  (defun avy-action-mark-to-char (pt)
    "avy action: mark from current point to avy selection"
    (activate-mark)
    (goto-char pt))

  (defun avy-action-flyspell (pt)
    "avy action: flyspell the word where avy selection is"
    (save-excursion
      (goto-char pt)
      (when (require 'flyspell nil t)
        (flyspell-correct-wrapper))))

  (defun avy-action-define (pt)
    "avy action: define the word in dictionary where avy selection is"
    (save-excursion
      (goto-char pt)
      (fanyi-dwim2)))

  (defun avy-action-embark (pt)
    "avy action: embark where avy selection is"
    (unwind-protect
        (save-excursion
          (goto-char pt)
          (embark-act))
      (select-window
       (cdr (ring-ref avy-ring 0))))
    t)

  (defun avy-action-google (pt)
    "avy action: google the avy selection when it is a word or browse it when it is a link"
    (save-excursion
      (goto-char pt)
      (my/search-or-browse)))

  (setf (alist-get ?k avy-dispatch-alist) 'avy-action-kill-stay
        (alist-get ?K avy-dispatch-alist) 'avy-action-kill-whole-line
        (alist-get ?w avy-dispatch-alist) 'avy-action-copy
        (alist-get ?W avy-dispatch-alist) 'avy-action-copy-whole-line
        (alist-get ?y avy-dispatch-alist) 'avy-action-yank
        (alist-get ?Y avy-dispatch-alist) 'avy-action-yank-whole-line
        (alist-get ?t avy-dispatch-alist) 'avy-action-teleport
        (alist-get ?T avy-dispatch-alist) 'avy-action-teleport-whole-line
        (alist-get ?H avy-dispatch-alist) 'avy-action-helpful
        (alist-get ?  avy-dispatch-alist) 'avy-action-mark-to-char
        (alist-get ?\; avy-dispatch-alist) 'avy-action-flyspell
        (alist-get ?= avy-dispatch-alist) 'avy-action-define
        (alist-get ?o avy-dispatch-alist) 'avy-action-embark
        (alist-get ?G avy-dispatch-alist) 'avy-action-google
        )

  :custom
  ;; (avy-case-fold-search t)              ; default is t
  (avy-timeout-seconds 1.0)
  (avy-all-windows t)
  (avy-background t)
  (avy-keys '(?a ?s ?d ?f ?g ?h ?j ?l ?q ?e ?r ?u ?i ?p ?n))
  )

(use-package multiple-cursors
  :ensure t
  :bind-keymap ("C-c o" . multiple-cursors-map)
  :bind (("C-`"   . mc/mark-next-like-this)
         ("C-\\"  . mc/unmark-next-like-this)
         :map multiple-cursors-map
              ("SPC" . mc/edit-lines)
              (">"   . mc/mark-next-like-this)
              ("<"   . mc/mark-previous-like-this)
              ("a"   . mc/mark-all-like-this)
              ("n"   . mc/mark-next-like-this-word)
              ("p"   . mc/mark-previous-like-this-word)
              ("r"   . set-rectangular-region-anchor)
              )
  :config
  (defvar multiple-cursors-map nil "keymap for `multiple-cursors")
  (setq multiple-cursors-map (make-sparse-keymap))
  (setq mc/list-file (concat user-emacs-directory "/etc/mc-lists.el"))
  (setq mc/always-run-for-all t)
  )

;; (message "init-base configuration: %.2fs"
;;          (float-time (time-subtract (current-time) my/init-base-start-time)))

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
