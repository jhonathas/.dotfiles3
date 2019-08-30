(message "- editor configurations...")

;; Start fullscreen
(custom-set-variables '(initial-frame-alist (quote ((fullscreen . maximized)))))

;; UTF-8
(custom-set-variables
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces)

;; Set UTF-8 as default coding system.
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)

;; Prevent "encoding magic comment" on ruby-mode.
(setq ruby-insert-encoding-magic-comment nil)

;; Highlight matched and mismatched parenthesis.
(show-paren-mode 1)
(setq show-paren-delay 0)

;; Use 2 spaces to indent code instead of tabs.
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq web-mode-markup-indent-offset 2)
(setq ruby-deep-indent-paren nil)
(setq-default tab-width 2)
(setq ruby-indent-level 2)
(setq js-indent-level 4)

;; Delete the selection with a keypress.
(delete-selection-mode t)

;; Open recents files
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

;; Enable delete trailing whitespace
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable replace tab with spaces
;; (add-hook 'write-file-hooks (lambda () (untabify (point-min) (point-max))))

;; backup and auto save.
(setq backup-inhibited t)
(setq auto-save-default nil)
(setq create-lockfiles nil) ; Disable .# lockfile
(setq make-backup-files nil) ; stop creating ~ files

;; Dired: reuse current buffer by pressing 'a'.
(put 'dired-find-alternate-file 'disabled nil)

;; Auto revert file
;; Auto reload file when changed on another editor
(global-auto-revert-mode 1)

;; Load Zenburn color theme.
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'zenburn t)

;; Disable startup screen.
(setq inhibit-startup-screen t)

;; Disable toolbar.
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

;; Disable scrolling.
(scroll-bar-mode -1)

;; Disable cursor blink.
(blink-cursor-mode -1)

;; Highlight the current line.
(global-hl-line-mode +1)

;; Show line numbers with an empty space after each number.
;; (global-linum-mode t)
;; (setq column-number-mode t)

;; Set Monaco as default font on mac
(set-default-font "Monaco-17")
(add-to-list 'default-frame-alist '(font . "Monaco-17"))

;; automatically insert the right matching bracket
(electric-pair-mode 1)

;; Enable IDO.
(require 'ido)
(ido-mode t)

;; Display ido results vertically, rather than horizontally
(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
	(define-key ido-completion-map (kbd "C-n") 'ido-next-match)
	(define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)

;; Resize buffer
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)


