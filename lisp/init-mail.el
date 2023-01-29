;;; init-mail.el --- Mail settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package ol-notmuch
  :ensure t
  )

(use-package notmuch
  :ensure t
  :commands notmuch
  :hook ((window-setup . notmuch)
         (notmuch-hello-refresh . notmuch-unread-count))
  :bind (("\e\em" . notmuch)
         ("C-x m" . notmuch-mua-new-mail) ; override `compose mail'
         :map notmuch-hello-mode-map
         ("q"     . quit-window)
         :map notmuch-show-mode-map
         ("C-c f" . my/capture-mail-follow-up)
         ("C-c r" . my/capture-mail-read-later)
         :map notmuch-search-mode-map
         ("/"     . notmuch-search-filter)
         ("C-c f" . my/capture-mail-follow-up))
  :init
  (setq notmuch-search-oldest-first nil) ; newest on the top
  :config
  ;; 设置notmuch邮件快速记录的模板
  (require 'org-capture)
  (add-to-list 'org-capture-templates
               '("e" "Email follow up" entry
                 (file+headline "mail.org" "Follow Up")
                 "* TODO [#A] %:subject :mail:\nSCHEDULED: %t\nDEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+2d\"))\n\n%a%?"
                 :empty-lines-after 1
                 :prepend t
                 :immediate-finish t
                 :jump-to-captured t
                 ))
  (add-to-list 'org-capture-templates-contexts
               '("e" ((in-mode . "notmuch-search-mode")
                      (in-mode . "notmuch-show-mode"))))

  ;; 在邮件界面快速记录需要跟进的邮件
  (defun my/capture-mail-follow-up ()
    (interactive)
    (call-interactively 'org-store-link)
    (org-capture nil "e"))

  ;; custom UI
  (setq notmuch-show-logo t)
  (setq notmuch-column-control 1.0)
  (setq notmuch-hello-recent-searches-max 20)
  (setq notmuch-hello-thousands-separator ",")
  (setq notmuch-hello-sections '(notmuch-hello-insert-header
                                 notmuch-hello-insert-saved-searches
                                 notmuch-hello-insert-alltags
                                 notmuch-hello-insert-footer))
  (setq notmuch-show-all-tags-list t)

  ;; set saved searches, use `j' to jump to the search
  (setq notmuch-saved-searches '(
                                 (:name "all"
                                        :query "*"
                                        :sort-order newest-first
                                        :key "l")

                                 (:name "archived"
                                        :query "tag:archived"
                                        :sort-order newest-first
                                        :key "A")

                                 (:name "inbox"
                                        :query "tag:inbox"
                                        :sort-order newest-first
                                        :key "i")

                                 (:name "sent"
                                        :query "tag:sent"
                                        :sort-order newest-first
                                        :key "s")
                                 ))
  (setq notmuch-archive-tags '("-inbox" "+archived"))

  ;; Email composition
  (setq notmuch-mua-user-agent-function #'notmuch-mua-user-agent-full)

  ;; Reading messages
  (setq notmuch-wash-citation-lines-prefix 6) ; default is 3
  (setq notmuch-wash-citation-lines-suffix 6)
  (setq notmuch-unthreaded-show-out nil)
  (setq notmuch-message-headers '("To" "Cc" "Subject" "Date"))

  ;; notmuch notifications on mode-line based from notmuch-unread-mode, refer to:
  ;; https://www.reddit.com/r/emacs/comments/esxjh5/my_notmuch_email_count_display_in_modeline/
  (defvar notmuch-unread-mode-line-string "")
  (defvar notmuch-unread-email-count nil)
  (defconst my-mode-line-map (make-sparse-keymap))

  (defun notmuch-unread-count ()
    (setq notmuch-unread-email-count (string-to-number (replace-regexp-in-string "\n" "" (notmuch-command-to-string "count" "tag:unread"))))
    (if (eq notmuch-unread-email-count 0)
        (setq notmuch-unread-mode-line-string (format " 0 "))
      (setq notmuch-unread-mode-line-string (format " %d " notmuch-unread-email-count)))
    (force-mode-line-update))

  (defun notmuch-open-emails ()
    (interactive)
    (if (eq notmuch-unread-email-count 0) (notmuch-search "tag:inbox") (notmuch-search "tag:unread")))

  (setq global-mode-string
        (append global-mode-string (list '(:eval (propertize notmuch-unread-mode-line-string 'help-echo "notmuch emails" 'mouse-face 'mode-line-highlight 'local-map my-mode-line-map)))))

  (define-key my-mode-line-map
              (vconcat [mode-line down-mouse-1])
              (cons "hello" 'notmuch-open-emails))

  ;; 每三分钟刷新一下notmuch，在刷新的时候会执行 `notmuch-unread-count' hook
  ;; 来执行状态栏的邮件数量更新
  (run-at-time t 180 #'notmuch-refresh-all-buffers)
  )

(use-package message
  :ensure nil
  :hook ((message-mode . auto-fill-mode)
         (message-mode . (lambda () (display-line-numbers-mode 0)))
         (message-mode . turn-on-orgtbl)
         )
  ;; :bind (:map message-mode-map ("TAB" . message-display-abbrev))
  :config
  ;; add Cc and Bcc headers to the message buffer
  (setq message-default-mail-headers "Cc: \nBcc: \n")
  ;; change the directory to store the sent mail and mkdir sent ahead
  (setq message-directory "~/Mail/")
  (setq message-auto-save-directory "~/Mail/drafts/")
  :custom
  ;; make sure `user-full-name' and `user-mail-address' are configed
  (message-kill-buffer-on-exit t)
  (message-mail-alias-type 'ecomplete)
  (message-send-mail-function #'message-use-send-mail-function)
  (message-signature (concat "Best regards,\n" user-full-name))
  )

(use-package sendmail
  :ensure nil
  :defer t
  :custom
  (send-mail-function 'sendmail-send-it)
  ;; msmtp config
  (sendmail-program "/usr/local/bin/msmtp")
  (mail-specify-envelope-from t)
  (message-sendmail-envelope-from 'header)
  (mail-envelope-from 'header)
  )

(use-package emacs
  :ensure nil
  :hook (notmuch-hello-refresh . notmuch-hello-refresh-status-message)
  :config
  (defvar notmuch-hello-refresh-count 0)
  (defun notmuch-hello-refresh-status-message ()
    (let* ((new-count
            (string-to-number
             (car (process-lines notmuch-command "count"))))
           (diff-count (- new-count notmuch-hello-refresh-count)))
      (cond
       ((= notmuch-hello-refresh-count 0)
        (progn
          (message "You have new messages.")
          (notify-send :title "Notmuch email"
                       :body (concat "You have " (notmuch-hello-nice-number new-count) " messages.")
                       :timeout 5
                       :urgency 'critical)
          ))
       ((> diff-count 0)
        (progn
          (message "You have new messages.")
          (notify-send :title "Notmuch email"
                       :body (concat "You have " (notmuch-hello-nice-number diff-count) " more messages since last refresh.")
                       :timeout 5
                       :urgency 'critical)
          ))
       ((< diff-count 0)
        (progn
          (message "You have new messages.")
          (notify-send :title "Notmuch email"
                       :body (concat "You have " (notmuch-hello-nice-number (- diff-count)) " fewer messages since last refresh.")
                       :timeout 5
                       :urgency 'critical)
          )))
      (setq notmuch-hello-refresh-count new-count)))
  )

(provide 'init-mail)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-mail.el ends here
