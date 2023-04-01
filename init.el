;;; init.el --- The main init entry for Emacs -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(require 'package)
(setq package-archives
	  '(("melpa"  . "https://melpa.org/packages/")
	    ("gnu"    . "https://elpa.gnu.org/packages/")
	    ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

(package-initialize)

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

(provide 'init)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(connection-local-criteria-alist
   '(((:application eshell)
      eshell-connection-default-profile)))
 '(connection-local-profile-alist
   '((eshell-connection-default-profile
      (eshell-path-env-list))))
 '(package-selected-packages
   '(popper shackle plantuml-mode multiple-cursors super-save eshell-up cal-china-x gnuplot ox-gfm elfeed-goodies crux keycast fanyi yasnippet capf-autosuggest diminish denote ox-reveal dirvish no-littering quelpa-use-package magit-delta eshell-git-prompt orderless org-appear embark-consult ox-hugo marginalia py-autopep8 org-modern all-the-icons-completion which-key fontaine sdcv ef-themes doom-modeline undo-tree org-contrib all-the-icons-dired ox-pandoc toc-org corfu esh-autosuggest diredfl org-super-links htmlize consult-notes helpful rainbow-delimiters diff-hl org-auto-tangle minions pinyinlib eshell-syntax-highlighting cape ol-notmuch vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
