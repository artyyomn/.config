(setq custom-file "~/.config/emacs/emacs.custom.el")
(add-to-list 'custom-theme-load-path "~/.config/emacs/themes/")

(load-theme 'vague t)
;; (load-theme 'quiet t)

(menu-bar-mode 0)
(tool-bar-mode 0)
(set-fringe-mode 0)
(scroll-bar-mode 0)
;; (pixel-scroll-precision-mode 1)
(global-display-line-numbers-mode t)
(global-font-lock-mode t)
(ido-mode t)
(electric-pair-mode t)
(column-number-mode t)
(set-frame-parameter (selected-frame) 'alpha '(95 . 95))
(setq default-frame-alist '((width . 80) (height . 38)))

(setq scroll-conservatively 10000
      scroll-margin 10
      scroll-step 1
      scroll-preserve-screen-position t)

(setq c-basic-offset 4)
(setq inhibit-startup-message t)
(setq ido-show-dot-for-dired t)
(setq display-line-numbers-type 'relative)
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
;;(setq initial-scratch-message "")
(setq frame-title-format "%b — Emacs")
(setq use-short-answers t)

(setq-default fringe-indicator-alist '((continuation . nil)))
(setq-default indent-tab-mode t)
(setq-default tab-width 4)

;; (set-face-attribute 'default nil :family "UbuntuMono Nerd Font" :height 150)
(set-face-attribute 'default nil :family "JetBrainsMono Nerd Font" :height 150)
;; (set-face-attribute 'default nil :height 150)
;; (setq-default line-spacing 0)
(setq-default line-spacing 0.1)

(global-set-key (kbd "C-c c") 'compile)

(dolist (mode '(shell-mode
				vterm-mode
                eshell-mode
                term-mode
                dired-mode
				org-mode))
  (add-hook (intern (format "%s-hook" mode))
			(lambda () (display-line-numbers-mode 0))))

;; Package initialization
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))
(package-initialize)

;; Install use-package if missing
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(setq use-package-always-ensure t)

(use-package evil
  :init
  (setq evil-want-integration t      ;; required for evil-collection
        evil-want-keybinding nil     ;; required for evil-collection
        evil-want-C-u-scroll t
        evil-want-C-i-jump t)
  :config
  (evil-mode 1))
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'vterm-mode 'emacs)
