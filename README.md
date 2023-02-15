# 目录 <span class="tag" tag-name="toc"><span class="smallcaps">toc</span></span>

- [early-init.el](#early-initel)
- [init.el](#initel)
  - [init.el 文件头](#initel-文件头)
  - [package包管理配置](#package包管理配置)
  - [安装use-package插件](#安装use-package插件)
  - [quelpa包管理器](#quelpa包管理器)
  - [加载模块化配置](#加载模块化配置)
  - [init.el 文件尾](#initel-文件尾)
- [init-ui.el](#init-uiel)
  - [init-ui.el 文件头](#init-uiel-文件头)
  - [ef主题](#ef主题)
  - [字体设置](#字体设置)
  - [窗口设置](#窗口设置)
  - [其他UI零散设置项](#其他ui零散设置项)
  - [编码设置](#编码设置)
  - [模式栏设置](#模式栏设置)
  - [notifications通知管理](#notifications通知管理)
  - [图标设置](#图标设置)
  - [init-ui.el 文件尾](#init-uiel-文件尾)
- [init-base.el](#init-baseel)
  - [init-base.el 文件头](#init-baseel-文件头)
  - [no-littering让配置目录简洁](#no-littering让配置目录简洁)
  - [savehist记住迷你缓冲区历史](#savehist记住迷你缓冲区历史)
  - [saveplace记住每个文件的光标位置](#saveplace记住每个文件的光标位置)
  - [recentf最近打开的文件历史](#recentf最近打开的文件历史)
  - [undo-tree撤销设置](#undo-tree撤销设置)
  - [super-save自动保存](#super-save自动保存)
  - [crux系统增强](#crux系统增强)
  - [个人函数定义](#个人函数定义)
  - [别名定义](#别名定义)
  - [init-base.el 文件尾](#init-baseel-文件尾)
- [init-edit.el](#init-editel)
  - [init-edit.el 文件头](#init-editel-文件头)
  - [Emacs备份设置](#emacs备份设置)
  - [解除一些不常用的快捷键](#解除一些不常用的快捷键)
  - [delsel选择文本输入时直接替换](#delsel选择文本输入时直接替换)
  - [自动重载设置](#自动重载设置)
  - [avy光标移动](#avy光标移动)
  - [multiple-cursors多光标编辑](#multiple-cursors多光标编辑)
  - [init-edit.el 文件尾](#init-editel-文件尾)
- [init-org.el](#init-orgel)
  - [init-org.el 文件头](#init-orgel-文件头)
  - [Org mode基本配置](#org-mode基本配置)
  - [org-modern 美化](#org-modern-美化)
  - [org-appear自动展开强调链接](#org-appear自动展开强调链接)
  - [org-auto-tangle自动tangle设置](#org-auto-tangle自动tangle设置)
  - [org-capture快速记录设置](#org-capture快速记录设置)
  - [denote笔记设置](#denote笔记设置)
  - [consult-notes查找笔记](#consult-notes查找笔记)
  - [org-super-links反链设置](#org-super-links反链设置)
  - [org-src代码块基础配置](#org-src代码块基础配置)
  - [org babel代码块后端](#org-babel代码块后端)
  - [限制代码块结果长度](#限制代码块结果长度)
  - [ox文件导出通用设置](#ox文件导出通用设置)
  - [org导出后端设置](#org导出后端设置)
  - [图片粘贴](#图片粘贴)
  - [toc-org目录自动生成](#toc-org目录自动生成)
  - [ol新增链接类型](#ol新增链接类型)
  - [Org mode 任务管理](#org-mode-任务管理)
  - [init-org.el 文件尾](#init-orgel-文件尾)
- [init-completion.el](#init-completionel)
  - [init-completion.el 文件头](#init-completionel-文件头)
  - [vertico](#vertico)
  - [orderless](#orderless)
  - [marginalia](#marginalia)
  - [consult](#consult)
  - [corfu](#corfu)
  - [yasnippet模板补全](#yasnippet模板补全)
  - [all-the-icons-completion补全图标美化](#all-the-icons-completion补全图标美化)
  - [embark](#embark)
  - [init-completion.el 文件尾](#init-completionel-文件尾)
- [init-dired.el](#init-diredel)
  - [init-dired.el 文件头](#init-diredel-文件头)
  - [Dired基础配置](#dired基础配置)
  - [diredfl多彩美化](#diredfl多彩美化)
  - [all-the-icons-dired图标美化](#all-the-icons-dired图标美化)
  - [dirvish文件管理](#dirvish文件管理)
  - [init-dired.el 文件尾](#init-diredel-文件尾)
- [init-tools.el](#init-toolsel)
  - [init-tools.el 文件头](#init-toolsel-文件头)
  - [helpful帮助增强](#helpful帮助增强)
  - [which-key快捷键](#which-key快捷键)
  - [init-tools.el 文件尾](#init-toolsel-文件尾)
- [init-dev.el](#init-devel)
  - [init-dev.el 文件头](#init-devel-文件头)
  - [vc设置](#vc设置)
  - [magit版本管理](#magit版本管理)
  - [diff-hl高亮显示修改的部分](#diff-hl高亮显示修改的部分)
  - [magit-delta增强git diff](#magit-delta增强git-diff)
  - [paren高亮匹配的括号](#paren高亮匹配的括号)
  - [rainbow-delimeters多彩括号](#rainbow-delimeters多彩括号)
  - [emacs-lisp语言设置](#emacs-lisp语言设置)
  - [Python语言设置](#python语言设置)
  - [Shell语言设置](#shell语言设置)
  - [init-dev.el 文件尾](#init-devel-文件尾)
- [init-mail.el](#init-mailel)
  - [init-mail.el 文件头](#init-mailel-文件头)
  - [notmuch邮件系统](#notmuch邮件系统)
  - [邮件发送配置](#邮件发送配置)
  - [邮件系统通知](#邮件系统通知)
  - [init-mail.el 文件尾](#init-mailel-文件尾)
- [init-rss.el](#init-rssel)
  - [init-rss.el 文件头](#init-rssel-文件头)
  - [elfeed](#elfeed)
  - [elfeed-goodies给elfeed优化增强](#elfeed-goodies给elfeed优化增强)
  - [init-rss.el 文件尾](#init-rssel-文件尾)
- [init-shell.el](#init-shellel)
  - [init-shell.el 文件头](#init-shellel-文件头)
  - [eshell 基本配置](#eshell-基本配置)
  - [eshell alias 设置](#eshell-alias-设置)
  - [eshell 里的 C-d](#eshell-里的-c-d)
  - [Eshell 的命令历史](#eshell-的命令历史)
  - [有些命令使用 term](#有些命令使用-term)
  - [eshell-git-prompt 命令行主题](#eshell-git-prompt-命令行主题)
  - [eshell-syntax-highlighting
    语法高亮](#eshell-syntax-highlighting-语法高亮)
  - [esh-autosuggest自动补全](#esh-autosuggest自动补全)
  - [eshell-up快速进入父级文件夹](#eshell-up快速进入父级文件夹)
  - [init-shell.el 文件尾](#init-shellel-文件尾)

# early-init.el

在Emacs刚启动，还未加载主要配置文件时的配置文件。

``` commonlisp
;;; early-init.el --- Emacs pre-initialization config -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

;; 设置垃圾回收参数
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.6)

;; 启动早期不加载`package.el'包管理器
(setq package-enable-at-startup nil)
;; 不从包缓存中加载
(setq package-quickstart nil)

;; 禁止展示菜单栏、工具栏和纵向滚动条
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; 禁止自动缩放窗口先
(setq frame-inhibit-implied-resize t)

;; 禁止菜单栏、工具栏、滚动条模式，禁止启动屏幕和文件对话框
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq use-file-dialog nil)

;; 在这个阶段不编译
(setq comp-deferred-compilation nil)

(provide 'early-init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; early-init.el ends here
```

# init.el

`init.el` 是Emacs的主要配置文件。

## init.el 文件头

``` commonlisp
;;; init.el --- The main init entry for Emacs -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## package包管理配置

``` commonlisp
(require 'package)
(setq package-archives
      '(("melpa"  . "https://melpa.org/packages/")
        ("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)
```

## 安装use-package插件

[use-package](https://github.com/jwiegley/use-package)
是一个让Emacs配置更加结构化更加清晰的一个宏插件。

``` commonlisp
;; 安装 `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; 配置 `use-package'
(eval-and-compile
  (setq use-package-always-ensure nil)
  (setq use-package-always-defer nil)
  (setq use-package-expand-minimally nil)
  (setq use-package-enable-imenu-support t)
  (if (daemonp)
      (setq use-package-always-demand t)))

(eval-when-compile
  (require 'use-package))

;; 安装 `use-package' 的集成模块
(use-package use-package-ensure-system-package
  :ensure t)
(use-package diminish
  :ensure t)
(use-package bind-key
  :ensure t)
```

## quelpa包管理器

[quelpa](https://github.com/quelpa/quelpa) 是配合 `package.el`
使用的，基于git的一个包管理器。

``` commonlisp
;; 安装 `quelpa'
(use-package quelpa
  :ensure t
  :commands quelpa
  :config
  :custom
  (quelpa-git-clone-depth 1)
  (quelpa-update-melpa-p nil)
  (quelpa-self-upgrade-p nil)
  (quelpa-checkout-melpa-p nil))

;; `quelpa' 与 `use-package' 集成
(use-package quelpa-use-package
  :ensure t)
```

## 加载模块化配置

``` commonlisp
;; 将lisp目录放到加载路径的前面以加快启动速度
(let ((dir (locate-user-emacs-file "lisp")))
  (add-to-list 'load-path (file-name-as-directory dir)))

;; 加载各模块化配置
;; 不要在`*message*'缓冲区显示加载模块化配置的信息
(with-temp-message ""
  (require 'init-base)                  ; 一些基本配置
  (require 'init-ui)                    ; UI交互
  (require 'init-edit)                  ; 编辑行为
  (require 'init-org)                   ; org相关设置
  (require 'init-completion)            ; 补全系统
  (require 'init-dired)                 ; 文件管理
  (require 'init-tools)                 ; 相关工具
  (require 'init-dev)                   ; 开发相关配置
  (require 'init-mail)                  ; 邮件配置
  (require 'init-rss)                   ; RSS配置
  (require 'init-shell)                 ; Shell配置
  )
```

## init.el 文件尾

``` commonlisp

(provide 'init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
```

# init-ui.el

## init-ui.el 文件头

``` commonlisp
;;; init-ui.el --- UI settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## ef主题

[ef themes](https://protesilaos.com/emacs/ef-themes)
是我非常喜欢的一个主题包。

``` commonlisp
(use-package ef-themes
  :ensure t
  :bind ("C-c t" . ef-themes-toggle)
  :init
  ;; set two specific themes and switch between them
  (setq ef-themes-to-toggle '(ef-summer ef-winter))
  ;; set org headings and function syntax
  (setq ef-themes-headings
        '((0 . (bold 1))
          (1 . (bold 1))
          (2 . (rainbow bold 1))
          (3 . (rainbow bold 1))
          (4 . (rainbow bold 1))
          (t . (rainbow bold 1))))
  (setq ef-themes-region '(intense no-extend neutral))
  ;; Disable all other themes to avoid awkward blending:
  (mapc #'disable-theme custom-enabled-themes)

  ;; Load the theme of choice:
  ;; The themes we provide are recorded in the `ef-themes-dark-themes',
  ;; `ef-themes-light-themes'.

  ;; 如果你不喜欢随机主题，也可以直接固定选择一个主题，如下：
  ;; (ef-themes-select 'ef-summer)

  ;; 随机挑选一款主题，如果是命令行打开Emacs，则随机挑选一款黑色主题
  (if (display-graphic-p)
      (ef-themes-load-random)
    (ef-themes-load-random 'dark))

  :config
  ;; auto change theme, aligning with system themes.
  (defun my/apply-theme (appearance)
    "Load theme, taking current system APPEARANCE into consideration."
    (mapc #'disable-theme custom-enabled-themes)
    (pcase appearance
      ('light (if (display-graphic-p) (ef-themes-load-random 'light) (ef-themes-load-random 'dark)))
      ('dark (ef-themes-load-random 'dark))))

  (if (eq system-type 'darwin)
      ;; only for emacs-plus
      (add-hook 'ns-system-appearance-change-functions #'my/apply-theme)
    (ef-themes-select 'ef-summer)
    )
  )
```

## 字体设置

[fontaine](https://protesilaos.com/emacs/fontaine)
插件可以根据需要高度定制字体。

> 这篇文章可以作为字体设置的参考：
> <http://xahlee.info/emacs/emacs/emacs_list_and_set_font.html>

``` commonlisp
(use-package fontaine
  :ensure t
  :when (display-graphic-p)
  ;; :hook (kill-emacs . fontaine-store-latest-preset)
  :config
  (setq fontaine-latest-state-file
        (locate-user-emacs-file "etc/fontaine-latest-state.eld"))
  (setq fontaine-presets
        '((regular
           :default-height 140
           :default-weight regular
           :fixed-pitch-height 1.0
           :variable-pitch-height 1.0
           )
          (large
           :default-height 180
           :default-weight normal
           :fixed-pitch-height 1.0
           :variable-pitch-height 1.05
           )
          (t
           :default-family "Source Code Pro"
           :fixed-pitch-family "Source Code Pro"
           :variable-pitch-family "Source Code Pro"
           :italic-family "Source Code Pro"
           :variable-pitch-weight normal
           :bold-weight normal
           :italic-slant italic
           :line-spacing 0.1)
          ))
  ;; (fontaine-set-preset (or (fontaine-restore-latest-preset) 'regular))
  (fontaine-set-preset 'regular)

  ;; set emoji font
  (set-fontset-font
   t
   (if (version< emacs-version "28.1")
       '(#x1f300 . #x1fad0)
     'emoji)
   (cond
    ((member "Noto Emoji" (font-family-list)) "Noto Emoji")
    ((member "Symbola" (font-family-list)) "Symbola")
    ((member "Apple Color Emoji" (font-family-list)) "Apple Color Emoji")
    ((member "Noto Color Emoji" (font-family-list)) "Noto Color Emoji")
    ((member "Segoe UI Emoji" (font-family-list)) "Segoe UI Emoji")
    ))

  ;; set Chinese font
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
    (set-fontset-font
     (frame-parameter nil 'font)
     charset
     (font-spec :family
                (cond
                 ((eq system-type 'darwin)
                  (cond
                   ((member "Sarasa Mono SC Nerd" (font-family-list)) "Sarasa Mono SC Nerd")
                   ((member "PingFang SC" (font-family-list)) "PingFang SC")
                   ((member "WenQuanYi Zen Hei" (font-family-list)) "WenQuanYi Zen Hei")
                   ((member "Microsoft YaHei" (font-family-list)) "Microsoft YaHei")
                   ))
                 ((eq system-type 'gnu/linux)
                  (cond
                   ((member "Sarasa Mono SC Nerd" (font-family-list)) "Sarasa Mono SC Nerd")
                   ((member "WenQuanYi Micro Hei" (font-family-list)) "WenQuanYi Micro Hei")
                   ((member "WenQuanYi Zen Hei" (font-family-list)) "WenQuanYi Zen Hei")
                   ((member "Microsoft YaHei" (font-family-list)) "Microsoft YaHei")
                   ))
                 (t
                  (cond
                   ((member "Sarasa Mono SC Nerd" (font-family-list)) "Sarasa Mono SC Nerd")
                   ((member "Microsoft YaHei" (font-family-list)) "Microsoft YaHei")
                   )))
                )))

  ;; set Chinese font scale
  (setq face-font-rescale-alist `(
                                  ("Symbola"             . 1.3)
                                  ("Microsoft YaHei"     . 1.2)
                                  ("WenQuanYi Zen Hei"   . 1.2)
                                  ("Sarasa Mono SC Nerd" . 1.2)
                                  ("PingFang SC"         . 1.16)
                                  ("Lantinghei SC"       . 1.16)
                                  ("Kaiti SC"            . 1.16)
                                  ("Yuanti SC"           . 1.16)
                                  ("Apple Color Emoji"   . 0.91)
                                  ))
  )
```

|      |     |
|------|-----|
| 中文 |     |
| abcd |     |

测试中英文字体对齐

## 窗口设置

### 调整启动窗口大小

在Mac下，我的默认启动窗口大小

``` commonlisp
;; 设置窗口大小，仅仅在图形界面需要设置
(when (display-graphic-p)
  (let ((top    0)                                     ; 顶不留空
        (left   (/ (x-display-pixel-width) 10))        ; 左边空10%
        (height (round (* 0.8                          ; 窗体高度为0.8倍的显示高度
                          (/ (x-display-pixel-height)
                             (frame-char-height))))))
    (let ((width  (round (* 2.5 height))))             ; 窗体宽度为2.5倍高度
      (setq default-frame-alist nil)
      (add-to-list 'default-frame-alist (cons 'top top))
      (add-to-list 'default-frame-alist (cons 'left left))
      (add-to-list 'default-frame-alist (cons 'height height))
      (add-to-list 'default-frame-alist (cons 'width width)))))
```

## 其他UI零散设置项

``` commonlisp
;; 禁用一些GUI特性
(setq use-dialog-box nil)               ; 鼠标操作不使用对话框
(setq inhibit-default-init t)           ; 不加载 `default' 库
(setq inhibit-startup-screen t)         ; 不加载启动画面
(setq inhibit-startup-message t)        ; 不加载启动消息
(setq inhibit-startup-buffer-menu t)    ; 不显示缓冲区列表

;; 草稿缓冲区默认文字设置
(setq initial-scratch-message (concat ";; Happy hacking, "
                                      (capitalize user-login-name) " - Emacs ♥ you!\n\n"))

;; 设置缓冲区的文字方向为从左到右
(setq bidi-paragraph-direction 'left-to-right)
;; 禁止使用双向括号算法
;; (setq bidi-inhibit-bpa t)

;; 设置自动折行宽度为80个字符，默认值为70
(setq-default fill-column 80)

;; 设置大文件阈值为100MB，默认10MB
(setq large-file-warning-threshold 100000000)

;; 以16进制显示字节数
(setq display-raw-bytes-as-hex t)
;; 有输入时禁止 `fontification' 相关的函数钩子，能让滚动更顺滑
(setq redisplay-skip-fontification-on-input t)

;; 禁止响铃
(setq ring-bell-function 'ignore)

;; 禁止闪烁光标
(blink-cursor-mode -1)

;; 在光标处而非鼠标所在位置粘贴
(setq mouse-yank-at-point t)

;; 拷贝粘贴设置
(setq select-enable-primary nil)        ; 选择文字时不拷贝
(setq select-enable-clipboard t)        ; 拷贝时使用剪贴板

;; 鼠标滚动设置
(setq scroll-step 2)
(setq scroll-margin 2)
(setq hscroll-step 2)
(setq hscroll-margin 2)
(setq scroll-conservatively 101)
(setq scroll-up-aggressively 0.01)
(setq scroll-down-aggressively 0.01)
(setq scroll-preserve-screen-position 'always)

;; 对于高的行禁止自动垂直滚动
(setq auto-window-vscroll nil)

;; 设置新分屏打开的位置的阈值
(setq split-width-threshold (assoc-default 'width default-frame-alist))
(setq split-height-threshold nil)

;; TAB键设置，在Emacs里不使用TAB键，所有的TAB默认为4个空格
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)

;; yes或no提示设置，通过下面这个函数设置当缓冲区名字匹配到预设的字符串时自动回答yes
(setq original-y-or-n-p 'y-or-n-p)
(defalias 'original-y-or-n-p (symbol-function 'y-or-n-p))
(defun default-yes-sometimes (prompt)
  "automatically say y when buffer name match following string"
  (if (or
       (string-match "has a running process" prompt)
       (string-match "does not exist; create" prompt)
       (string-match "modified; kill anyway" prompt)
       (string-match "Delete buffer using" prompt)
       (string-match "Kill buffer of" prompt)
       (string-match "still connected.  Kill it?" prompt)
       (string-match "Shutdown the client's kernel" prompt)
       (string-match "kill them and exit anyway" prompt)
       (string-match "Revert buffer from file" prompt)
       (string-match "Kill Dired buffer of" prompt)
       (string-match "delete buffer using" prompt)
       (string-match "Kill all pass entry" prompt)
       (string-match "for all cursors" prompt)
       (string-match "Do you want edit the entry" prompt))
      t
    (original-y-or-n-p prompt)))
(defalias 'yes-or-no-p 'default-yes-sometimes)
(defalias 'y-or-n-p 'default-yes-sometimes)

;; 设置剪贴板历史长度300，默认为60
(setq kill-ring-max 200)

;; 在剪贴板里不存储重复内容
(setq kill-do-not-save-duplicates t)

;; 设置位置记录长度为6，默认为16
;; 可以使用 `counsel-mark-ring' or `consult-mark' (C-x j) 来访问光标位置记录
;; 使用 C-x C-SPC 执行 `pop-global-mark' 直接跳转到上一个全局位置处
;; 使用 C-u C-SPC 跳转到本地位置处
(setq mark-ring-max 6)
(setq global-mark-ring-max 6)

;; 设置 emacs-lisp 的限制
(setq max-lisp-eval-depth 10000)        ; 默认值为 800
(setq max-specpdl-size 10000)           ; 默认值为 1600

;; 启用 `list-timers', `list-threads' 这两个命令
(put 'list-timers 'disabled nil)
(put 'list-threads 'disabled nil)

;; 在命令行里支持鼠标
(xterm-mouse-mode 1)

;; 退出Emacs时进行确认
(setq confirm-kill-emacs 'y-or-n-p)

;; 在模式栏上显示当前光标的列号
(column-number-mode t)
```

## 编码设置

统一使用 UTF-8 编码。

``` commonlisp
;; 配置所有的编码为UTF-8，参考：
;; https://thraxys.wordpress.com/2016/01/13/utf-8-in-emacs-everywhere-forever/
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-clipboard-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(modify-coding-system-alist 'process "*" 'utf-8)
(when (display-graphic-p)
  (setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING)))
```

## 模式栏设置

### doom-modeline插件

[doom-modeline](https://github.com/seagle0128/doom-modeline)
是一个模式栏美化插件。

``` commonlisp
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-irc nil)
  (doom-modeline-mu4e nil)
  (doom-modeline-gnus nil)
  (doom-modeline-github nil)
  (doom-modeline-buffer-file-name-style 'truncate-upto-root) ; : auto
  (doom-modeline-persp-name nil)
  (doom-modeline-unicode-fallback t)
  (doom-modeline-enable-word-count nil))
```

### minions插件

[minions](https://github.com/tarsius/minions)
插件能让模式栏变得清爽，将次要模式隐藏起来。

``` commonlisp
(use-package minions
  :ensure t
  :hook (after-init . minions-mode))
```

### keycast按键展示

[keycast mode](https://github.com/tarsius/keycast)
插件可以在模式栏上展示所有的按键，以及对应的函数。

``` commonlisp
(use-package keycast
  :ensure t
  :hook (after-init . keycast-mode)
  :config
  ;; set for doom-modeline support
  ;; With the latest change 72d9add, mode-line-keycast needs to be modified to keycast-mode-line.
  (define-minor-mode keycast-mode
    "Show current command and its key binding in the mode line (fix for use with doom-mode-line)."
    :global t
    (if keycast-mode
        (progn
          (add-hook 'pre-command-hook 'keycast--update t)
          (add-to-list 'global-mode-string '("" keycast-mode-line "  ")))
      (remove-hook 'pre-command-hook 'keycast--update)
      (setq global-mode-string (delete '("" keycast-mode-line "  ") global-mode-string))
      ))

  (dolist (input '(self-insert-command
                   org-self-insert-command))
    (add-to-list 'keycast-substitute-alist `(,input "." "Typing…")))

  (dolist (event '(mouse-event-p
                   mouse-movement-p
                   mwheel-scroll))
    (add-to-list 'keycast-substitute-alist `(,event nil)))

  (setq keycast-log-format "%-20K%C\n")
  (setq keycast-log-frame-alist
        '((minibuffer . nil)))
  (setq keycast-log-newest-first t)
  )
```

## notifications通知管理

需要先通过 `brew install terminal-notifier` 命令安装
[terminal-notifier](https://github.com/julienXX/terminal-notifier) 。

``` commonlisp
(use-package notifications
  :ensure nil
  :commands notify-send
  :config
  (cond ((eq system-type 'darwin)
         (defun notify-send (&rest params)
           "Send notifications via `terminal-notifier'."
           (let ((title (plist-get params :title))
                 (body (plist-get params :body)))
             (start-process "terminal-notifier"
                            nil
                            "terminal-notifier"
                            "-group" "Emacs"
                            "-title" title
                            "-message" body
                            "-activate" "org.gnu.Emacs"))))
        (t
         (defalias 'notify-send 'notifications-notify)))
  )
```

## 图标设置

``` commonlisp
(use-package all-the-icons
  :ensure t
  :when (display-graphic-p)
  :commands all-the-icons-install-fonts
  )
```

## init-ui.el 文件尾

``` commonlisp

(provide 'init-ui)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-ui.el ends here
```

# init-base.el

## init-base.el 文件头

``` commonlisp
;;; init-base.el --- Basical settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## no-littering让配置目录简洁

[no-littering](https://github.com/emacscollective/no-littering)
插件将原本放在 `.emacs.d` 目录下的一些配置信息或动态信息，转移到 `etc`
或 `var` 子目录里，让配置目录更加简洁清爽。

``` commonlisp
(use-package no-littering
  :ensure t)
```

## savehist记住迷你缓冲区历史

记住迷你缓冲区历史。

``` commonlisp
(use-package savehist
  :ensure nil
  :hook (after-init . savehist-mode)
  :config
  ;; Allow commands in minibuffers, will affect `dired-do-dired-do-find-regexp-and-replace' command:
  (setq enable-recursive-minibuffers t)
  (setq history-length 1000)
  (setq savehist-additional-variables '(mark-ring
                                        global-mark-ring
                                        search-ring
                                        regexp-search-ring
                                        extended-command-history))
  (setq savehist-autosave-interval 300))
```

## saveplace记住每个文件的光标位置

自动记住每个文件的最后一次访问的光标位置。

``` commonlisp
(use-package saveplace
  :ensure nil
  :hook (after-init . save-place-mode))
```

## recentf最近打开的文件历史

记住最近打开的文件历史。

``` commonlisp
(use-package recentf
  :ensure nil
  :defines no-littering-etc-directory no-littering-var-directory
  :hook (after-init . recentf-mode)
  :custom
  (recentf-max-saved-items 300)
  (recentf-auto-cleanup 'never)
  ;; `recentf-add-file' will apply handlers first, then call `string-prefix-p'
  ;; to check if it can be pushed to recentf list.
  (recentf-filename-handlers '(abbreviate-file-name))
  (recentf-exclude `(,@(cl-loop for f in `(,package-user-dir
                                           ,no-littering-var-directory
                                           ,no-littering-etc-directory)
                                collect (abbreviate-file-name f))
                     ;; Folders on MacOS start
                     "^/private/tmp/"
                     "^/var/folders/"
                     ;; Folders on MacOS end
                     ".cache"
                     ".cask"
                     ".elfeed"
                     "elfeed"
                     "bookmarks"
                     "cache"
                     "ido.*"
                     "persp-confs"
                     "recentf"
                     "undo-tree-hist"
                     "url"
                     "^/tmp/"
                     "/ssh\\(x\\)?:"
                     "/su\\(do\\)?:"
                     "^/usr/include/"
                     "/TAGS\\'"
                     "COMMIT_EDITMSG\\'")))
```

## undo-tree撤销设置

[undo-tree](https://www.dr-qubit.org/undo-tree.html)
插件可以提供一个可视化的撤销、重做系统，我们使用 `C-/` 来撤销，使用
`M-_` 来重做。

``` commonlisp
(use-package undo-tree
  :ensure t
  :hook (after-init . global-undo-tree-mode)
  :config
  ;; don't save undo history to local files
  (setq undo-tree-auto-save-history nil)
  )
```

## super-save自动保存

[super-save](https://github.com/bbatsov/super-save)
插件能自动保存缓冲区。它可以设置在某些行为（如窗口切换、或窗口空闲一段时间）下自动保存。

``` commonlisp
(use-package super-save
  :ensure t
  :hook (after-init . super-save-mode)
  :config
  ;; Emacs空闲是否自动保存，这里不设置
  (setq super-save-auto-save-when-idle nil)
  ;; 切换窗口自动保存
  (add-to-list 'super-save-triggers 'other-window)
  ;; 查找文件时自动保存
  (add-to-list 'super-save-hook-triggers 'find-file-hook)
  ;; 远程文件编辑不自动保存
  (setq super-save-remote-files nil)
  ;; 特定后缀名的文件不自动保存
  (setq super-save-exclude '(".gpg"))
  ;; 自动保存时，保存所有缓冲区
  (defun super-save/save-all-buffers ()
    (save-excursion
      (dolist (buf (buffer-list))
        (set-buffer buf)
        (when (and buffer-file-name
                   (buffer-modified-p (current-buffer))
                   (file-writable-p buffer-file-name)
                   (if (file-remote-p buffer-file-name) super-save-remote-files t))
          (save-buffer)))))
  (advice-add 'super-save-command :override 'super-save/save-all-buffers)
  )
```

## crux系统增强

[crux](https://github.com/bbatsov/crux)
插件提供一系列的增强，如移动增强、删除增强等优化功能。

``` commonlisp
(use-package crux
  :ensure t
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-x 4 t" . crux-transpose-windows)
         ("C-x K" . crux-kill-other-buffers)
         ("C-k" . crux-smart-kill-line)
         ("C-c r" . crux-rename-file-and-buffer)
         ("C-x DEL" . crux-kill-line-backwards))
  :config
  (crux-with-region-or-buffer indent-region)
  (crux-with-region-or-buffer untabify)
  (crux-with-region-or-point-to-eol kill-ring-save)
  (defalias 'rename-file-and-buffer #'crux-rename-file-and-buffer))
```

## 个人函数定义

以下是一些个人的函数定义，配置文件的其他部分会用到这些函数。

``` commonlisp
;; 将列表加入到列表
(defun add-list-to-list (dst src)
  "Similar to `add-to-list', but accepts a list as 2nd argument"
  (set dst
       (append (eval dst) src)))

;; 打开当前配置Org文件
(defun open-emacsconfig ()
  "Opens emacs config org file."
  (interactive)
  (find-file (locate-user-emacs-file "emacs-config.org")))
```

## 别名定义

定义了别名后，可以通过 `M-x 别名` 的方式来调用某个命令。

``` commonlisp
(defalias 'e #'eshell)
(defalias 's #'scratch)
(defalias 'conf #'open-emacsconfig)
```

## init-base.el 文件尾

``` commonlisp

(provide 'init-base)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-base.el ends here
```

# init-edit.el

## init-edit.el 文件头

``` commonlisp
;;; init-edit.el --- Editing settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## Emacs备份设置

不使用Emacs的自动备份设置。

``` commonlisp
(setq make-backup-files nil)                                  ; 不自动备份
(setq auto-save-default nil)                                  ; 不使用Emacs自带的自动保存
```

## 解除一些不常用的快捷键

将一些不常用的快捷键解除，防止误操作。

``` commonlisp
;; 解除不常用的快捷键定义
(global-set-key (kbd "C-z") nil)
(global-set-key (kbd "s-q") nil)
(global-set-key (kbd "M-z") nil)
(global-set-key (kbd "M-m") nil)
(global-set-key (kbd "C-x C-z") nil)
(global-set-key [mouse-2] nil)
```

## delsel选择文本输入时直接替换

Emacs默认选择文本后直接输入，是不会直接删除所选择的文本进行替换的。通过内置的
`delsel` 插件来实现这个行为。

``` commonlisp
;; Directly modify when selecting text
(use-package delsel
  :ensure nil
  :hook (after-init . delete-selection-mode))
```

## 自动重载设置

当我们的文件发生了改变后，我们希望Emacs里打开的永远是最新的文件，这个时候，我们需要对自动重载进行设置，让我们的Emacs在文件发生改变的时候自动重载文件。

``` commonlisp
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
```

## avy光标移动

[avy](https://github.com/abo-abo/avy)
是一个光标移动插件，能快速将光标移动到屏幕上的任意字符，非常强大！

``` commonlisp
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
```

## multiple-cursors多光标编辑

[multiple-cursors](https://github.com/magnars/multiple-cursors.el)
插件能让Emacs实现多光标编辑和移动。

``` commonlisp
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
```

## init-edit.el 文件尾

``` commonlisp
;; (message "init-base configuration: %.2fs"
;;          (float-time (time-subtract (current-time) my/init-base-start-time)))

(provide 'init-edit)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-edit.el ends here
```

# init-org.el

## init-org.el 文件头

``` commonlisp
;;; init-org.el --- Org mode settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## Org mode基本配置

对Org mode基本配置进行修改。

``` commonlisp
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
```

## org-modern 美化

下面，我们通过 [org-modern](https://github.com/minad/org-modern)
插件对Org mode进行进一步的美化。

``` commonlisp
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
```

## org-appear自动展开强调链接

通过 [org-appear](https://github.com/awth13/org-appear)
插件，当我们的光标移动到Org
mode里的强调、链接上时，会自动展开，这样方便进行编辑。

``` commonlisp
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
```

## org-auto-tangle自动tangle设置

[org-auto-tangle](https://github.com/yilkalargaw/org-auto-tangle)
插件可以在Org mode下自动进行tangle。

``` commonlisp
(use-package org-auto-tangle
  :ensure t
  :hook (org-mode . org-auto-tangle-mode)
  :config
  (setq org-auto-tangle-default t)
  )
```

## org-capture快速记录设置

``` commonlisp
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
```

## denote笔记设置

[denote](https://protesilaos.com/emacs/denote)
是一个轻量级的笔记插件，拥有良好的文件名命名模板。

``` commonlisp
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
```

## consult-notes查找笔记

[consult-notes](https://github.com/mclear-tools/consult-notes)
插件可以通过consult快速找到笔记。

``` commonlisp
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
```

## org-super-links反链设置

[org-super-links](https://github.com/toshism/org-super-links)
插件可以设置反向链接。

``` commonlisp
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
  (setq org-super-links-link-prefix 'org-super-links-link-prefix-timestamp))
```

## org-src代码块基础配置

Org mode代码块的基本配置。

``` commonlisp
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
```

## org babel代码块后端

### plantuml绘图

[plantuml](https://plantuml.com/zh/) 可以让我们在Org
mode里通过纯文本画各种图，具体参考：[PlantUML integration with
Emacs](https://plantuml.com/zh/emacs)。

需要提前通过 `brew install plantuml` 安装 `plantuml` 。

``` commonlisp
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
```

### gnuplot绘图

[gnuplot](https://github.com/emacs-gnuplot/gnuplot)
插件可以让Emacs通过gnuplot绘图。

``` commonlisp
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
```

### lilypond乐谱绘图

通过 `lilypond` 乐谱画图，需要提前安装 `lilypond` 和 `mactex-no-gui` 。

``` commonlisp
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
```

## 限制代码块结果长度

参考 [twlz0ne
大佬在这篇贴子的回复](https://emacs-china.org/t/org-babel/18399/4)。

``` commonlisp
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
```

## ox文件导出通用设置

下面是org文件导出的通用设置。

``` commonlisp
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
```

## org导出后端设置

### ox-html导出HTML设置

我们先来对HTML导出做一个基本设置：

``` commonlisp
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
```

### ox-latex导出PDF设置

`ox-latex` 是Org mode自带的功能，可以将Org文件导出为latex文件和PDF文件。

``` commonlisp
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
```

### ox-reveal导出幻灯片设置

我们可以 [ox-reveal](https://github.com/hexmode/ox-reveal)
插件，将org文件导出为漂亮的幻灯片。需要提前
[安装reveal.js](https://revealjs.com/installation/)：

1.  克隆 `reveal.js` 项目

    ``` shell
    cd ~/.emacs.d/ && git clone https://github.com/hakimel/reveal.js.git
    ```

2.  安装依赖

    ``` shell
    cd reveal.js && npm install
    ```

``` commonlisp
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
```

### ox-gfm导出Markdown设置

我们通过 [ox-gfm](https://github.com/larstvei/ox-gfm)
插件来导出Github样式的Markdown文件。

``` commonlisp
(use-package ox-gfm
  :ensure t
  :after ox)
```

### ox-pandoc导出各种格式设置

[ox-pandoc](https://github.com/kawabata/ox-pandoc)
可以将org文件导出为各种格式的文件，需要提前安装 `brew install pandoc` 。

``` commonlisp
(use-package ox-pandoc
  :ensure t
  :custom
  ;; special extensions for markdown_github output
  (org-pandoc-format-extensions '(markdown_github+pipe_tables+raw_html))
  (org-pandoc-command "/usr/local/bin/pandoc")
  )
```

### ox-publish导出静态站点设置

``` commonlisp
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
```

### ox-hugo导出博客设置

[ox-hugo](https://github.com/kaushalmodi/ox-hugo) 插件可以将 org
文件导出为 [hugo](https://gohugo.io/) 需要的 Markdown 文件，并快速通过
hugo 进行博客的生成和发布。

``` commonlisp
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
```

## 图片粘贴

通过 `pngpaste`
这个命令行工具，将系统剪贴板里的图片，输出到当前文件同名的 `assets`
文件夹下，然后自动在当前org文件的光标处插入图片链接，并设置图片链接的宽度属性。

``` commonlisp
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
```

## toc-org目录自动生成

[toc-org](https://github.com/snosov1/toc-org)
插件可以在Org文件里自动生成目录，只需给一个标题行设置一个标签为 `toc` 或
`toc_2` 即可（后者只生成2层）。

``` commonlisp
(use-package toc-org
  :ensure t
  :hook (org-mode . toc-org-mode))
```

## ol新增链接类型

[google Org mode](google:Org mode)

``` commonlisp
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
```

## Org mode 任务管理

### calendar基本设置

``` commonlisp
(use-package calendar
  :ensure nil
  :hook (calendar-today-visible . calendar-mark-today)
  :custom
  ;; 是否显示中国节日，我们使用 `cal-chinese-x' 插件
  (calendar-chinese-all-holidays-flag nil)
  ;; 是否显示节日
  (calendar-mark-holidays-flag t)
  ;; 是否显示Emacs的日记，我们使用org的日记
  (calendar-mark-diary-entries-flag nil)
  ;; 数字方式显示时区，如 +0800，默认是字符方式如 CST
  (calendar-time-zone-style 'numeric)
  ;; 日期显示方式：year/month/day
  (calendar-date-style 'iso)
  ;; 中文天干地支设置
  (calendar-chinese-celestial-stem ["甲" "乙" "丙" "丁" "戊" "己" "庚" "辛" "壬" "癸"])
  (calendar-chinese-terrestrial-branch ["子" "丑" "寅" "卯" "辰" "巳" "午" "未" "申" "酉" "戌" "亥"])
  ;; 设置中文月份
  (calendar-month-name-array ["一月" "二月" "三月" "四月" "五月" "六月" "七月" "八月" "九月" "十月" "十一月" "十二月"])
  ;; 设置星期标题显示
  (calendar-day-name-array ["日" "一" "二" "三" "四" "五" "六"])
  ;; 周一作为一周第一天
  (calendar-week-start-day 1)
  )
```

### 日历中文增强

我们通过 [cal-china-x](https://github.com/xwl/cal-china-x)
插件进一步地增强中文日历，显示农历等信息。

``` commonlisp
;; 时间解析增加中文拼音
(use-package parse-time
  :ensure nil
  :defer t
  :config
  (setq parse-time-months
        (append '(("yiy" . 1) ("ery" . 2) ("sany" . 3)
                  ("siy" . 4) ("wuy" . 5) ("liuy" . 6)
                  ("qiy" . 7) ("bay" . 8) ("jiuy" . 9)
                  ("shiy" . 10) ("shiyiy" . 11) ("shiery" . 12)
                  ("yiyue" . 1) ("eryue" . 2) ("sanyue" . 3)
                  ("siyue" . 4) ("wuyue" . 5) ("liuyue" . 6)
                  ("qiyue" . 7) ("bayue" . 8) ("jiuyue" . 9)
                  ("shiyue" . 10) ("shiyiyue" . 11) ("shieryue" . 12))
                parse-time-months))

  (setq parse-time-weekdays
        (append '(("zri" . 0) ("zqi" . 0)
                  ("zyi" . 1) ("zer" . 2) ("zsan" . 3)
                  ("zsi" . 4) ("zwu" . 5) ("zliu" . 6)
                  ("zr" . 0) ("zq" . 0)
                  ("zy" . 1) ("ze" . 2) ("zs" . 3)
                  ("zsi" . 4) ("zw" . 5) ("zl" . 6))
                parse-time-weekdays)))

;; 中国节日设置
(use-package cal-china-x
  :ensure t
  :commands cal-china-x-setup
  :hook (after-init . cal-china-x-setup)
  :config
  ;; 重要节日设置
  (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
  ;; 所有节日设置
  (setq cal-china-x-general-holidays
        '(;;公历节日
          (holiday-fixed 1 1 "元旦")
          (holiday-fixed 2 14 "情人节")
          (holiday-fixed 3 8 "妇女节")
          (holiday-fixed 3 14 "白色情人节")
          (holiday-fixed 4 1 "愚人节")
          (holiday-fixed 5 1 "劳动节")
          (holiday-fixed 5 4 "青年节")
          (holiday-float 5 0 2 "母亲节")
          (holiday-fixed 6 1 "儿童节")
          (holiday-float 6 0 3 "父亲节")
          (holiday-fixed 9 10 "教师节")
          (holiday-fixed 10 1 "国庆节")
          (holiday-fixed 10 2 "国庆节")
          (holiday-fixed 10 3 "国庆节")
          (holiday-fixed 10 24 "程序员节")
          (holiday-fixed 11 11 "双11购物节")
          (holiday-fixed 12 25 "圣诞节")
          ;; 农历节日
          (holiday-lunar 12 30 "春节" 0)
          (holiday-lunar 1 1 "春节" 0)
          (holiday-lunar 1 2 "春节" 0)
          (holiday-lunar 1 15 "元宵节" 0)
          (holiday-solar-term "清明" "清明节")
          (holiday-solar-term "小寒" "小寒")
          (holiday-solar-term "大寒" "大寒")
          (holiday-solar-term "立春" "立春")
          (holiday-solar-term "雨水" "雨水")
          (holiday-solar-term "惊蛰" "惊蛰")
          (holiday-solar-term "春分" "春分")
          (holiday-solar-term "谷雨" "谷雨")
          (holiday-solar-term "立夏" "立夏")
          (holiday-solar-term "小满" "小满")
          (holiday-solar-term "芒种" "芒种")
          (holiday-solar-term "夏至" "夏至")
          (holiday-solar-term "小暑" "小暑")
          (holiday-solar-term "大暑" "大暑")
          (holiday-solar-term "立秋" "立秋")
          (holiday-solar-term "处暑" "处暑")
          (holiday-solar-term "白露" "白露")
          (holiday-solar-term "秋分" "秋分")
          (holiday-solar-term "寒露" "寒露")
          (holiday-solar-term "霜降" "霜降")
          (holiday-solar-term "立冬" "立冬")
          (holiday-solar-term "小雪" "小雪")
          (holiday-solar-term "大雪" "大雪")
          (holiday-solar-term "冬至" "冬至")
          (holiday-lunar 5 5 "端午节" 0)
          (holiday-lunar 8 15 "中秋节" 0)
          (holiday-lunar 7 7 "七夕情人节" 0)
          (holiday-lunar 12 8 "腊八节" 0)
          (holiday-lunar 9 9 "重阳节" 0)))
  ;; 设置日历的节日，通用节日已经包含了所有节日
  (setq calendar-holidays (append cal-china-x-general-holidays)))
```

### org-agenda基本设置

``` commonlisp
(use-package org-agenda
  :ensure nil
  :hook (org-agenda-finalize . org-agenda-to-appt)
  :bind (("\e\e a" . org-agenda)
         :map org-agenda-mode-map
         ("i" . (lambda () (interactive) (org-capture nil "d")))
         ("J" . consult-org-agenda))
  :config
  ;; 日程模式的日期格式设置
  (setq org-agenda-format-date 'org-agenda-format-date-aligned)
  (defun org-agenda-format-date-aligned (date)
    "Format a DATE string for display in the daily/weekly agenda, or timeline.

This function makes sure that dates are aligned for easy reading."
    (require 'cal-iso)
    (let* ((dayname (aref cal-china-x-days
                          (calendar-day-of-week date)))
           (day (cadr date))
           (month (car date))
           (year (nth 2 date))
           (day-of-week (calendar-day-of-week date))
           (iso-week (org-days-to-iso-week
                      (calendar-absolute-from-gregorian date)))
           (cn-date (calendar-chinese-from-absolute (calendar-absolute-from-gregorian date)))
           (cn-month (cl-caddr cn-date))
           (cn-day (cl-cadddr cn-date))
           (cn-month-string (concat (aref cal-china-x-month-name
                                          (1- (floor cn-month)))
                                    (if (integerp cn-month)
                                        ""
                                      "（闰月）")))
           (cn-day-string (aref cal-china-x-day-name
                                (1- cn-day)))
           (extra (format " 农历%s%s%s%s"
                          (if (or (eq org-agenda-current-span 'day)
                                  (= day-of-week 1)
                                  (= cn-day 1))
                              cn-month-string
                            "")
                          (if (or (= day-of-week 1)
                                  (= cn-day 1))
                              (if (integerp cn-month) "" "[闰]")
                            "")
                          cn-day-string
                          (if (or (= day-of-week 1)
                                  (eq org-agenda-current-span 'day))
                              (format " 今年第%02d周" iso-week)
                            "")
                          ))
           )
      (format "%04d-%02d-%02d 星期%s%s%s\n" year month
              day dayname extra (concat " 第" (format-time-string "%j") "天"))))

  ;; 显示时间线
  (setq org-agenda-use-time-grid t)
  ;; 设置面包屑分隔符
  ;; (setq org-agenda-breadcrumbs-separator " ❱ ")
  ;; 设置时间线的当前时间指示串
  (setq org-agenda-current-time-string "⏰------------now")
  ;; 时间线范围和颗粒度设置
  (setq org-agenda-time-grid (quote ((daily today)
                                     (0600 0800 1000 1200
                                           1400 1600 1800
                                           2000 2200 2400)
                                     "......" "----------------")))
  ;; 日程视图的前缀设置
  (setq org-agenda-prefix-format '((agenda . " %i %-25:c %5t %s")
                                   (todo   . " %i %-25:c ")
                                   (tags   . " %i %-25:c ")
                                   (search . " %i %-25:c ")))
  ;; 对于计划中的任务在视图里的显示
  (setq org-agenda-scheduled-leaders
        '("计划 " "应在%02d天前开始 "))
  ;; 对于截止日期的任务在视图里的显示
  (setq org-agenda-deadline-leaders
        '("截止 " "还有%02d天到期 " "已经过期%02d天 "))

  ;; =====================
  ;; 自定义日程视图，分别显示TODO，WIP，WIAT中的任务
  ;; n键显示自定义视图，p键纯文本视图，a键默认视图
  ;; =====================
  (defvar my-org-custom-daily-agenda
    `((todo "TODO"
            ((org-agenda-block-separator nil)
             (org-agenda-overriding-header "所有待办任务\n")))
      (todo "WIP"
            ((org-agenda-block-separator nil)
             (org-agenda-overriding-header "\n进行中的任务\n")))
      (todo "WAIT"
            ((org-agenda-block-separator nil)
             (org-agenda-overriding-header "\n等待中的任务\n")))
      (agenda "" ((org-agenda-block-separator nil)
                  (org-agenda-overriding-header "\n今日日程\n"))))
    "Custom agenda for use in `org-agenda-custom-commands'.")
  (setq org-agenda-custom-commands
        `(("n" "Daily agenda and top priority tasks"
           ,my-org-custom-daily-agenda)
          ("p" "Plain text daily agenda and top priorities"
           ,my-org-custom-daily-agenda
           ((org-agenda-with-colors nil)
            (org-agenda-prefix-format "%t %s")
            (org-agenda-current-time-string ,(car (last org-agenda-time-grid)))
            (org-agenda-fontify-priorities nil)
            (org-agenda-remove-tags t))
           ("agenda.txt"))))

  ;; 时间戳格式设置，会影响到 `svg-tag' 等基于正则的设置
  ;; 这里设置完后是 <2022-12-24 星期六> 或 <2022-12-24 星期六 06:53>
  (setq system-time-locale "zh_CN.UTF-8")
  (setq org-time-stamp-formats '("<%Y-%m-%d %A>" . "<%Y-%m-%d %A %H:%M>"))
  ;; 不同日程类别间的间隔
  (setq org-cycle-separator-lines 2)
  :custom
  ;; 设置需要被日程监控的org文件
  (org-agenda-files
   (list (expand-file-name "tasks.org" org-directory)
         (expand-file-name "diary.org" org-directory)
         (expand-file-name "habits.org" org-directory)
         (expand-file-name "mail.org" org-directory)
         (expand-file-name "emacs-config.org" user-emacs-directory)
         ))
  ;; 设置org的日记文件
  (org-agenda-diary-file (expand-file-name "diary.org" org-directory))
  ;; 日记插入精确时间戳
  (org-agenda-insert-diary-extract-time t)
  ;; 设置日程视图更加紧凑
  ;; (org-agenda-compact-blocks t)
  ;; 日程视图的块分隔符
  (org-agenda-block-separator ?─)
  ;; 日视图还是周视图，通过 v-d, v-w, v-m, v-y 切换视图，默认周视图
  (org-agenda-span 'day)
  ;; q退出时删除agenda缓冲区
  (org-agenda-sticky t)
  ;; 是否包含直接日期
  (org-agenda-include-deadlines t)
  ;; 禁止日程启动画面
  (org-agenda-inhibit-startup t)
  ;; 显示每一天，不管有没有条目
  (org-agenda-show-all-dates t)
  ;; 时间不足位时前面加0
  (org-agenda-time-leading-zero t)
  ;; 日程同时启动log mode
  (org-agenda-start-with-log-mode t)
  ;; 日程同时启动任务时间记录报告模式
  (org-agenda-start-with-clockreport-mode t)
  ;; 截止的任务完成后不显示
  ;; (org-agenda-skip-deadline-if-done t)
  ;; 当计划的任务完成后不显示
  (org-agenda-skip-scheduled-if-done t)
  ;; 计划过期上限
  (org-scheduled-past-days 365)
  ;; 计划截止上限
  (org-deadline-past-days 365)
  ;; 计划中的任务不提醒截止时间
  (org-agenda-skip-deadline-prewarning-if-scheduled 1)
  (org-agenda-skip-scheduled-if-deadline-is-shown t)
  (org-agenda-skip-timestamp-if-deadline-is-shown t)
  ;; 设置工时记录报告格式
  (org-agenda-clockreport-parameter-plist
   '(:link t :maxlevel 5 :fileskip0 t :compact nil :narrow 80))
  (org-agenda-columns-add-appointments-to-effort-sum t)
  (org-agenda-restore-windows-after-quit t)
  (org-agenda-window-setup 'current-window)
  ;; 标签显示的位置，第100列往前右对齐
  (org-agenda-tags-column -100)
  ;; 从星期一开始作为一周第一天
  (org-agenda-start-on-weekday 1)
  ;; 是否使用am/pm
  ;; (org-agenda-timegrid-use-ampm nil)
  ;; 搜索是不看时间
  (org-agenda-search-headline-for-time nil)
  ;; 提前3天截止日期到期告警
  (org-deadline-warning-days 3)
  )
```

### org-habit习惯管理

``` commonlisp
(use-package org-habit
  :ensure nil
  :defer t
  :custom
  (org-habit-show-habits t)
  (org-habit-graph-column 70)
  (org-habit-show-all-today t)
  (org-habit-show-done-always-green t)
  (org-habit-scheduled-past-days t)
  ;; org habit show 7 days before today and 7 days after today. ! means not done. * means done.
  (org-habit-preceding-days 7)
  )
```

### appt邀约提醒

Emacs的邀约提醒，并集成org-agenda提醒：

``` commonlisp
(use-package appt
  :ensure nil
  :hook ((after-init . (lambda () (appt-activate 1)))
         (org-finalize-agenda . org-agenda-to-appt))
  :config
  ;; 通知提醒
  (defun appt-display-with-notification (min-to-app new-time appt-msg)
    (notify-send :title (format "Appointment in %s minutes" min-to-app)
                 :body appt-msg
                 :urgency 'critical)
    (appt-disp-window min-to-app new-time appt-msg))

  ;; 每15分钟更新一次appt
  (run-at-time t 900 #'org-agenda-to-appt)

  :custom
  ;; 是否显示日记
  (appt-display-diary nil)
  ;; 提醒间隔时间，每15分钟提醒一次
  (appt-display-interval 15)
  ;; 模式栏显示提醒
  (appt-display-mode-line t)
  ;; 设置提醒响铃
  (appt-audible t)
  ;; 提前30分钟提醒
  (appt-message-warning-time 30)
  ;; 通知提醒函数
  (appt-disp-window-function #'appt-display-with-notification)
  )
```

## init-org.el 文件尾

``` commonlisp

(provide 'init-org)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-org.el ends here
```

# init-completion.el

Emacs的补全设置。

## init-completion.el 文件头

``` commonlisp
;;; init-completion.el --- Completion settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## vertico

[vertico](https://github.com/minad/vertico)
插件提供了一个垂直样式的补全系统。

``` commonlisp
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
```

## orderless

[oderless](https://github.com/oantolin/orderless)
插件提供一种无序的补全新姿势，将一个搜索的范式变成数个以空格分隔的部分，各部分之间没有顺序，你要做的就是根据记忆输入关键词、空格、关键词。

``` commonlisp
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
```

## marginalia

[marginalia](https://github.com/minad/marginalia)
插件给迷你缓冲区的补全候选条目添加一些提示。

``` commonlisp
;; minibuffer helpful annotations
(use-package marginalia
  :ensure t
  :hook (after-init . marginalia-mode)
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil)))
```

## consult

[consult](https://github.com/minad/consult)
插件基于Emacs自带的补全机制，提供了一系列的补全命令。

> For locate on MacOS:
>
> 1.  `locate` is not enabled in MacOS by default. We need to enable it
>     via: sudo launchctl load -w
>     /System/Library/LaunchDaemons/com.apple.locate.plist
>
> 2.  Then we need to wait `locate` to build db for the whole file
>     system.
>
> 3.  If there is something wrong with updating locate db, we can update
>     it manually via: chomd 755 ~/Library ~/Downloads ~/Documents
>     ~/Desktop sudo /usr/libexec/locate.updatedb

``` commonlisp
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
```

## corfu

[corfu](https://github.com/minad/corfu) 通过弹窗进行补全。

``` commonlisp
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
```

### cape

[Cape](https://github.com/minad/cape)
提供了一系列开箱即用的补全后端，跟corfu联合使用。

``` commonlisp
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
```

## yasnippet模板补全

[yasnippet](https://github.com/joaotavora/yasnippet)
插件是一个非常强大的模板补全系统。

``` commonlisp
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
```

## all-the-icons-completion补全图标美化

[all-the-icons-completion](https://github.com/iyefrat/all-the-icons-completion)
插件给候选添上漂亮的图标。

``` commonlisp
(use-package all-the-icons-completion
  :ensure t
  :hook ((after-init . all-the-icons-completion-mode)
         (marginalia-mode . all-the-icons-completion-marginalia-setup))
  )
```

## embark

[embark](https://github.com/oantolin/embark)
插件提供了一系列的迷你缓冲区的类似右键机制的增强。

``` commonlisp
(use-package embark
  :ensure t
  :bind (([remap describe-bindings] . embark-bindings)
         ("C-'" . embark-act)
         :map minibuffer-local-map
         :map minibuffer-local-completion-map
         ("TAB" . minibuffer-force-complete)
         :map embark-file-map
         ("E" . consult-file-externally)      ; Open file externally, or `we' in Ranger
         ("O" . consult-directory-externally) ; Open directory externally
         )
  :init
  ;; Optionally replace the key help with a completing-read interface
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  ;; Show Embark actions via which-key
  (setq embark-action-indicator
        (lambda (map)
          (which-key--show-keymap "Embark" map nil nil 'no-paging)
          #'which-key--hide-popup-ignore-command)
        embark-become-indicator embark-action-indicator)

  ;; open directory
  (defun consult-directory-externally (file)
    "Open directory externally using the default application of the system."
    (interactive "fOpen externally: ")
    (if (and (eq system-type 'windows-nt)
             (fboundp 'w32-shell-execute))
        (shell-command-to-string (encode-coding-string (replace-regexp-in-string "/" "\\\\"
                                                                                 (format "explorer.exe %s" (file-name-directory (expand-file-name file)))) 'gbk))
      (call-process (pcase system-type
                      ('darwin "open")
                      ('cygwin "cygstart")
                      (_ "xdg-open"))
                    nil 0 nil
                    (file-name-directory (expand-file-name file)))))

  ;; Hide the mode line of the Embark live/completions buffers
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                 nil
                 (window-parameters (mode-line-format . none))))
  )

(use-package embark-consult
  :ensure t
  :hook (embark-collect-mode . consult-preview-at-point-mode))
```

## init-completion.el 文件尾

``` commonlisp

(provide 'init-completion)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-completion.el ends here
```

# init-dired.el

Emacs文件管理设置。

## init-dired.el 文件头

``` commonlisp
;;; init-dired.el --- Dired settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## Dired基础配置

``` commonlisp
(use-package dired
  :ensure nil
  :bind (:map dired-mode-map
              ("C-<return>" . xah-open-in-external-app)
              ("W" . dired-copy-path)
              )
  :config
  ;; Enable the disabled dired commands
  (put 'dired-find-alternate-file 'disabled nil)

  ;; open files via external program based on file types, See:
  ;; https://emacs.stackexchange.com/questions/3105/how-to-use-an-external-program-as-the-default-way-to-open-pdfs-from-emacs
  (defun xdg-open (filename)
    (interactive "fFilename: ")
    (let ((process-connection-type))
      (start-process "" nil (cond ((eq system-type 'gnu/linux) "xdg-open")
                                  ((eq system-type 'darwin) "open")
                                  ((eq system-type 'windows-nt) "start")
                                  (t "")) (expand-file-name filename))))
  ;; open files via external program when using find-file
  (defun find-file-auto (orig-fun &rest args)
    (let ((filename (car args)))
      (if (cl-find-if
           (lambda (regexp) (string-match regexp filename))
           '(
             ;; "\\.html?\\'"
             "\\.xlsx?\\'"
             "\\.pptx?\\'"
             "\\.docx?\\'"
             "\\.mp4\\'"
             "\\.app\\'"
             ))
          (xdg-open filename)
        (apply orig-fun args))))
  (advice-add 'find-file :around 'find-file-auto)

  (defun dired-copy-path ()
    "In dired, copy file path to kill-buffer.
At 2nd time it copy current directory to kill-buffer."
    (interactive)
    (let (path)
      (setq path (dired-file-name-at-point))
      (if (string= path (current-kill 0 1)) (setq path (dired-current-directory)))
      (message path)
      (kill-new path)))

  (defun xah-open-in-external-app (&optional @fname)
    "Open the current file or dired marked files in external app.
The app is chosen from your OS's preference.

When called in emacs lisp, if @fname is given, open that.

URL `http://ergoemacs.org/emacs/emacs_dired_open_file_in_ext_apps.html'
Version 2019-11-04"
    (interactive)
    (let* (
           ($file-list
            (if @fname
                (progn (list @fname))
              (if (or (string-equal major-mode "dired-mode")
                      (string-equal major-mode "dirvish-mode"))
                  (dired-get-marked-files)
                (list (buffer-file-name)))))
           ($do-it-p (if (<= (length $file-list) 5)
                         t
                       (y-or-n-p "Open more than 5 files? "))))
      (when $do-it-p
        (cond
         ((string-equal system-type "windows-nt")
          (mapc
           (lambda ($fpath)
             (w32-shell-execute "open" $fpath)) $file-list))
         ((string-equal system-type "darwin")
          (mapc
           (lambda ($fpath)
             (shell-command
              (concat "open " (shell-quote-argument $fpath))))  $file-list))
         ((string-equal system-type "gnu/linux")
          (mapc
           (lambda ($fpath) (let ((process-connection-type nil))
                              (start-process "" nil "xdg-open" $fpath))) $file-list))))))
  :custom
  ;; (dired-recursive-deletes 'always)
  (delete-by-moving-to-trash t)
  (dired-dwim-target t)
  (dired-bind-vm nil)
  (dired-bind-man nil)
  (dired-bind-info nil)
  (dired-auto-revert-buffer t)
  (dired-hide-details-hide-symlink-targets nil)
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches "-AFhlv"))

(use-package dired-aux
  :ensure nil
  :bind (:map dired-mode-map
              ("C-c +" . dired-create-empty-file))
  :config
  ;; with the help of `evil-collection', P is bound to `dired-do-print'.
  (define-advice dired-do-print (:override (&optional _))
    "Show/hide dotfiles."
    (interactive)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p)
        (progn
          (setq-local dired-dotfiles-show-p nil)
          (dired-mark-files-regexp "^\\.")
          (dired-do-kill-lines))
      (revert-buffer)
      (setq-local dired-dotfiles-show-p t)))
  :custom
  (dired-isearch-filenames 'dwim)
  (dired-create-destination-dirs 'ask)
  (dired-vc-rename-file t))

(use-package dired-x
  :ensure nil
  :hook (dired-mode . dired-omit-mode)
  :init
  (setq dired-guess-shell-alist-user `((,(rx "."
                                             (or
                                              ;; Videos
                                              "mp4" "avi" "mkv" "flv" "ogv" "ogg" "mov"
                                              ;; Music
                                              "wav" "mp3" "flac"
                                              ;; Images
                                              "jpg" "jpeg" "png" "gif" "xpm" "svg" "bmp"
                                              ;; Docs
                                              "pdf" "md" "djvu" "ps" "eps" "doc" "docx" "xls" "xlsx" "ppt" "pptx")
                                             string-end)
                                        ,(cond ((eq system-type 'gnu/linux) "xdg-open")
                                               ((eq system-type 'darwin) "open")
                                               ((eq system-type 'windows-nt) "start")
                                               (t "")))))
  :custom
  (dired-omit-verbose nil)
  (dired-omit-files (rx string-start
                        (or ".DS_Store"
                            ".cache"
                            ".vscode"
                            ".ccls-cache" ".clangd")
                        string-end))
  ;; Dont prompt about killing buffer visiting delete file
  (dired-clean-confirm-killing-deleted-buffers nil)
  )
```

## diredfl多彩美化

默认的Dired只有两种颜色以区分文件和文件夹，我们可以使用
[diredfl](https://github.com/purcell/diredfl)
插件让Dired变得更加多彩一些：

``` commonlisp
(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))
```

## all-the-icons-dired图标美化

我们通过
[all-the-icons-dired](https://github.com/jtbm37/all-the-icons-dired)
插件给Dired添加好看的图标。

``` commonlisp
(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode)
  )
```

## dirvish文件管理

[dirvish](https://github.com/alexluigit/dirvish)
是在Dired基础之上的文件管理增强插件。需要安装 `poppler` 来预览PDF；安装
`ffmpegthumbnailer` 来预览视频。

``` commonlisp
(use-package dirvish
  :ensure t
  :hook (after-init . dirvish-override-dired-mode)
  :bind (:map dired-mode-map
         ("TAB" . dirvish-toggle-subtree)
         ("SPC" . dirvish-show-history)
         ("*"   . dirvish-mark-menu)
         ("r"   . dirvish-roam)
         ("b"   . dirvish-goto-bookmark)
         ("f"   . dirvish-file-info-menu)
         ("M-n" . dirvish-go-forward-history)
         ("M-p" . dirvish-go-backward-history)
         ("M-s" . dirvish-setup-menu)
         ("M-f" . dirvish-toggle-fullscreen)
         ([remap dired-sort-toggle-or-edit] . dirvish-quicksort)
         ([remap dired-do-redisplay] . dirvish-ls-switches-menu)
         ([remap dired-summary] . dirvish-dispatch)
         ([remap dired-do-copy] . dirvish-yank-menu)
         ([remap mode-line-other-buffer] . dirvish-other-buffer))
  :config
  (dirvish-peek-mode)
  (setq dirvish-hide-details t)
  ;; open mp4 file via external program which is mpv here.
  (add-to-list 'mailcap-mime-extensions '(".mp4" . "video/mp4"))
  (add-list-to-list 'dirvish-open-with-programs '(
                                                  (("html") . ("open" "%f"))
                                                  (("xlsx") . ("open" "%f"))
                                                  (("pptx") . ("open" "%f"))
                                                  (("docx") . ("open" "%f"))
                                                  (("md")   . ("open" "%f"))
                                                  ))
  :custom
  (dirvish-menu-bookmarks '(("h" "~/"             "Home")
                            ("d" "~/Downloads/"   "Downloads")
                            ("e" "~/.emacs.d.default/"    "Emacs")
                            ("o" "~/org/"         "org")
                            ("i" "~/iCloud/"      "iCloud")
                            ;; ("t" "~/.local/share/Trash/files/" "TrashCan")
                            ))
  (dirvish-mode-line-format '(:left
                              (sort file-time " " file-size symlink) ; it's ok to place string inside
                              :right
                              ;; For `dired-filter' users, replace `omit' with `filter' segment defined below
                              (omit yank index)))
  (dirvish-attributes '(subtree-state
                        file-size
                        vc-state
                        git-msg
                        file-time
                        ;; all-the-icons
                        ))
  )
```

## init-dired.el 文件尾

``` commonlisp

(provide 'init-dired)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dired.el ends here
```

# init-tools.el

## init-tools.el 文件头

``` commonlisp
;;; init-tools.el --- Tools settings -*- lexical-binding: t -*-
;;; Commentary: Useful tools to make Emacs efficient!

;;; Code:

```

## helpful帮助增强

[helpful](https://github.com/Wilfred/helpful) 插件提供了帮助增强。

``` commonlisp
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
```

## which-key快捷键

[which-key](https://github.com/justbur/emacs-which-key)
插件将提示快捷键。

``` commonlisp
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
```

## init-tools.el 文件尾

``` commonlisp

(provide 'init-tools)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-tools.el ends here
```

# init-dev.el

## init-dev.el 文件头

``` commonlisp
;;; init-dev.el --- Development settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## vc设置

Emacs自带的vc设置。

``` commonlisp
(use-package vc
  :ensure nil
  :custom
  ;; 打开链接文件时，不进行追问
  (vc-follow-symlinks t)
  (vc-allow-async-revert t)
  (vc-handled-backends '(Git)))
```

## magit版本管理

[magit](https://github.com/magit/magit)
是Emacs里的另一个杀手级应用！可以直接在Emacs里进行基于git的版本管理。

``` commonlisp
(use-package magit
  :ensure t
  :hook (git-commit-mode . flyspell-mode)
  :bind (("C-x g"   . magit-status)
         ("C-x M-g" . magit-dispatch)
         ("C-c M-g" . magit-file-dispatch))
  :custom
  (magit-diff-refine-hunk t)
  (magit-ediff-dwim-show-on-hunks t))
```

## diff-hl高亮显示修改的部分

[diff-hl](https://github.com/dgutov/diff-hl)
插件可以在左侧高亮显示相对于远程仓库的修改部分。

``` commonlisp
(use-package diff-hl
  :ensure t
  :hook ((dired-mode         . diff-hl-dired-mode-unless-remote)
         (magit-pre-refresh  . diff-hl-magit-pre-refresh)
         (magit-post-refresh . diff-hl-magit-post-refresh))
  :init
  (global-diff-hl-mode t)
  :config
  ;; When Emacs runs in terminal, show the indicators in margin instead.
  (unless (display-graphic-p)
    (diff-hl-margin-mode)))
```

## magit-delta增强git diff

[magit-delta](https://github.com/dandavison/magit-delta) 插件可以通过
`git-delta` 来更优化的方式显示diff内容（需要提前安装
`brew install git-delta` ）。

``` commonlisp
(use-package magit-delta
  :ensure t
  :hook (magit-mode . magit-delta-mode)
  :config
  (setq magit-delta-hide-plus-minus-markers nil)
  )
```

## paren高亮匹配的括号

``` commonlisp
(use-package paren
  :ensure nil
  :hook (after-init . show-paren-mode)
  :custom
  (show-paren-when-point-inside-paren t)
  (show-paren-when-point-in-periphery t))
```

## rainbow-delimeters多彩括号

[rainbow-delimiters](https://github.com/Fanael/rainbow-delimiters)
插件将多彩显示括号等分隔符。

``` commonlisp
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
```

## emacs-lisp语言设置

``` commonlisp
(use-package elisp-mode
  :ensure nil
  :after org
  :bind (:map emacs-lisp-mode-map
              ("C-c C-b" . eval-buffer)
              ("C-c C-c" . eval-to-comment)
              :map lisp-interaction-mode-map
              ("C-c C-c" . eval-to-comment)
              :map org-mode-map
              ("C-c C-;" . eval-to-comment)
              )
  :init
  ;; for emacs-lisp org babel
  (add-to-list 'org-babel-default-header-args:emacs-lisp
             '(:results . "value pp"))
  :config
  (defconst eval-as-comment-prefix " ⇒ ")
  (defun eval-to-comment (&optional arg)
    (interactive "P")
    ;; (if (not (looking-back ";\\s*"))
    ;;     (call-interactively 'comment-dwim))
    (call-interactively 'comment-dwim)
    (progn
      (search-backward ";")
      (forward-char 1))
    (delete-region (point) (line-end-position))
    (save-excursion
      (let ((current-prefix-arg '(4)))
        (call-interactively 'eval-last-sexp)))
    (insert eval-as-comment-prefix)
    (end-of-line 1))
  )
```

## Python语言设置

Python语言的设置。[py-autopep8.el](https://github.com/paetzke/py-autopep8.el)
插件可以让我们在编写Python保存文件的时候，自动以 `PEP8`
标准做格式美化（需要提前 `brew install autopep8` ）。

``` commonlisp
(use-package python
  :ensure nil
  :mode ("\\.py\\'" . python-mode)
  :init
  (add-list-to-list 'org-babel-default-header-args:python '((:results . "output pp")
                                                            (:noweb   . "yes")
                                                            (:session . "py")
                                                            (:async   . "yes")
                                                            (:exports . "both")
                                                            ))
  :config
  (setq python-indent-offset 4)
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  (setq python-indent-guess-indent-offset-verbose nil)
  (setq python-shell-interpreter "python3"
        python-shell-prompt-detect-failure-warning nil)
  ;; disable native completion
  (add-to-list 'python-shell-completion-native-disabled-interpreters "python3")
  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))
  )

;; need to pip install autopep8 first
(use-package py-autopep8
  :ensure t
  :hook (python-mode . py-autopep8-mode)
  )
```

## Shell语言设置

``` commonlisp
(use-package sh-script
  :ensure nil
  :mode (("\\.sh\\'"     . sh-mode)
         ("zshrc"        . sh-mode)
         ("zshenv"       . sh-mode)
         ("/PKGBUILD\\'" . sh-mode))
  :hook (sh-mode . sh-mode-setup)
  :bind (:map sh-mode-map
         ("C-c C-e" . sh-execute-region))
  :init
  ;; for org babel
  (add-list-to-list 'org-babel-default-header-args:shell
                  '((:results . "output")
                    (:tangle  . "no")))
  :config
  (defun sh-mode-setup ()
    (add-hook 'after-save-hook #'executable-make-buffer-file-executable-if-script-p nil t))
  :custom
  (sh-basic-offset 2)
  (sh-indentation 2))
```

## init-dev.el 文件尾

``` commonlisp

(provide 'init-dev)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dev.el ends here
```

# init-mail.el

Emacs邮件设置。

## init-mail.el 文件头

``` commonlisp
;;; init-mail.el --- Mail settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## notmuch邮件系统

notmuch邮件系统配置。

``` commonlisp
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
```

## 邮件发送配置

``` commonlisp
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
```

## 邮件系统通知

``` commonlisp
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
```

## init-mail.el 文件尾

``` commonlisp

(provide 'init-mail)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-mail.el ends here
```

# init-rss.el

Emacs的RSS新闻阅读设置

## init-rss.el 文件头

``` commonlisp
;;; init-rss.el --- RSS settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## elfeed

[elfeed](https://github.com/skeeto/elfeed)
插件是一个非常棒的RSS新闻阅读客户端。

``` commonlisp
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
```

## elfeed-goodies给elfeed优化增强

我们通过
[elfeed-goodies](https://github.com/jeetelongname/elfeed-goodies) 插件给
elfeed 进行优化增强：

``` commonlisp
(use-package elfeed-goodies
  :ensure t
  :hook (after-init . elfeed-goodies/setup)
  :config
  ;; set elfeed show entry switch function
  (setq elfeed-show-entry-switch #'elfeed-goodies/switch-pane) ; switch-to-buffer, pop-to-buffer
  )
```

## init-rss.el 文件尾

``` commonlisp

(provide 'init-rss)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-rss.el ends here
```

# init-shell.el

Emacs里的shell设置。

## init-shell.el 文件头

``` commonlisp
;;; init-shell.el --- (E)shell settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

```

## eshell 基本配置

``` commonlisp
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
```

## eshell alias 设置

``` text
alias ff find-file $1
alias fo find-file-other-window $1
alias d dired $1
alias ll ls -alh
alias l. ls -dh .*
alias up eshell-up $1
alias pk eshell-up-peek $1
alias less view-file $1
alias more view-file $1
```

## eshell 里的 C-d

让 `C-d` 更智能：

``` commonlisp
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
```

## Eshell 的命令历史

``` commonlisp
(use-package em-hist
  :ensure nil
  :defer t
  :custom
  (eshell-history-size 1024)
  (eshell-hist-ignoredups t)
  (eshell-save-history-on-exit t))
```

## 有些命令使用 term

有一些命令如 top，我们还是使用 term：

``` commonlisp
;; following commands will run on term instead
(use-package em-term
  :ensure nil
  :defer t
  :custom
  (eshell-visual-commands '("top" "htop" "less" "more"))
  (eshell-visual-subcommands '(("git" "help" "lg" "log" "diff" "show")))
  (eshell-visual-options '(("git" "--help" "--paginate")))
  (eshell-destroy-buffer-when-process-dies t))
```

## eshell-git-prompt 命令行主题

[eshell-git-prompt](https://github.com/xuchunyang/eshell-git-prompt)
插件提供了数个好看的 Eshell 命令行主题。

``` commonlisp
(use-package eshell-git-prompt
  :ensure t
  :after esh-mode
  :custom-face
  (eshell-git-prompt-multiline2-dir-face ((t (:foreground "#c09035" :bold t))))
  :config
  (eshell-git-prompt-use-theme 'multiline2)
  )
```

## eshell-syntax-highlighting 语法高亮

[eshell-syntax-highlighting](https://github.com/akreisher/eshell-syntax-highlighting)
插件为Eshell提供语法高亮。

``` commonlisp
(use-package eshell-syntax-highlighting
  :after esh-mode
  :ensure t
  :hook (eshell-mode . eshell-syntax-highlighting-global-mode)
  :custom-face
  (eshell-syntax-highlighting-shell-command-face ((t (:foreground "#7cc77f" :bold t))))
  )
```

## esh-autosuggest自动补全

[esh-autosuggest](https://github.com/dieggsy/esh-autosuggest)
提供Fish类似的Eshell命令自动补全功能。类似的插件还有
[capf-autosuggest](https://github.com/emacsmirror/capf-autosuggest)。

> 使用 `C-f` 来补全整句，使用 `M-f` 来补全一个词。

``` commonlisp
(use-package esh-autosuggest
  :ensure t
  :hook (eshell-mode . esh-autosuggest-mode)
  )
```

## eshell-up快速进入父级文件夹

[eshell-up](https://github.com/peterwvj/eshell-up)
插件可以快速进入当前文件夹的任何一个父级文件夹。通过 `up`
命令（已经设置了alias）进入当前文件夹的任何一级父目录。

``` commonlisp
(use-package eshell-up
  :ensure t
  :commands (eshell-up eshell-up-peek)
  :config
  ;; to print the matching parent directory before changing to it
  (setq eshell-up-print-parent-dir t)
  )
```

## init-shell.el 文件尾

``` commonlisp

(provide 'init-shell)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-shell.el ends here
```
