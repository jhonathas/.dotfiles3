
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(message "Loading configurations...")

(load-file "~/.emacs.d/config/editor.el")
(load-file "~/.emacs.d/config/packages.el")
(load-file "~/.emacs.d/config/funcs.el")
(load-file "~/.emacs.d/config/kbd.el")

(message "All configurations successfully loaded.")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(package-selected-packages
   (quote
    (rjsx-mode nlinum writeroom-mode avy avy-mode graphql-mode nvm which-key ## smex hlinum vimish-fold ag flycheck-credo git-timemachine ace-jump-mode lorem-ipsum expand-region powerline restclient alchemist flx-ido projectile inf-ruby flycheck magit emmet-mode elixir-mode lua-mode js2-refactor js2-mode web-mode markdown-mode yaml-mode slim-mode scss-mode)))
 '(safe-local-variable-values (quote ((encoding . utf-8)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
