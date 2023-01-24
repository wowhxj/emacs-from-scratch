;;; init-org.el --- Org mode settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package org
  :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . visual-line-mode)
		 (org-mode . my/org-prettify-symbols))
  :commands (org-find-exact-headline-in-buffer org-set-tags)
  :custom-face
  ;; 设置Org mode标题以及每级标题行的大小
  (org-document-title ((t (:height 1.75 :weight bold))))
  (org-level-1 ((t (:height 1.2 :weight bold))))
  (org-level-2 ((t (:height 1.15 :weight bold))))
  (org-level-3 ((t (:height 1.1 :weight bold))))
  (org-level-4 ((t (:height 1.05 :weight bold))))
  (org-level-5 ((t (:height 1.0 :weight bold))))
  (org-level-6 ((t (:height 1.0 :weight bold))))
  (org-level-7 ((t (:height 1.0 :weight bold))))
  (org-level-8 ((t (:height 1.0 :weight bold))))
  (org-level-9 ((t (:height 1.0 :weight bold))))
  ;; 设置代码块用上下边线包裹
  (org-block-begin-line ((t (:underline t :background unspecified))))
  (org-block-end-line ((t (:overline t :underline nil :background unspecified))))
  :config
  ;; ================================
  ;; 在org mode里美化字符串
  ;; ================================
  (defun my/org-prettify-symbols ()
	(setq prettify-symbols-alist
		  (mapcan (lambda (x) (list x (cons (upcase (car x)) (cdr x))))
				  '(
					;; ("[ ]"              . 9744)         ; ☐
					;; ("[X]"              . 9745)         ; ☑
					;; ("[-]"              . 8863)         ; ⊟
					("#+begin_src"      . 9998)         ; ✎
					("#+end_src"        . 9633)         ; □
					("#+begin_example"  . 129083)       ; 🠻
					("#+end_example"    . 129081)       ; 🠹
					("#+results:"       . 9776)         ; ☰
					("#+attr_latex:"    . "🄛")
					("#+attr_html:"     . "🄗")
					("#+attr_org:"      . "🄞")
					("#+name:"          . "🄝")         ; 127261
					("#+caption:"       . "🄒")         ; 127250
					("#+date:"          . "📅")         ; 128197
					("#+author:"        . "💁")         ; 128100
					("#+setupfile:"     . 128221)       ; 📝
					("#+email:"         . 128231)       ; 📧
					("#+startup:"       . 10034)        ; ✲
					("#+options:"       . 9965)         ; ⛭
					("#+title:"         . 10162)        ; ➲
					("#+subtitle:"      . 11146)        ; ⮊
					("#+downloaded:"    . 8650)         ; ⇊
					("#+language:"      . 128441)       ; 🖹
					("#+begin_quote"    . 187)          ; »
					("#+end_quote"      . 171)          ; «
                    ("#+begin_results"  . 8943)         ; ⋯
                    ("#+end_results"    . 8943)         ; ⋯
					)))
    (setq prettify-symbols-unprettify-at-point t)
	(prettify-symbols-mode 1))

  ;; 提升latex预览的图片清晰度
  (plist-put org-format-latex-options :scale 1.8)

  ;; 设置标题行之间总是有空格；列表之间根据情况自动加空格
  (setq org-blank-before-new-entry '((heading . t)
									 (plain-list-item . auto)
									 ))

  ;; ======================================
  ;; 设置打开Org links的程序
  ;; ======================================
  (defun my-func/open-and-play-gif-image (file &optional link)
	"Open and play GIF image `FILE' in Emacs buffer.

Optional for Org-mode file: `LINK'."
	(let ((gif-image (create-image file))
		  (tmp-buf (get-buffer-create "*Org-mode GIF image animation*")))
	  (switch-to-buffer tmp-buf)
	  (erase-buffer)
	  (insert-image gif-image)
	  (image-animate gif-image nil t)
	  (local-set-key (kbd "q") 'bury-buffer)
	  ))
  (setq org-file-apps '(("\\.png\\'"     . default)
                        (auto-mode       . emacs)
                        (directory       . emacs)
                        ("\\.mm\\'"      . default)
                        ("\\.x?html?\\'" . default)
                        ("\\.pdf\\'"     . emacs)
                        ("\\.md\\'"      . emacs)
                        ("\\.gif\\'"     . my-func/open-and-play-gif-image)
                        ("\\.xlsx\\'"    . default)
                        ("\\.svg\\'"     . default)
                        ("\\.pptx\\'"    . default)
                        ("\\.docx\\'"    . default)))

  :custom
  ;; 设置Org mode的目录
  (org-directory "~/org")
  ;; 设置笔记的默认存储位置
  (org-default-notes-file (expand-file-name "capture.org" org-directory))
  ;; 启用一些子模块
  (org-modules '(ol-bibtex ol-gnus ol-info ol-eww org-habit org-protocol))
  ;; 在按M-RET时，是否根据光标所在的位置分行，这里设置为是
  ;; (org-M-RET-may-split-line '((default . nil)))
  ;; 一些Org mode自带的美化设置
  ;; 标题行美化
  (org-fontify-whole-heading-line t)
  ;; 设置标题行折叠符号
  (org-ellipsis " ▾")
  ;; 在活动区域内的所有标题栏执行某些命令
  (org-loop-over-headlines-in-active-region t)
  ;; TODO标签美化
  (org-fontify-todo-headline t)
  ;; DONE标签美化
  (org-fontify-done-headline t)
  ;; 引用块美化
  (org-fontify-quote-and-verse-blocks t)
  ;; 隐藏宏标记
  (org-hide-macro-markers t)
  ;; 隐藏强调标签
  (org-hide-emphasis-markers t)
  ;; 高亮latex语法
  (org-highlight-latex-and-related '(native script entities))
  ;; 以UTF-8显示
  (org-pretty-entities t)
  ;; 是否隐藏标题栏的前置星号，这里我们通过org-modern来隐藏
  ;; (org-hide-leading-stars t)
  ;; 当启用缩进模式时自动隐藏前置星号
  (org-indent-mode-turns-on-hiding-stars t)
  ;; 自动启用缩进
  (org-startup-indented nil)
  ;; 根据标题栏自动缩进文本
  (org-adapt-indentation nil)
  ;; 自动显示图片
  (org-startup-with-inline-images t)
  ;; 默认以Overview的模式展示标题行
  (org-startup-folded 'overview)
  ;; 允许字母列表
  (org-list-allow-alphabetical t)
  ;; 列表的下一级设置
  (org-list-demote-modify-bullet '(
								   ("-"  . "+")
                                   ("+"  . "1.")
								   ("1." . "a.")
								   ))
  ;; 编辑时检查是否在折叠的不可见区域
  (org-fold-catch-invisible-edits 'smart)
  ;; 在当前位置插入新标题行还是在当前标题行后插入，这里设置为当前位置
  (org-insert-heading-respect-content nil)
  ;; 设置图片的最大宽度，如果有imagemagick支持将会改变图片实际宽度
  ;; 四种设置方法：(1080), 1080, t, nil
  (org-image-actual-width nil)
  ;; imenu的最大深度，默认为2
  (org-imenu-depth 4)
  ;; 回车要不要触发链接，这里设置不触发
  (org-return-follows-link nil)
  ;; 上标^下标_是否需要特殊字符包裹，这里设置需要用大括号包裹
  (org-use-sub-superscripts '{})
  ;; 复制粘贴标题行的时候删除id
  (org-clone-delete-id t)
  ;; 粘贴时调整标题行的级别
  (org-yank-adjusted-subtrees t)

  ;; TOOD的关键词设置，可以设置不同的组
  (org-todo-keywords '((sequence "TODO(t)" "HOLD(h!)" "WIP(i!)" "WAIT(w!)" "|" "DONE(d!)" "CANCELLED(c@/!)")
					   (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f!)")))
  ;; TODO关键词的样式设置
  (org-todo-keyword-faces '(("TODO"       :foreground "#7c7c75" :weight bold)
							("HOLD"       :foreground "#feb24c" :weight bold)
							("WIP"        :foreground "#0098dd" :weight bold)
							("WAIT"       :foreground "#9f7efe" :weight bold)
							("DONE"       :foreground "#50a14f" :weight bold)
							("CANCELLED"  :foreground "#ff6480" :weight bold)
							("REPORT"     :foreground "magenta" :weight bold)
							("BUG"        :foreground "red"     :weight bold)
							("KNOWNCAUSE" :foreground "yellow"  :weight bold)
							("FIXED"      :foreground "green"   :weight bold)))
  ;; 当标题行状态变化时标签同步发生的变化
  ;; Moving a task to CANCELLED adds a CANCELLED tag
  ;; Moving a task to WAIT adds a WAIT tag
  ;; Moving a task to HOLD adds WAIT and HOLD tags
  ;; Moving a task to a done state removes WAIT and HOLD tags
  ;; Moving a task to TODO removes WAIT, CANCELLED, and HOLD tags
  ;; Moving a task to DONE removes WAIT, CANCELLED, and HOLD tags
  (org-todo-state-tags-triggers
   (quote (("CANCELLED" ("CANCELLED" . t))
		   ("WAIT" ("WAIT" . t))
		   ("HOLD" ("WAIT") ("HOLD" . t))
		   (done ("WAIT") ("HOLD"))
		   ("TODO" ("WAIT") ("CANCELLED") ("HOLD"))
		   ("DONE" ("WAIT") ("CANCELLED") ("HOLD")))))
  ;; 使用专家模式选择标题栏状态
  (org-use-fast-todo-selection 'expert)
  ;; 父子标题栏状态有依赖
  (org-enforce-todo-dependencies t)
  ;; 标题栏和任务复选框有依赖
  (org-enforce-todo-checkbox-dependencies t)
  ;; 优先级样式设置
  (org-priority-faces '((?A :foreground "red")
						(?B :foreground "orange")
						(?C :foreground "yellow")))
  ;; 标题行全局属性设置
  (org-global-properties '(("EFFORT_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 7:00 8:00")
						   ("APPT_WARNTIME_ALL" . "0 5 10 15 20 25 30 45 60")
						   ("RISK_ALL" . "Low Medium High")
						   ("STYLE_ALL" . "habit")))
  ;; Org columns的默认格式
  (org-columns-default-format "%25ITEM %TODO %SCHEDULED %DEADLINE %3PRIORITY %TAGS %CLOCKSUM %EFFORT{:}")
  ;; 当状态从DONE改成其他状态时，移除 CLOSED: [timestamp]
  (org-closed-keep-when-no-todo t)
  ;; DONE时加上时间戳
  (org-log-done 'time)
  ;; 重复执行时加上时间戳
  (org-log-repeat 'time)
  ;; Deadline修改时加上一条记录
  (org-log-redeadline 'note)
  ;; Schedule修改时加上一条记录
  (org-log-reschedule 'note)
  ;; 以抽屉的方式记录
  (org-log-into-drawer t)
  ;; 紧接着标题行或者计划/截止时间戳后加上记录抽屉
  (org-log-state-notes-insert-after-drawers nil)

  ;; refile使用缓存
  (org-refile-use-cache t)
  ;; refile的目的地，这里设置的是agenda文件的所有标题
  (org-refile-targets '((org-agenda-files . (:maxlevel . 9))))
  ;; 将文件名加入到路径
  (org-refile-use-outline-path 'file)
  ;; 是否按步骤refile
  (org-outline-path-complete-in-steps nil)
  ;; 允许创建新的标题行，但需要确认
  (org-refile-allow-creating-parent-nodes 'confirm)

  ;; 设置标签的默认位置，默认是第77列右对齐
  ;; (org-tags-column -77)
  ;; 自动对齐标签
  (org-auto-align-tags t)
  ;; 标签不继承
  (org-use-tag-inheritance nil)
  ;; 在日程视图的标签不继承
  (org-agenda-use-tag-inheritance nil)
  ;; 标签快速选择
  (org-use-fast-tag-selection t)
  ;; 标签选择不需要回车确认
  (org-fast-tag-selection-single-key t)
  ;; 定义了有序属性的标题行也加上 OREDERD 标签
  (org-track-ordered-property-with-tag t)
  ;; 始终存在的的标签
  (org-tag-persistent-alist '(("read"     . ?r)
							  ("mail"     . ?m)
							  ("emacs"    . ?e)
							  ("study"    . ?s)
							  ("work"     . ?w)))
  ;; 预定义好的标签
  (org-tag-alist '((:startgroup)
				   ("crypt"    . ?c)
				   ("linux"    . ?l)
				   ("apple"    . ?a)
				   ("noexport" . ?n)
				   ("ignore"   . ?i)
				   ("toc"      . ?t)
				   (:endgroup)))

  ;; 归档设置
  (org-archive-location "%s_archive::datetree/")
  )

;; Org mode的附加包，有诸多附加功能
(use-package org-contrib
  :ensure t)

(use-package org-modern
  :ensure t
  :hook (after-init . (lambda ()
                        (setq org-modern-hide-stars 'leading)
                        (global-org-modern-mode t)))
  :config
  ;; 标题行型号字符
  (setq org-modern-star ["◉" "○" "✸" "✳" "◈" "◇" "✿" "❀" "✜"])
  ;; 额外的行间距，0.1表示10%，1表示1px
  (setq-default line-spacing 0.1)
  ;; tag边框宽度，还可以设置为 `auto' 即自动计算
  (setq org-modern-label-border 1)
  ;; 设置表格竖线宽度，默认为3
  (setq org-modern-table-vertical 2)
  ;; 设置表格横线为0，默认为0.1
  (setq org-modern-table-horizontal 0)
  ;; 复选框美化
  (setq org-modern-checkbox
        '((?X . #("▢✓" 0 2 (composition ((2)))))
          (?- . #("▢–" 0 2 (composition ((2)))))
          (?\s . #("▢" 0 1 (composition ((1)))))))
  ;; 列表符号美化
  (setq org-modern-list
        '((?- . "•")
          (?+ . "◦")
          (?* . "▹")))
  ;; 代码块左边加上一条竖边线（需要Org mode顶头，如果启用了 `visual-fill-column-mode' 会很难看）
  (setq org-modern-block-fringe t)
  ;; 代码块类型美化，我们使用了 `prettify-symbols-mode'
  (setq org-modern-block-name nil)
  ;; #+关键字美化，我们使用了 `prettify-symbols-mode'
  (setq org-modern-keyword nil)
  )

(use-package org-appear
  :ensure t
  :hook (org-mode . org-appear-mode)
  :config
  (setq org-appear-autolinks t)
  (setq org-appear-autosubmarkers t)
  (setq org-appear-autoentities t)
  (setq org-appear-autokeywords t)
  (setq org-appear-inside-latex t)
  )

(use-package org-auto-tangle
  :ensure t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t)
  )

(use-package org-capture
  :ensure nil
  :bind ("\e\e c" . (lambda () (interactive) (org-capture)))
  :hook ((org-capture-mode . (lambda ()
                               (setq-local org-complete-tags-always-offer-all-agenda-tags t)))
         (org-capture-mode . delete-other-windows))
  :custom
  (org-capture-use-agenda-date nil)
  ;; define common template
  (org-capture-templates `(("t" "Tasks" entry (file+headline "tasks.org" "Reminders")
                            "* TODO %i%?"
                            :empty-lines-after 1
                            :prepend t)
                           ("n" "Notes" entry (file+headline "capture.org" "Notes")
                            "* %? %^g\n%i\n"
                            :empty-lines-after 1)
                           ;; For EWW
                           ("b" "Bookmarks" entry (file+headline "capture.org" "Bookmarks")
                            "* %:description\n\n%a%?"
                            :empty-lines 1
                            :immediate-finish t)
                           ("d" "Diary")
                           ("dt" "Today's TODO list" entry (file+olp+datetree "diary.org")
                            "* Today's TODO list [/]\n%T\n\n** TODO %?"
                            :empty-lines 1
                            :jump-to-captured t)
                           ("do" "Other stuff" entry (file+olp+datetree "diary.org")
                            "* %?\n%T\n\n%i"
                            :empty-lines 1
                            :jump-to-captured t)
                           ))
  )

(use-package denote
  :ensure t
  :hook (dired-mode . denote-dired-mode-in-directories)
  :bind (("C-c d n" . denote)
         ("C-c d d" . denote-date)
         ("C-c d t" . denote-type)
         ("C-c d s" . denote-subdirectory)
         ("C-c d f" . denote-open-or-create)
         ("C-c d r" . denote-dired-rename-file))
  :init
  (with-eval-after-load 'org-capture
    (setq denote-org-capture-specifiers "%l\n%i\n%?")
    (add-to-list 'org-capture-templates
                 '("N" "New note (with denote.el)" plain
                   (file denote-last-path)
                   #'denote-org-capture
                   :no-save t
                   :immediate-finish nil
                   :kill-buffer t
                   :jump-to-captured t)))
  :config
  (setq denote-directory (expand-file-name "~/org/"))
  (setq denote-known-keywords '("emacs" "entertainment" "reading" "studying"))
  (setq denote-infer-keywords t)
  (setq denote-sort-keywords t)
  ;; org is default, set others such as text, markdown-yaml, markdown-toml
  (setq denote-file-type nil)
  (setq denote-prompts '(title keywords))

  ;; We allow multi-word keywords by default.  The author's personal
  ;; preference is for single-word keywords for a more rigid workflow.
  (setq denote-allow-multi-word-keywords t)
  (setq denote-date-format nil)

  ;; If you use Markdown or plain text files (Org renders links as buttons
  ;; right away)
  (add-hook 'find-file-hook #'denote-link-buttonize-buffer)
  (setq denote-dired-rename-expert nil)

  ;; OR if only want it in `denote-dired-directories':
  (add-hook 'dired-mode-hook #'denote-dired-mode-in-directories)
  )

(use-package consult-notes
  :ensure t
  :commands (consult-notes
             consult-notes-search-in-all-notes)
  :bind (("C-c n f" . consult-notes)
         ("C-c n c" . consult-notes-search-in-all-notes))
  :config
  (setq consult-notes-file-dir-sources
        `(
          ("work"    ?w ,(concat org-directory "/midea/"))
          ("article" ?a ,(concat org-directory "/article/"))
          ("org"     ?o ,(concat org-directory "/"))
          ("hugo"    ?h ,(concat org-directory "/hugo/"))
          ("books"   ?b ,(concat (getenv "HOME") "/Books/"))
          ))

  ;; embark support
  (with-eval-after-load 'embark
    (defun consult-notes-open-dired (cand)
      "Open notes directory dired with point on file CAND."
      (interactive "fNote: ")
      ;; dired-jump is in dired-x.el but is moved to dired in Emacs 28
      (dired-jump nil cand))

    (defun consult-notes-marked (cand)
      "Open a notes file CAND in Marked 2.
Marked 2 is a mac app that renders markdown."
      (interactive "fNote: ")
      (call-process-shell-command (format "open -a \"Marked 2\" \"%s\"" (expand-file-name cand))))

    (defun consult-notes-grep (cand)
      "Run grep in directory of notes file CAND."
      (interactive "fNote: ")
      (consult-grep (file-name-directory cand)))

    (embark-define-keymap consult-notes-map
                          "Keymap for Embark notes actions."
                          :parent embark-file-map
                          ("d" consult-notes-dired)
                          ("g" consult-notes-grep)
                          ("m" consult-notes-marked))

    (add-to-list 'embark-keymap-alist `(,consult-notes-category . consult-notes-map))

    ;; make embark-export use dired for notes
    (setf (alist-get consult-notes-category embark-exporters-alist) #'embark-export-dired)
    )
  )

(use-package org-super-links
  :quelpa (org-super-links :fetcher github :repo "toshism/org-super-links")
  :bind (("C-c s s"   . org-super-links-link)
         ("C-c s l"   . org-super-links-store-link)
         ("C-c s C-l" . org-super-links-insert-link)
         ("C-c s d"   . org-super-links-quick-insert-drawer-link)
         ("C-c s i"   . org-super-links-quick-insert-inline-link)
         ("C-c s C-d" . org-super-links-delete-link))
  :config
  (setq org-super-links-related-into-drawer t)
  (setq	org-super-links-link-prefix 'org-super-links-link-prefix-timestamp))

(use-package org-src
  :ensure nil
  :hook (org-babel-after-execute . org-redisplay-inline-images)
  :bind (("s-l" . show-line-number-in-src-block)
         :map org-src-mode-map
         ("C-c C-c" . org-edit-src-exit))
  :init
  ;; 设置代码块的默认头参数
  (setq org-babel-default-header-args
        '(
          (:eval    . "never-export")     ; 导出时不执行代码块
          (:session . "none")
          (:results . "replace")          ; 执行结果替换
          (:exports . "both")             ; 导出代码和结果
          (:cache   . "no")
          (:noweb   . "no")
          (:hlines  . "no")
          (:wrap    . "results")          ; 结果通过#+begin_results包裹
          (:tangle  . "no")               ; 不写入文件
          ))
  :config
  ;; ==================================
  ;; 如果出现代码运行结果为乱码，可以参考：
  ;; https://github.com/nnicandro/emacs-jupyter/issues/366
  ;; ==================================
  (defun display-ansi-colors ()
    (ansi-color-apply-on-region (point-min) (point-max)))
  (add-hook 'org-babel-after-execute-hook #'display-ansi-colors)

  ;; ==============================================
  ;; 通过overlay在代码块里显示行号，s-l显示，任意键关闭
  ;; ==============================================
  (defvar number-line-overlays '()
    "List of overlays for line numbers.")

  (defun show-line-number-in-src-block ()
    (interactive)
    (save-excursion
      (let* ((src-block (org-element-context))
             (nlines (- (length
                         (s-split
                          "\n"
                          (org-element-property :value src-block)))
                        1)))
        (goto-char (org-element-property :begin src-block))
        (re-search-forward (regexp-quote (org-element-property :value src-block)))
        (goto-char (match-beginning 0))

        (cl-loop for i from 1 to nlines
                 do
                 (beginning-of-line)
                 (let (ov)
                   (setq ov (make-overlay (point) (point)))
                   (overlay-put ov 'before-string (format "%3s | " (number-to-string i)))
                   (add-to-list 'number-line-overlays ov))
                 (next-line))))

    ;; now read a char to clear them
    (read-key "Press a key to clear numbers.")
    (mapc 'delete-overlay number-line-overlays)
    (setq number-line-overlays '()))

  ;; =================================================
  ;; 执行结果后，如果结果所在的文件夹不存在将自动创建
  ;; =================================================
  (defun check-directory-exists-before-src-execution (orig-fun
                                                      &optional arg
                                                      info
                                                      params)
    (when (and (assq ':file (cadr (cdr (org-babel-get-src-block-info))))
               (member (car (org-babel-get-src-block-info)) '("mermaid" "ditaa" "dot" "lilypond" "plantuml" "gnuplot" "d2")))
      (let ((foldername (file-name-directory (alist-get :file (nth 2 (org-babel-get-src-block-info))))))
        (if (not (file-exists-p foldername))
            (mkdir foldername)))))
  (advice-add 'org-babel-execute-src-block :before #'check-directory-exists-before-src-execution)

  ;; =================================================
  ;; 自动给结果的图片加上相关属性
  ;; =================================================
  (setq original-image-width-before-del "400") ; 设置图片的默认宽度为400
  (setq original-caption-before-del "")        ; 设置默认的图示文本为空

  (defun insert-attr-decls ()
    "insert string before babel execution results"
    (insert (concat "\n#+CAPTION:"
                    original-caption-before-del
                    "\n#+ATTR_ORG: :width "
                    original-image-width-before-del
                    "\n#+ATTR_LATEX: :width "
                    (if (>= (/ (string-to-number original-image-width-before-del) 800.0) 1)
                        "1.0"
                      (number-to-string (/ (string-to-number original-image-width-before-del) 800.0)))
                    "\\linewidth :float nil"
                    "\n#+ATTR_HTML: :width "
                    original-image-width-before-del
                    )))

  (defun insert-attr-decls-at (s)
    "insert string right after specific string"
    (let ((case-fold-search t))
      (if (search-forward s nil t)
          (progn
            ;; (search-backward s nil t)
            (insert-attr-decls)))))

  (defun insert-attr-decls-at-results (orig-fun
                                       &optional arg
                                       info
                                       param)
    "insert extra image attributes after babel execution"
    (interactive)
    (progn
      (when (member (car (org-babel-get-src-block-info)) '("mermaid" "ditaa" "dot" "lilypond" "plantuml" "gnuplot" "d2"))
        (setq original-image-width-before-del (number-to-string (if-let* ((babel-width (alist-get :width (nth 2 (org-babel-get-src-block-info))))) babel-width (string-to-number original-image-width-before-del))))
        (save-excursion
          ;; `#+begin_results' for :wrap results, `#+RESULTS:' for non :wrap results
          (insert-attr-decls-at "#+begin_results")))
      (org-redisplay-inline-images)))
  (advice-add 'org-babel-execute-src-block :after #'insert-attr-decls-at-results)

  ;; 再次执行时需要将旧的图片相关参数行删除，并从中头参数中获得宽度参数，参考
  ;; https://emacs.stackexchange.com/questions/57710/how-to-set-image-size-in-result-of-src-block-in-org-mode
  (defun get-attributes-from-src-block-result (&rest args)
    "get information via last babel execution"
    (let ((location (org-babel-where-is-src-block-result))
          ;; 主要获取的是图示文字和宽度信息，下面这个正则就是为了捕获这两个信息
          (attr-regexp "[:blank:]*#\\+\\(ATTR_ORG: :width \\([0-9]\\{3\\}\\)\\|CAPTION:\\(.*\\)\\)"))
      (setq original-caption-before-del "") ; 重置为空
      (when location
        (save-excursion
          (goto-char location)
          (when (looking-at (concat org-babel-result-regexp ".*$"))
            (next-line 2)               ; 因为有个begin_result的抽屉，所以往下2行
            ;; 通过正则表达式来捕获需要的信息
            (while (looking-at attr-regexp)
              (when (match-string 2)
                (setq original-image-width-before-del (match-string 2)))
              (when (match-string 3)
                (setq original-caption-before-del (match-string 3)))
              (next-line)               ; 因为设置了:wrap，所以这里不需要删除这一行
              )
            )))))
  (advice-add 'org-babel-execute-src-block :before #'get-attributes-from-src-block-result)

  :custom
  ;; 代码块语法高亮
  (org-src-fontify-natively t)
  ;; 使用编程语言的TAB绑定设置
  (org-src-tab-acts-natively t)
  ;; 保留代码块前面的空格
  (org-src-preserve-indentation t)
  ;; 代码块编辑窗口的打开方式：当前窗口+代码块编辑窗口
  (org-src-window-setup 'reorganize-frame)
  ;; 执行前是否需要确认
  (org-confirm-babel-evaluate nil)
  ;; 代码块默认前置多少空格
  (org-edit-src-content-indentation 0)
  ;; 代码块的语言模式设置，设置之后才能正确语法高亮
  (org-src-lang-modes '(("C"            . c)
                        ("C++"          . c++)
                        ("bash"         . sh)
                        ("cpp"          . c++)
                        ("elisp"        . emacs-lisp)
                        ("python"       . python)
                        ("shell"        . sh)
                        ("mysql"        . sql)
                        ))
  ;; 在这个阶段，只需要加载默认支持的语言
  (org-babel-load-languages '((python          . t)
                              (awk             . t)
                              (C               . t)
                              (calc            . t)
                              (emacs-lisp      . t)
                              (eshell          . t)
                              (shell           . t)
                              (sql             . t)
                              (css             . t)
                              ))
  )

(use-package plantuml-mode
  :ensure t
  :mode ("\\.plantuml\\'" . plantuml-mode)
  :init
  ;; enable plantuml babel support
  (add-to-list 'org-src-lang-modes '("plantuml" . plantuml))
  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '((plantuml . t))))
  :config
  (setq org-plantuml-exec-mode 'plantuml)
  (setq org-plantuml-executable-path "plantuml")
  (setq plantuml-executable-path "plantuml")
  (setq plantuml-default-exec-mode 'executable)
  ;; set default babel header arguments
  (setq org-babel-default-header-args:plantuml
        '((:exports . "results")
          (:results . "file")
          ))
  )

(use-package gnuplot
  :ensure t
  :mode ("\\.gp$" . gnuplot-mode)
  :init
  (add-to-list 'org-src-lang-modes '("gnuplot" . gnuplot))
  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '((gnuplot . t))))
  :config
  ;; (add-to-list 'auto-mode-alist '("\\.gp$" . gnuplot-mode))
  (setq org-babel-default-header-args:gnuplot
      '((:exports . "results")
        (:results . "file")))
  )

(use-package lilypond-mode
  :ensure nil
  :mode ("\\.i?ly\\'" . LilyPond-mode)
  :init
  (add-to-list 'org-src-lang-modes '("lilypond" . lilypond))
  ;; add support for org babel
  (org-babel-do-load-languages 'org-babel-load-languages
                               (append org-babel-load-languages
                                       '((lilypond . t))))
  ;; set lilypond binary directory
  (setq org-babel-lilypond-ly-command "/usr/local/bin/lilypond -dpreview")
  :config
  ;; ;; trim extra space for generated image
  ;; (defun my/trim-lilypond-png (orig-fun
  ;;                              &optional arg
  ;;                              info
  ;;                              param)
  ;;   (when (member (car (org-babel-get-src-block-info)) '("lilypond"))
  ;;     (let ((ly-file (alist-get :file (nth 2 (org-babel-get-src-block-info)))))
  ;;       (let ((ly-preview-file (replace-regexp-in-string "\\.png" ".preview.png" ly-file)))
  ;;         (when (file-exists-p ly-preview-file)
  ;;           (shell-command (concat "mv " ly-preview-file " " ly-file)))
  ;;         (org-redisplay-inline-images)))))
  ;; (advice-add 'org-babel-execute-src-block :after #'my/trim-lilypond-png)
  (setq ob-lilypond-header-args
        '((:results . "file replace")
          (:exports . "results")
          ))
  )

;; limit the babel result length
(defvar org-babel-result-lines-limit 40)
(defvar org-babel-result-length-limit 6000)

(defun org-babel-insert-result@limit (orig-fn result &rest args)
  (if (not (member (car (org-babel-get-src-block-info)) '("jupyter-python"))) ; not for jupyter-python etc.
    (if (and result (or org-babel-result-lines-limit org-babel-result-length-limit))
        (let (new-result plines plenght limit)
          (with-temp-buffer
            (insert result)
            (setq plines (if org-babel-result-lines-limit
                             (goto-line org-babel-result-lines-limit)
                           (point-max)))
            (setq plenght (if org-babel-result-length-limit
                              (min org-babel-result-length-limit (point-max))
                            (point-max)))
            (setq limit (min plines plenght))
            (setq new-result (concat (buffer-substring (point-min) limit)
                                     (if (< limit (point-max)) "..."))))
          (apply orig-fn new-result args))
      (apply orig-fn result args))
    (apply orig-fn result args)))

(advice-add 'org-babel-insert-result :around #'org-babel-insert-result@limit)

(use-package ox
  :ensure nil
  :custom
  (org-export-with-toc t)
  (org-export-with-tags 'not-in-toc)
  (org-export-with-drawers nil)
  (org-export-with-priority t)
  (org-export-with-footnotes t)
  (org-export-with-smart-quotes t)
  (org-export-with-section-numbers t)
  (org-export-with-sub-superscripts '{})
  ;; `org-export-use-babel' set to nil will cause all source block header arguments to be ignored This means that code blocks with the argument :exports none or :exports results will end up in the export.
  ;; See:
  ;; https://stackoverflow.com/questions/29952543/how-do-i-prevent-org-mode-from-executing-all-of-the-babel-source-blocks
  (org-export-use-babel t)
  (org-export-headline-levels 9)
  (org-export-coding-system 'utf-8)
  (org-export-with-broken-links 'mark)
  (org-export-default-language "zh-CN") ; 默认是en
  ;; (org-ascii-text-width 72)
  )

;; export extra
(use-package ox-extra
  :ensure nil
  :config
  (ox-extras-activate '(ignore-headlines))
  )

(use-package ox-html
  :ensure nil
  :init
  ;; add support for video
  (defun org-video-link-export (path desc backend)
    (let ((ext (file-name-extension path)))
      (cond
       ((eq 'html backend)
        (format "<video width='800' preload='metadata' controls='controls'><source type='video/%s' src='%s' /></video>" ext path))
       ;; fall-through case for everything else
       (t
        path))))
  (org-link-set-parameters "video" :export 'org-video-link-export)
  :custom
  (org-html-doctype "html5")
  (org-html-html5-fancy t)
  (org-html-checkbox-type 'unicode)
  (org-html-validation-link nil))

(use-package htmlize
  :ensure t
  :custom
  (htmlize-pre-style t)
  (htmlize-output-type 'inline-css))

(use-package ox-latex
  :ensure nil
  :defer t
  :config
  (add-to-list 'org-latex-classes
               '("cn-article"
                 "\\documentclass[UTF8,a4paper]{article}"
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                 ("\\paragraph{%s}" . "\\paragraph*{%s}")
                 ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))

  (add-to-list 'org-latex-classes
               '("cn-report"
                 "\\documentclass[11pt,a4paper]{report}"
                 ("\\chapter{%s}" . "\\chapter*{%s}")
                 ("\\section{%s}" . "\\section*{%s}")
                 ("\\subsection{%s}" . "\\subsection*{%s}")
                 ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))
  (setq org-latex-default-class "cn-article")
  (setq org-latex-image-default-height "0.9\\textheight"
        org-latex-image-default-width "\\linewidth")
  (setq org-latex-pdf-process
	    '("xelatex -interaction nonstopmode -output-directory %o %f"
	      "bibtex %b"
	      "xelatex -interaction nonstopmode -output-directory %o %f"
	      "xelatex -interaction nonstopmode -output-directory %o %f"
	      "rm -fr %b.out %b.log %b.tex %b.brf %b.bbl auto"
	      ))
  ;; 使用 Listings 宏包格式化源代码(只是把代码框用 listing 环境框起来，还需要额外的设置)
  (setq org-latex-listings t)
  ;; mapping jupyter-python to Python
  (add-to-list 'org-latex-listings-langs '(jupyter-python "Python"))
  ;; Options for \lset command（reference to listing Manual)
  (setq org-latex-listings-options
        '(
          ("basicstyle" "\\small\\ttfamily")       ; 源代码字体样式
          ("keywordstyle" "\\color{eminence}\\small")                 ; 关键词字体样式
          ;; ("identifierstyle" "\\color{doc}\\small")
          ("commentstyle" "\\color{commentgreen}\\small\\itshape")    ; 批注样式
          ("stringstyle" "\\color{red}\\small")                       ; 字符串样式
          ("showstringspaces" "false")                                ; 字符串空格显示
          ("numbers" "left")                                          ; 行号显示
          ("numberstyle" "\\color{preprocess}")                       ; 行号样式
          ("stepnumber" "1")                                          ; 行号递增
          ("xleftmargin" "2em")                                       ;
          ;; ("backgroundcolor" "\\color{background}")                   ; 代码框背景色
          ("tabsize" "4")                                             ; TAB 等效空格数
          ("captionpos" "t")                                          ; 标题位置 top or buttom(t|b)
          ("breaklines" "true")                                       ; 自动断行
          ("breakatwhitespace" "true")                                ; 只在空格分行
          ("showspaces" "false")                                      ; 显示空格
          ("columns" "flexible")                                      ; 列样式
          ("frame" "tb")                                              ; 代码框：single, or tb 上下线
          ("frameleftmargin" "1.5em")                                 ; frame 向右偏移
          ;; ("frameround" "tttt")                                       ; 代码框： 圆角
          ;; ("framesep" "0pt")
          ;; ("framerule" "1pt")                                         ; 框的线宽
          ;; ("rulecolor" "\\color{background}")                         ; 框颜色
          ;; ("fillcolor" "\\color{white}")
          ;; ("rulesepcolor" "\\color{comdil}")
          ("framexleftmargin" "5mm")                                  ; let line numer inside frame
          ))
  )

(use-package ox-reveal
  :ensure t
  :after ox
  :config
  (setq org-reveal-hlevel 1)
  ;; Avalable themes: night, black, white, league, beige, sky, serif, simple, solarized, blood, moon
  (setq org-reveal-theme "moon")
  ;; can also set root to a CDN cloud: https://cdn.jsdelivr.net/npm/reveal.js
  (setq org-reveal-root (expand-file-name "reveal.js" user-emacs-directory))
  (setq org-reveal-mathjax t)
  (setq org-reveal-ignore-speaker-notes t)
  ;; original title font size is TOO large!
  (setq org-reveal-title-slide "<h1><font size=\"8\">%t</font></h1><h2><font size=\"6\">%s</font></h2><p><font size=\"5\">%a</font><br/><font size=\"5\">%d</font></p>")
  ;; don't load highlight, use htmlize instead. If you want to add line-number, add -n in src block header
  (setq org-reveal-plugins '(markdown zoom notes search))
  (setq org-reveal-klipsify-src 'on)
  (setq org-reveal-extra-css (expand-file-name "reveal.js/css/extra.css" user-emacs-directory))
  )

(use-package ox-gfm
  :ensure t
  :after ox)

(use-package ox-pandoc
  :ensure t
  :custom
  ;; special extensions for markdown_github output
  (org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))
  (org-pandoc-command "/usr/local/bin/pandoc")
  )

(use-package ox-publish
  :ensure nil
  :commands (org-publish org-publish-all)
  :config
  (setq org-export-global-macros
      '(("timestamp" . "@@html:<span class=\"timestamp\">[$1]</span>@@")))

  ;; sitemap 生成函数
  (defun my/org-sitemap-date-entry-format (entry style project)
    "Format ENTRY in org-publish PROJECT Sitemap format ENTRY ENTRY STYLE format that includes date."
    (let ((filename (org-publish-find-title entry project)))
      (if (= (length filename) 0)
          (format "*%s*" entry)
        (format "{{{timestamp(%s)}}} [[file:%s][%s]]"
                (format-time-string "%Y-%m-%d"
                                    (org-publish-find-date entry project))
                entry
                filename))))

  ;; 设置 org-publish 的项目列表
  (setq org-publish-project-alist
        '(
          ;; 笔记部分
          ("org-notes"
           :base-directory "~/org/"
           :base-extension "org"
           :exclude "\\(tasks\\|test\\|scratch\\|diary\\|capture\\|mail\\|habits\\|resume\\|meetings\\|personal\\|org-beamer-example\\)\\.org\\|test\\|article\\|roam\\|hugo"
           :publishing-directory "~/public_html/"
           :recursive t                 ; include subdirectories if t
           :publishing-function org-html-publish-to-html
           :headline-levels 6
           :auto-preamble t
           :auto-sitemap t
           :sitemap-filename "sitemap.org"
           :sitemap-title "Sitemap"
           :sitemap-format-entry my/org-sitemap-date-entry-format)

          ;; 静态资源部分
          ("org-static"
           :base-directory "~/org/"
           :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|mov"
           :publishing-directory "~/public_html/"
           :recursive t
           :publishing-function org-publish-attachment)

          ;; 项目集合
          ("org"
           :components ("org-notes" "org-static"))
          ))
  )

(use-package ox-hugo
  :ensure t
  :config
  (with-eval-after-load 'org-capture
    (defun org-hugo-new-subtree-post-capture-template ()
      "Returns `org-capture' template string for new Hugo post.
See `org-capture-templates' for more information."
      (let* ((title (read-from-minibuffer "Post Title: ")) ; Prompt to enter the post title
             (fname (org-hugo-slug title)))
        (mapconcat #'identity
                   `(
                     ,(concat "* TODO " title)
                     ":PROPERTIES:"
                     ,(concat ":EXPORT_FILE_NAME: " fname)
                     ":END:"
                     "%?\n")          ; Place the cursor here finally
                   "\n")))

    (add-to-list 'org-capture-templates
                 '("h"                ; `org-capture' binding + h
                   "Hugo post"
                   entry
                   ;; It is assumed that below file is present in `org-directory'
                   ;; and that it has a "Blog Ideas" heading. It can even be a
                   ;; symlink pointing to the actual location of capture.org!
                   (file+olp "capture.org" "Notes")
                   (function org-hugo-new-subtree-post-capture-template))))
  )

(use-package emacs
  :ensure nil
  :after org
  :bind (:map org-mode-map
              ("s-V" . my/org-insert-clipboard-image))
  :config
  (defun my/org-insert-clipboard-image (width)
    "create a time stamped unique-named file from the clipboard in the sub-directory
 (%filename.assets) as the org-buffer and insert a link to this file."
    (interactive (list
                  (read-string (format "Input image width, default is 800: ")
                               nil nil "800")))
    ;; 设置图片存放的文件夹位置为 `当前Org文件同名.assets'
    (setq foldername (concat (file-name-base (buffer-file-name)) ".assets/"))
    (if (not (file-exists-p foldername))
        (mkdir foldername))
    ;; 设置图片的文件名，格式为 `img_年月日_时分秒.png'
    (setq imgName (concat "img_" (format-time-string "%Y%m%d_%H%M%S") ".png"))
    ;; 图片文件的相对路径
    (setq relativeFilename (concat (file-name-base (buffer-name)) ".assets/" imgName))
    ;; 根据不同的操作系统设置不同的命令行工具
    (cond ((string-equal system-type "gnu/linux")
           (shell-command (concat "xclip -selection clipboard -t image/png -o > " relativeFilename)))
          ((string-equal system-type "darwin")
           (shell-command (concat "pngpaste " relativeFilename))))
    ;; 给粘贴好的图片链接加上宽度属性，方便导出
    (insert (concat "\n#+DOWNLOADED: screenshot @ "
                    (format-time-string "%Y-%m-%d %a %H:%M:%S" (current-time))
                    "\n#+CAPTION: \n#+ATTR_ORG: :width "
                    width
                    "\n#+ATTR_LATEX: :width "
                    (if (>= (/ (string-to-number width) 800.0) 1.0)
                        "1.0"
                      (number-to-string (/ (string-to-number width) 800.0)))
                    "\\linewidth :float nil\n"
                    "#+ATTR_HTML: :width "
                    width
                    "\n[[file:" relativeFilename "]]\n"))
    ;; 重新显示一下图片
    (org-redisplay-inline-images)
    )
  )

(use-package toc-org
  :ensure t
  :hook (org-mode . toc-org-mode))

(use-package ol
  :ensure nil
  :defer t
  :custom
  (org-link-keep-stored-after-insertion t)
  (org-link-abbrev-alist '(("github"        . "https://github.com/")
                           ("gitlab"        . "https://gitlab.com/")
                           ("google"        . "https://google.com/search?q=")
                           ("baidu"         . "https://baidu.com/s?wd=")
                           ("rfc"           . "https://tools.ietf.org/html/")
                           ("wiki"          . "https://en.wikipedia.org/wiki/")
                           ("youtube"       . "https://youtube.com/watch?v=")
                           ("zhihu"         . "https://zhihu.com/question/"))))

(provide 'init-org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
