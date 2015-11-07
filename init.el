;; el-get の設定
(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

(add-to-list 'load-path (locate-user-emacs-file "el-get/el-get"))
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))



;; 文字コードの設定
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)

;; Mac の場合 (unicode 正規化対策)
(when (eq system-type 'darwin)
  (require 'ucs-normalize)
  (set-file-name-coding-system 'utf-8-hfs)
  (setq locale-coding-system 'utf-8-hfs))



;; anything
(el-get-bundle anything
  (define-key global-map (kbd "C-l") 'anything)
  (define-key global-map (kbd "C-x b") 'anything-for-files))
(el-get-bundle anything-config)



;; markdown-mode
(el-get-bundle markdown-mode)

;; yaml-mode
(el-get-bundle yaml-mode)


;; カラーテーマ
(el-get-bundle color-theme
  (when (require 'color-theme nil t)
    (color-theme-initialize)
    (color-theme-hober)))

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
