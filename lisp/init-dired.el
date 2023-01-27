;;; init-dired.el --- Dired settings -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

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

(use-package diredfl
  :ensure t
  :hook (dired-mode . diredfl-mode))

(use-package all-the-icons-dired
  :ensure t
  :hook (dired-mode . all-the-icons-dired-mode)
  )

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

(provide 'init-dired)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-dired.el ends here
