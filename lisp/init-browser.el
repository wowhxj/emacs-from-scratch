;;; init-browser.el --- Browser settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package shr
  :ensure nil
  :defer t
  :custom
  (shr-inhibit-images t)                ; 不显示图片
  (shr-image-animate nil)               ; 不显示 gif
  )

(use-package eww
  :ensure nil
  :commands eww eww-follow-link
  :hook (eww-mode . visual-line-mode)
  :bind (("\e\e w" . eww)
         :map eww-mode-map
         ("o" . eww-browse-with-external-browser)
         ("D" . eww-forward-url)
         ("S" . eww-back-url)
         ("f" . link-hint-open-link)
         ("TAB" . shr-next-link)
         ("<backtab>" . shr-previous-link)
         ("j" . scroll-up-line)
         ("k" . scroll-down-line)
         )
  :config
  (setq eww-download-directory (expand-file-name "~/Downloads"))
  (setq eww-form-checkbox-symbol "☐")
  (setq eww-form-checkbox-selected-symbol "☑")
  )

(provide 'init-browser)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-browser.el ends here
