(message "- packages configurations...")

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))

;; Use Package before Emacs initialization.
(setq package-enable-at-startup nil)
(package-initialize)

;;
;; INSTALL MODES
;;

;; SCSS mode
(unless (package-installed-p 'scss-mode) (package-refresh-contents)
        (package-install 'scss-mode))
(require 'scss-mode)
(setq scss-compile-at-save nil)
(setq css-indent-offset 2)
(add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;; YAML mode
(unless (package-installed-p 'yaml-mode) (package-refresh-contents)
        (package-install 'yaml-mode))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; Syntax highlighting for Slim
(unless (package-installed-p 'slim-mode)
  (package-refresh-contents)
  (package-install 'slim-mode))

(unless (package-installed-p 'markdown-mode) (package-refresh-contents)
        (package-install 'markdown-mode))
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; web-mode - an autonomous emacs major-mode for editing web templates
(unless (package-installed-p 'web-mode) (package-refresh-contents)
        (package-install 'web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ssp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
(setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2)
  (setq js-indent-level 2)

;; rjsx-mode
(unless (package-installed-p 'rjsx-mode) (package-refresh-contents)
        (package-install 'rjsx-mode))
(add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))

;; js2 mode, a better Javascript mode
(unless (package-installed-p 'js2-mode) (package-refresh-contents)
        (package-install 'js2-mode))
;;(add-hook 'js-mode-hook 'js2-minor-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; js2 refector mode
(unless (package-installed-p 'js2-refactor) (package-refresh-contents)
        (package-install 'js2-refactor))
(require 'js2-refactor)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c j")




;; Lua mode
(unless (package-installed-p 'lua-mode) (package-refresh-contents)
        (package-install 'lua-mode))





;; Elixir mode
(unless (package-installed-p 'elixir-mode) (package-refresh-contents)
        (package-install 'elixir-mode))

(unless (package-installed-p 'alchemist) (package-refresh-contents)
        (package-install 'alchemist))
(global-company-mode)
(require 'elixir-mode)
(require 'alchemist)

(setq alchemist-test-truncate-lines nil)

(add-to-list 'display-buffer-alist
             `(,(rx bos (or "*alchemist test report*"
                            "*alchemist mix*"
                            "*alchemist help*"))
                    (display-buffer-reuse-window
                     display-buffer-in-side-window)
               (reusable-frames . visible)
               (side            . bottom)
               (window-width   . 0.5)))

;; Open a new line with a pipe on control return
(defun mg/open-new-line-with-pipe ()
     "open a new line with a pipe"
     (interactive)
     (progn
       (newline)
       (insert "|> ")
       (indent-according-to-mode)))
(define-key elixir-mode-map [(control return)] #'mg/open-new-line-with-pipe)






;; Flycheck Credo
(unless (package-installed-p 'flycheck-credo) (package-refresh-contents)
        (package-install 'flycheck-credo))
(eval-after-load 'flycheck '(flycheck-credo-setup))
(add-hook 'elixir-mode-hook 'flycheck-mode)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq flycheck-elixir-credo-strict t)


(unless (package-installed-p 'ruby-mode) (package-refresh-contents)
        (package-install 'ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec\\'" . ruby-mode))
(add-to-list 'auto-mode-alist '("config.ru\\'" . ruby-mode))

;; Emmet mode (aka Zen Coding)
(unless (package-installed-p 'emmet-mode) (package-refresh-contents)
        (package-install 'emmet-mode))
(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'css-mode-hook  'emmet-mode) ;; enable Emmet's css abbreviation.
(add-hook 'rjsx-mode-hook  'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2))) ;; indent 2 spaces.
(define-key emmet-mode-keymap (kbd "C-j") nil) ;; C-RET is enough

;; ORG mode
(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;; Typescript mode
(unless (package-installed-p 'typescript-mode) (package-refresh-contents)
        (package-install 'typescript-mode))

;;
;; INSTALL OTHER PACKAGES
;;

;; Magit - Git client
(unless (package-installed-p 'magit) (package-refresh-contents)
        (package-install 'magit))
(global-set-key (kbd "C-c g") 'magit-status)
(defun my-truncate-lines ()
  (setq truncate-lines t))
(add-hook 'magit-diff-mode-hook 'my-truncate-lines)

;; phi-search
(unless (package-installed-p 'phi-search) (package-refresh-contents)
        (package-install 'phi-search))
(require 'phi-search)

(global-set-key (kbd "C-s") 'phi-search)
(global-set-key (kbd "C-r") 'phi-search-backward)

;; multiple-cursors
(unless (package-installed-p 'multiple-cursors) (package-refresh-contents)
        (package-install 'multiple-cursors))
(require 'multiple-cursors)
(global-set-key (kbd "C-c m l l") 'mc/edit-lines)
(global-set-key (kbd "C-c m l b") 'mc/edit-beginnings-of-lines)
(global-set-key (kbd "C-c m l e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-c m a a") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c m a r") 'mc/mark-all-in-region)
(global-set-key (kbd "C-c m e") 'mc/mark-more-like-this-extended)
(global-set-key (kbd "C-c m t") 'mc/mark-sgml-tag-pair)
(global-set-key (kbd "C-c m SPC") 'set-rectangular-region-anchor)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-{") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-}") 'mc/skip-to-previous-like-this)


;;flycheck for on the fly syntax checking
(unless (package-installed-p 'flycheck) (package-refresh-contents)
        (package-install 'flycheck))
(add-hook 'after-init-hook 'global-flycheck-mode)

;; inf-ruby provides a REPL buffer connected to a Ruby subprocess
(unless (package-installed-p 'inf-ruby) (package-refresh-contents)
        (package-install 'inf-ruby))

;; Projectile is a project interaction library for Emacs
(unless (package-installed-p 'projectile) (package-refresh-contents)
        (package-install 'projectile))
(projectile-global-mode)
(define-key projectile-mode-map [?\s-d] 'projectile-find-dir)
(define-key projectile-mode-map [?\s-p] 'projectile-switch-project)
(define-key projectile-mode-map [?\s-f] 'projectile-find-file)
(define-key projectile-mode-map [?\s-g] 'projectile-grep)

;; Fuzzy matching for Emacs ... a la Sublime Text.
(unless (package-installed-p 'flx-ido)
  (package-refresh-contents)
  (package-install 'flx-ido))
(flx-ido-mode 1)
(setq ido-use-faces 1) ;; disable ido faces to see flx highlights.

;; Yasnippet - A template system for Emacs
(unless (package-installed-p 'yasnippet) (package-refresh-contents)
        (package-refresh-contents)
        (package-install 'yasnippet))
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-snippet-dirs (directory-files "~/.emacs.d/snippets" t))
(setq yas-prompt-functions
      '(yas-dropdown-prompt
        yas-ido-prompt
        yas-x-prompt
        yas-completing-prompt
        yas-no-prompt))

;; REST Client
(unless (package-installed-p 'restclient) (package-refresh-contents)
        (package-install 'restclient))

;; Powerline
(unless (package-installed-p 'powerline) (package-refresh-contents)
        (package-install 'powerline))

;; Expand-region - extension to increase selected region by semantic units
(unless (package-installed-p 'expand-region) (package-refresh-contents)
        (package-install 'expand-region))
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;; Conect with Dash.app
(add-to-list 'load-path "~/.emacs.d/plugins/dash/")
(autoload 'dash-at-point "dash-at-point"
  "Search the word at point with Dash." t nil)
(global-set-key "\C-cf" 'dash-at-point)
(global-set-key "\C-ck" 'dash-at-point-with-docset)

;; Lorem Ipsum mode
(unless (package-installed-p 'lorem-ipsum) (package-refresh-contents)
        (package-install 'lorem-ipsum))
(require 'lorem-ipsum)

;; avy mode
(unless (package-installed-p 'avy) (package-refresh-contents)
        (package-install 'avy))
(require 'avy)
(global-set-key (kbd "s-l") 'avy-goto-line)
(global-set-key (kbd "s-j") 'avy-goto-subword-1)
(global-set-key (kbd "s-J") 'avy-goto-char)
(global-unset-key (kbd "s-k"))
(global-set-key (kbd "s-k r") 'avy-kill-region)
(global-set-key (kbd "s-k l") 'avy-kill-whole-line)
(global-unset-key (kbd "s-m"))
(global-set-key (kbd "s-m r") 'avy-move-region)
(global-set-key (kbd "s-m l") 'avy-move-line)
(setq avy-style 'at-full)

;; Git Time Machine
(unless (package-installed-p 'git-timemachine) (package-refresh-contents)
        (package-install 'git-timemachine))
(require 'git-timemachine)

;; AG
(unless (package-installed-p 'ag) (package-refresh-contents)
        (package-install 'ag))
(require 'ag)

;; Switch Window
(unless (package-installed-p 'switch-window) (package-refresh-contents)
        (package-install 'switch-window))
(require 'switch-window)
(setq switch-window-shortcut-style 'qwerty)
(setq switch-window-qwerty-shortcuts
      '("a" "s" "d" "f" "j" "k" "l" ";" "w" "e" "i" "o"))

;; Vimish-fold
(unless (package-installed-p 'vimish-fold) (package-refresh-contents)
        (package-install 'vimish-fold))
(require 'vimish-fold)
(global-set-key (kbd "C-c v f") 'vimish-fold)
(global-set-key (kbd "C-c v v") 'vimish-fold-delete)
(vimish-fold-global-mode 1)

;; Smex
(unless (package-installed-p 'smex) (package-refresh-contents)
        (package-install 'smex))
(require 'smex)
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; Which-key
(unless (package-installed-p 'which-key) (package-refresh-contents)
        (package-install 'which-key))
(require 'which-key)
(which-key-mode)
(which-key-setup-side-window-bottom)
(setq which-key-popup-type 'minibuffer)


;; Writeroom-mode
(unless (package-installed-p 'writeroom-mode) (package-refresh-contents)
        (package-install 'writeroom-mode))
(require 'writeroom-mode)
(with-eval-after-load 'writeroom-mode
  (define-key writeroom-mode-map (kbd "C-M-<") #'writeroom-decrease-width)
  (define-key writeroom-mode-map (kbd "C-M->") #'writeroom-increase-width)
  (define-key writeroom-mode-map (kbd "C-M-=") #'writeroom-adjust-width))
(global-set-key (kbd "<C-return>") 'writeroom-mode)
(setq writeroom-restore-window-config t)
(setq writeroom-width 120)

;; nlinum
(unless (package-installed-p 'nlinum) (package-refresh-contents)
        (package-install 'nlinum))
(require 'nlinum)
(global-nlinum-mode t)






;; String inflection
(unless (package-installed-p 'string-inflection) (package-refresh-contents)
        (package-install 'string-inflection))
(require 'string-inflection)
(global-set-key (kbd "C-c i") 'string-inflection-cycle)
(global-set-key (kbd "C-c C") 'string-inflection-camelcase)        ;; Force to CamelCase
(global-set-key (kbd "C-c l") 'string-inflection-lower-camelcase)  ;; Force to lowerCamelCase
(global-set-key (kbd "C-c J") 'string-inflection-java-style-cycle) ;; Cycle through Java styles
(global-set-key (kbd "C-c u") 'string-inflection-underscore) ;; undescorer
