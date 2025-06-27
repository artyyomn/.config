(deftheme vague
  "A soft and balanced color theme.")

(let ((class '((class color) (min-colors 89)))
      (colors '((bg . "#141415")
                (fg . "#cdcdcd")
                (comment . "#606079")
                (builtin . "#b4d4cf")
                (func . "#c48282")
                (string . "#e8b589")
                (constant . "#aeaed1")
                (keyword . "#6e94b2")
                (type . "#9bb4bc")
                (warning . "#f3be7c")
                (error . "#d8647e")
                (plus . "#7fa563")
                (visual . "#333738"))))

  (custom-theme-set-faces
   'vague

   ;; Base
   `(default ((,class (:background ,(cdr (assoc 'bg colors))
                                   :foreground ,(cdr (assoc 'fg colors))))) ) ;; Added closing parenthesis here
   `(cursor ((,class (:background ,(cdr (assoc 'fg colors))))))
   `(fringe ((,class (:background ,(cdr (assoc 'bg colors))))))
   `(region ((,class (:background ,(cdr (assoc 'visual colors))))))

   ;; Syntax
   `(font-lock-comment-face ((,class (:foreground ,(cdr (assoc 'comment colors)) :slant italic))))
   `(font-lock-builtin-face ((,class (:foreground ,(cdr (assoc 'builtin colors))))))
   `(font-lock-function-name-face ((,class (:foreground ,(cdr (assoc 'func colors))))))
   `(font-lock-string-face ((,class (:foreground ,(cdr (assoc 'string colors))))))
   `(font-lock-constant-face ((,class (:foreground ,(cdr (assoc 'constant colors))))))
   `(font-lock-keyword-face ((,class (:foreground ,(cdr (assoc 'keyword colors))))))
   `(font-lock-type-face ((,class (:foreground ,(cdr (assoc 'type colors))))))

   ;; UI
   `(mode-line ((,class (:background ,(cdr (assoc 'visual colors)) :foreground ,(cdr (assoc 'fg colors))))))
   `(mode-line-inactive ((,class (:background ,(cdr (assoc 'bg colors)) :foreground ,(cdr (assoc 'comment colors))))))
   `(minibuffer-prompt ((,class (:foreground ,(cdr (assoc 'keyword colors)) :weight bold))))

   ;; Diagnostics
   `(error ((,class (:foreground ,(cdr (assoc 'error colors)) :weight bold))))
   `(warning ((,class (:foreground ,(cdr (assoc 'warning colors)) :weight bold))))
   `(success ((,class (:foreground ,(cdr (assoc 'plus colors))))))
   ))

(provide-theme 'vague)
