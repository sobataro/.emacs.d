;; load-path を追加する関数
(defun add-to-load-path (&rest paths)
  (let (path)
    (dolist (path paths paths)
      (let ((default-directory
              (expand-file-name (concat user-emacs-directory path))))
        (add-to-list 'load-path default-directory)
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))

;; 各ディレクトリとそのサブディレクトリを load-path に追加
(add-to-load-path "elisp" "conf" "public_repos")



;; markdown-mode.el
(autoload 'markdown-mode "markdown-mode"
  "major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))



;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; Mac の場合 (ファッキン unicode 正規化)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))



;; カラーテーマ
(when (require 'color-theme nil t)
  (color-theme-initialize)
  (color-theme-hober))

;; モードラインにカラム番号を表示
(column-number-mode t)

;; 行番号を表示
(global-linum-mode t)
(setq linum-format "%3d ")

;; カーソル行に下線
(setq hl-line-face 'underline)
(global-hl-line-mode)

;; インデントはスペースのみ
(setq-default indent-tabs-mode nil)

;; 対応する括弧のハイライト
(setq show-paren-delay 0)
(show-paren-mode t)

;; "C-c l" で line wrap を切り替え
(define-key global-map (kbd "C-c l") 'toggle-truncate-lines)
