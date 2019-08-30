;; Open recent files
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

;; Multiple cursor
(global-set-key (kbd "C-c m l l") 'mc/edit-lines)
(global-set-key (kbd "C-c m l b") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c m l e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c m a a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m a r") 'mc/mark-all-in-region)
(global-set-key (kbd "C-c m e") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-c m t") 'mc/mark-sgml-tag-pair)
(global-set-key (kbd "C-c m SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-{") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-}") 'mc/skip-to-previous-like-this)

;; iBuffer
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Sort selected lines
(global-set-key (kbd "C-c s l") 'sort-lines)

;; Projectile shortcuts
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)

;; Keybinding
(global-set-key (kbd "C-|") 'align-regexp)
(global-set-key "\C-h" 'backward-delete-char-untabify)
(define-key isearch-mode-map "\C-h" 'isearch-delete-char)

(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)

(global-set-key (kbd "<s-up>") 'scroll-up-line)
(global-set-key (kbd "<s-down>") 'scroll-down-line)
