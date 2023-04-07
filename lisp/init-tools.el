;;; init-tools.el --- Tools settings -*- lexical-binding: t -*-
;;; Commentary: Useful tools to make Emacs efficient!

;;; Code:

(use-package helpful
  :ensure t
  :commands (helpful-callable helpful-variable helpful-command helpful-key helpful-mode)
  :bind (([remap describe-command] . helpful-command)
         ("C-h f" . helpful-callable)
         ("C-h v" . helpful-variable)
         ("C-h s" . helpful-symbol)
         ("C-h S" . describe-syntax)
         ("C-h m" . describe-mode)
         ("C-h F" . describe-face)
         ([remap describe-key] . helpful-key))
  )

(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode)
  :config
  (which-key-add-key-based-replacements
    "C-c !" "flycheck"
    "C-c @" "hideshow"
    "C-c i" "ispell"
    "C-c t" "hl-todo"
    "C-x a" "abbrev"
    "C-x n" "narrow"
    "C-x t" "tab")
  :custom
  (which-key-idle-delay 0.7)
  (which-key-add-column-padding 1))

;; 这个插件依赖于 `posframe' 这个插件
(use-package posframe
  :ensure t
  )

(use-package sdcv
  :quelpa (sdcv :fetcher github :repo "manateelazycat/sdcv")
  :commands (sdcv-search-pointer+)
  :bind ("C-," . sdcv-search-pointer+)
  :config
  (setq sdcv-say-word-p t)
  (setq sdcv-dictionary-data-dir (expand-file-name "~/Backup/stardict/"))
  (setq sdcv-dictionary-simple-list
        '("懒虫简明英汉词典"
          "懒虫简明汉英词典"))
  (setq sdcv-dictionary-complete-list
        '("朗道英汉字典5.0"
          "牛津英汉双解美化版"
          "21世纪双语科技词典"
          "quick_eng-zh_CN"
          "新世纪英汉科技大词典"))
  (setq sdcv-tooltip-timeout 10)
  (setq sdcv-fail-notify-string "没找到释义")
  (setq sdcv-tooltip-border-width 2)
  )

(use-package fanyi
  :ensure t
  :bind-keymap ("\e\e =" . fanyi-map)
  :bind (:map fanyi-map
              ("w" . fanyi-dwim2)
              ("i" . fanyi-dwim))
  :init
  ;; to support `org-store-link' and `org-insert-link'
  (require 'ol-fanyi)
  ;; 如果当前指针下有单词，选择当前单词，否则选择剪贴板
  (with-eval-after-load 'org-capture
    (add-to-list 'org-capture-templates
                 '("w" "New word" entry (file+olp+datetree "20221001T221032--vocabulary__studying.org" "New")
                   "* %^{Input the new word:|%(cond ((with-current-buffer (org-capture-get :original-buffer) (thing-at-point 'word 'no-properties))) ((clipboard/get)))}\n\n[[fanyi:%\\1][%\\1]]\n\n[[http://dict.cn/%\\1][海词：%\\1]]%?"
                   :tree-type day
                   :empty-lines 1
                   :jump-to-captured t)))
  :config
  (defvar fanyi-map nil "keymap for `fanyi")
  (setq fanyi-map (make-sparse-keymap))
  (setq fanyi-sound-player "mpv")
  :custom
  (fanyi-providers '(;; 海词
                     fanyi-haici-provider
                     ;; 有道同义词词典
                     fanyi-youdao-thesaurus-provider
                     ;; ;; Etymonline
                     ;; fanyi-etymon-provider
                     ;; Longman
                     fanyi-longman-provider
                     ;; ;; LibreTranslate
                     ;; fanyi-libre-provider
                     )))

(use-package org-ai
  :ensure t
  :bind (
         ("C-c q" . org-ai-prompt)
         ("C-c x" . org-ai-on-region)
         )
  :hook (org-mode . org-ai-mode)
  :config
  ;; (setq org-ai-openai-api-token "Your Key") ; 以明文的方式存储key，或者放入到 ~/.authinfo.gpg 文件里
  (setq org-ai-default-max-tokens 480)
  (setq org-ai-default-chat-system-prompt "你是一个Emacs助手，请以Org-mode的格式来回复我")
  )

(provide 'init-tools)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-tools.el ends here
