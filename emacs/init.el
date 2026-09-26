;;; Early initialization
(setq gc-cons-threshold (* 100 1000 1000)
      gc-cons-percentage 0.6)

;;; Custom / themes
(setq custom-file "~/.config/emacs/emacs.custom.el")

(add-to-list 'custom-theme-load-path
             "~/.config/emacs/themes/")

(load-theme 'doom-monokai-classic t)
;; (load-theme 'meliora t)

;;; UI
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 0)

(pixel-scroll-precision-mode 1)
(global-display-line-numbers-mode 1)
(global-font-lock-mode 1)
(column-number-mode 1)

(fido-vertical-mode 1)
(ido-mode 1)
(electric-pair-mode 1)

;; Frame transparency
(set-frame-parameter (selected-frame) 'alpha '(98 . 98))

;; Font
(set-face-attribute 'default nil
                    :family "Blex Mono Nerd Font"
                    :height 140)

(setq-default line-spacing 0
              indent-tabs-mode t
              tab-width 4
              fringe-indicator-alist '((continuation . nil)))

;;; Scrolling / redisplay
(setq scroll-conservatively 10000
      scroll-margin 10
      scroll-step 1
      scroll-preserve-screen-position t
      redisplay-dont-pause t
      fast-but-imprecise-scrolling t
      jit-lock-defer-time 0)

;;; General behavior
(setq ring-bell-function #'ignore
      c-basic-offset 4
      inhibit-startup-message t
      ido-show-dot-for-dired t
      display-line-numbers-type 'relative
      make-backup-files nil
      auto-save-default nil
      frame-title-format "%b — Emacs"
      use-short-answers t)

;;; Keybindings
(global-set-key (kbd "C-c c") #'compile)

;;; Disable line numbers in terminal/text-oriented modes
(dolist (hook '(shell-mode-hook
                vterm-mode-hook
                eshell-mode-hook
                term-mode-hook
                dired-mode-hook
                markdown-mode-hook
                text-mode-hook
                org-mode-hook))
  (add-hook hook #'(lambda ()
                     (display-line-numbers-mode -1))))

;;; Restore sane GC settings after startup
(add-hook 'emacs-startup-hook
          (lambda ()
            (setq gc-cons-threshold (* 20 1000 1000)
                  gc-cons-percentage 0.1)))

;;; Packages
(require 'package)

(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
        ("gnu"   . "https://elpa.gnu.org/packages/")))

(package-initialize)

;; Install use-package if necessary.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-ensure t)

;;; Packages
(use-package magit)

(use-package consult
  :bind (("C-x b" . consult-buffer)
         ("M-g i" . consult-imenu)
         ("M-s g" . consult-ripgrep)))

(use-package evil
  :init
  (setq evil-want-integration t
        evil-want-keybinding nil
        evil-want-C-u-scroll t
        evil-want-C-i-jump t)
  :config
  (evil-mode 1))

;;; Evil exceptions
(with-eval-after-load 'evil
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'vterm-mode 'emacs))
