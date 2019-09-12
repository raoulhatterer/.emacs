;; This is the Aquamacs Preferences file.
;; Add Emacs-Lisp code here that should be executed whenever
;; you start Aquamacs Emacs. If errors occur, Aquamacs will stop
;; evaluating this file and print errors in the *Messages* buffer.
;; Use this file in place of ~/.emacs (which is loaded as well.)



(setenv "PATH" "/usr/local/bin:/Library/TeX/texbin/:$PATH" t)

; Dynamic Abbrevs
; Dynamic Abbreviations are one of the coolest functions in Emacs.

;; (global-set-key (kbd "C-<tab>") 'dabbrev-expand)
;; (define-key minibuffer-local-map (kbd "C-<tab>") 'dabbrev-expand)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)



;; for development
(add-to-list 'load-path "~/Library/Preferences/Aquamacs Emacs/Packages/lisp/oef-mode/")
(load "oef-mode") ;; load the packaged named oef (best not to include the ending “.el” or “.elc”)


(require 'package)
(package-initialize)



;; ;; IDO VERTICAL MODE
;; (require 'ido-vertical-mode)
;; (ido-mode 1)
;; (ido-vertical-mode 1)
;; (setq ido-vertical-define-keys 'C-n-and-C-p-only)

(add-hook 'after-init-hook #'global-flycheck-mode)

; *scratch* buffer
(setq initial-major-mode 'lisp-interaction-mode) 

;; Set to the location of your Org files on your local system
(setq org-directory "~/org")
;; Set to the name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/org/from-mobile.org")
;; Set to <your Dropbox root directory>/MobileOrg.
(setq org-mobile-directory "~/Dropbox/Applications/MobileOrg")

;; ---------------------------------------- 


;; specify the gnuplot executable (if other than /usr/bin/gnuplot)
;; (setq gnuplot-program "/usr/local/bin/gnuplot")

;; ----------------------------------------

;; (require 'projectile)
;; (projectile-global-mode)

;; ---------------------------------------- 

;; * company
(require 'company)
;; To use company-mode in all buffers, add the following line to your init file:
(add-hook 'after-init-hook 'global-company-mode)

;; ---------------------------------------- 

;; ;;SLIME is the “Superior Lisp Interaction Mode for Emacs.”
;; ;;SLIME extends Emacs with support for interactive programming in Common Lisp. 
(setq inferior-lisp-program "/usr/local/bin/clisp")
(setq slime-contribs '(slime-fancy))
(slime-setup '(slime-company))
(define-key company-active-map (kbd "\C-n") 'company-select-next)
(define-key company-active-map (kbd "\C-p") 'company-select-previous)
(define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
(define-key company-active-map (kbd "M-.") 'company-show-location)

;; ----------------------------------------

;; ;; Smartparens
(require 'smartparens)

(add-hook 'prog-mode-hook 'turn-on-smartparens-strict-mode)
(add-hook 'markdown-mode-hook 'turn-on-smartparens-strict-mode)
(global-set-key (kbd "<M-down>") 'sp-backward-up-sexp)
(global-set-key (kbd "<M-up>") 'sp-backward-down-sexp)
(global-set-key (kbd "<M-°>") 'sp-unwrap-sexp)

;; ---------------------------------------- 

(require 'multiple-cursors)
(global-set-key (kbd "C-)") 'mc/mark-next-like-this)
;; First mark the word, then add more cursors.

;; To get out of multiple-cursors-mode, press `<return>` or `C-g`. The latter will
;; first disable multiple regions before disabling multiple cursors. If you want to
;; insert a newline in multiple-cursors-mode, use `C-j`.

;; ----------------------------------------

;; Smart Scan
;(global-smartscan-mode t) ;; Turn on Smart Scan globally
;; The default key bindings for searching forward and backward are M-n and M-p, respectively.

;; ---------------------------------------- 

;; 2 keys for "en dash" (osX like)
(global-set-key (kbd "M--") (lambda () (interactive) (insert "–")))
(global-set-key (kbd "M-_") (lambda () (interactive) (insert "–")))
;; french guillemet
(global-set-key (kbd "C-<") (lambda () (interactive) (insert "« ")))
(global-set-key (kbd "C->") (lambda () (interactive) (insert " »")))
;; (Ctrl + Alt + espace)  un espace insécable : 0xA0
(global-set-key (kbd "C-M-SPC") (lambda () (interactive) (insert " ")))
;; magit-status
(global-set-key (kbd "C-c m") 'magit-status)
;; Expand Region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)


;;==============================================================================
;;; EMMET-MODE
;; oef-mode has to change the binding for 'emmet-wrap-with-markup
;; so add in your innit file:
(require 'emmet-mode)
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-c C-c") 'oef-edit-in-browser))
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-c w") 'emmet-wrap-with-markup))
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
;; `emmet-mode' will automatically start with oef-mode
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)

;; ---------------------------------------- 
;; * `rainbow-delimiters'
;; add to your init file:
(require 'rainbow-delimiters)
(add-hook 'oef-mode-hook 'rainbow-delimiters-mode) ; Auto-start parens matching

;; ---------------------------------------- 
;; * `rainbow-mode'
;; add to your init file:
(require 'rainbow-mode)
(add-to-list 'rainbow-html-colors-major-mode-list 'oef-mode) ; 
(add-hook 'oef-mode-hook 'rainbow-mode) ; Auto-start CSS colorization
;; * `yafolding'
;; Folding code blocks based on indentation
;; Automatically installed and launch

;; add to your init file:
(require 'wrap-region)
(add-hook 'oef-mode-hook 'wrap-region-mode)

;;==============================================================================
;; PYTHON
(elpy-enable)


(define-coding-system-alias 'UTF-8 'utf-8)
(define-coding-system-alias 'Utf8 'utf-8)
(define-coding-system-alias 'Utf-8 'utf-8)



(setq python-shell-interpreter "python3"
      python-shell-interpreter-args "-i")



;; To enable python and gnuplot in org-mode 'src' code blocs 
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (gnuplot .t)
   (latex.t)))

;; Don’t ask before evaluating code blocks.
(setq org-confirm-babel-evaluate nil)
 

;;  Shades the background of regular blocks, and colors source blocks only for Python and Emacs-Lisp languages.
(require 'color)
(set-face-attribute 'org-block nil :background
                    (color-darken-name
                     (face-attribute 'default :background) 4))




;; Exporting to PDF
;; Pygments nécessaire à minted est installé dans virtualenv/python3venv  
;; I want to produce PDFs with syntax highlighting in the code. The best way to do that seems to be with the minted package, but that package shells out to pygments to do the actual work. pdflatex usually disallows shell commands; this enables that.


(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Include the minted package in all of my LaTeX exports. 
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)







;; ;; for minted
;; (add-hook 'TeX-mode-hook
;;   (lambda ()
;;     (setq TeX-command-extra-options "-shell-escape")
;;   )
;;)
