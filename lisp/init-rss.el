;;; init-rss.el --- RSS settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package elfeed
  :ensure t
  :hook ((elfeed-new-entry . (lambda () (elfeed-make-tagger :feed-url "video" :add '(video))
                               (elfeed-make-tagger :entry-title "图卦" :add '(pic)))))
  :bind (("\e\e n" . elfeed)
         :map elfeed-search-mode-map
         ("g" . elfeed-update)
         ("G" . elfeed-search-update--force)
         ("o" . elfeed-default-browser-open)
         :map elfeed-show-mode-map
         ("M-v" . scroll-down-command)
         ("j" . scroll-up-line)
         ("k" . scroll-down-line))
  :config
  (setq elfeed-db-directory "~/.elfeed")
  ;; capture template for elfeed
  (with-eval-after-load 'org-capture
    (add-to-list 'org-capture-templates '("r" "Elfeed RSS" entry (file+headline "capture.org" "Elfeed")
                                          "* %:elfeed-entry-title :READ:\n%?\n%a"
                                          :empty-lines-after 1
                                          :prepend t))
    (add-to-list 'org-capture-templates-contexts '("r" ((in-mode . "elfeed-show-mode")
                                                        (in-mode . "elfeed-search-mode")))))
  ;; ================================
  ;; open entry with browser
  ;; ================================
  (defun elfeed-default-browser-open (&optional use-generic-p)
    "open with default browser"
    (interactive "P")
    (let ((entries (elfeed-search-selected)))
      (cl-loop for entry in entries
               do (elfeed-untag entry 'unread)
               when (elfeed-entry-link entry)
               do (browse-url it))
      (mapc #'elfeed-search-update-entry entries)
      (unless (use-region-p) (forward-line))))
  :custom
  (elfeed-feeds '(
                  ("https://planet.emacslife.com/atom.xml" emacs)
                  ("http://www.dapenti.com/blog/rss2.asp?name=xilei" news)
                  ("https://remacs.cc/index.xml" emacs product)
                  ))
  (elfeed-use-curl t)
  (elfeed-curl-max-connections 10)
  (elfeed-enclosure-default-dir "~/Downloads/")
  (elfeed-search-filter "@4-months-ago +")
  (elfeed-sort-order 'descending)
  (elfeed-search-clipboard-type 'CLIPBOARD)
  (elfeed-search-title-max-width 100)
  (elfeed-search-title-min-width 30)
  (elfeed-search-trailing-width 25)
  (elfeed-show-truncate-long-urls t)
  (elfeed-show-unique-buffers t)
  (elfeed-search-date-format '("%F %R" 16 :left))
  )

(use-package elfeed-goodies
  :ensure t
  :hook (after-init . elfeed-goodies/setup)
  :config
  ;; set elfeed show entry switch function
  (setq elfeed-show-entry-switch #'elfeed-goodies/switch-pane) ; switch-to-buffer, pop-to-buffer
  )

(provide 'init-rss)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-rss.el ends here
