(setq custom-file "~/.config/emacs/emacs.custom.el")
(menu-bar-mode 0)
(tool-bar-mode 0)
(set-fringe-mode 0)
(scroll-bar-mode 0)
(pixel-scroll-precision-mode t)
(global-display-line-numbers-mode t)
(global-font-lock-mode t)
(ido-mode t)
(electric-pair-mode t)

(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")
(load-theme 'vague t)

(setq ido-show-dot-for-dired t)
(setq inhibit-startup-screen t)

;; (setq scroll-margin 5)
(setq scroll-conservatively 1000)
(setq scroll-preserve-screen-position t)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lock-files nil)
(setq display-line-numbers-type 'relative)

(setq-default indent-tab-mode t)
(setq-default truncate-lines t)
(setq-default tab-width 4)

(global-set-key (kbd "C-c c") 'compile)

(set-face-attribute 'default nil :family "IosevkaNerdFont"
					:height 150
					:weight 'regular)

(dolist (mode '(shell-mode
                eshell-mode
                term-mode
                dired-mode
				org-mode))
  (add-hook (intern (format "%s-hook" mode))
			(lambda () (display-line-numbers-mode 0))))

(setq c-basic-offset 4)

;; Plugins and LSP
(global-company-mode t)
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'go-mode-hook 'eglot-ensure)
