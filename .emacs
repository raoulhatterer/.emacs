;; el-get Basic Setup with Installation via MELPA	
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")



(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
	       '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")


;; (el-get-bundle raoulhatterer/oef-mode
;;   :description "Provide oef-mode (Online Exercise Format for wims) to emacs")

;; (:name el-get
;; :website "https://github.com/dimitri/el-get#readme"
;; :description "Manage the external elisp bits and pieces you depend upon."
;; :type github
;; :branch "4.stable"
;; :pkgname "dimitri/el-get"
;; :info "."
;; :load "el-get.el")


(el-get 'sync)


;; si l'on n'utilise pas el-get
(require 'package) 
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list
   'package-archives
   '("gnu" . "http://elpa.gnu.org/packages/")))

;; si l'on utilise pas 'cask' ou el-get faire:
(add-to-list 'load-path "~/.emacs.d/lisp/oef-mode") ;; Tell emacs where is your personal elisp lib dir
(load "oef-mode.el") ;; load the packaged named oef-mode
;ou alors utiliser cask

(package-initialize)

(define-coding-system-alias 'UTF-8  'utf-8)


(load-library "iso-transl") ; pour avoir l'accent circonflexe
;; (require 'sr-speedbar)
;; (sr-speedbar-open)

;; FaceList
;; List faces using ‘M-x list-faces-display’ and customize them by hitting enter. This is a standard Emacs command.

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;; global activation of the unicode symbol completion 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-blinks 2)
 '(blink-cursor-delay 1)
 '(blink-cursor-interval 0.1)
 '(debug-on-error t)
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-pyvenv elpy-module-highlight-indentation elpy-module-yasnippet elpy-module-django elpy-module-sane-defaults)))
 '(elpy-rpc-python-command "python3")
 '(global-company-mode t)
 '(indent-tabs-mode nil)
 '(initial-scratch-message
   ";; This buffer is for text that is not saved, and for Lisp evaluation.
;; To create a file, visit it with \\[find-file] and enter text in its buffer.
;; M-x sr-speedbar-open to open the speedbar menu sr-speedbar-close to close it.
;; C-x C-f /sudo::/path/to/file")
 '(org-format-latex-options
   (quote
    (:foreground default :background default :scale 1.2 :html-foreground "Black" :html-background "Transparent" :html-scale 1.0 :matchers
                 ("begin" "$1" "$" "$$" "\\(" "\\["))))
 '(org-mobile-directory "~/Dropbox/Applications/MobileOrg")
 '(org-plantuml-jar-path "~/.emacs.d/plantuml.jar")
 '(org-src-preserve-indentation nil)
 '(package-selected-packages
   (quote
    (popup-kill-ring avy helm switch-window which-key web-mode all-the-icons dashboard realgud-rdb2 evil-numbers flycheck-plantuml pytest realgud company-arduino arduino-mode yasnippet-classic-snippets django-snippets common-lisp-snippets sr-speedbar django-mode markdown-mode+ markdown-preview-eww markdown-preview-mode pacmacs wrap-region corral company-web company-jedi company-math company-auctex yafolding auto-virtualenv jquery-doc exec-path-from-shell js-comint quickrun noctilux-theme zone-rainbow xah-find tidy rainbow-mode rainbow-identifiers rainbow-delimiters rainbow-blocks python projectile-git-autofetch projectile-codesearch org multi-web-mode magic-latex-buffer keychain-environment jedi hydandata-light-theme hlinum git-auto-commit-mode flx-isearch flx-ido find-file-in-repository embrace elpy egg diredful dired-rainbow dired-k dired+ clues-theme basic-theme aurora-theme auctex ample-zen-theme alect-themes ac-html ac-emmet)))
 '(plantuml-jar-path "~/.emacs.d/plantuml.jar")
 '(python-shell-interpreter "python3")
 '(save-place t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(web-mode-tests-directory "~/tests/")
 '(yas-snippet-dirs (quote (yasnippet-classic-snippets-dir))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-block ((t (:inherit shadow :background "#ffffbb")))))

;; Save M-x history
(savehist-mode 1)

;;  Typed text replaces the selection if the selection is active
(delete-selection-mode 1)



;;; EVIL NUMBERS                            
;; Increment / Decrement binary, octal, decimal and hex literals with shift next and prior page.
;; Works like C-a/C-x in vim, i.e. searches for number up to eol and then increments or decrements and keep zero padding up (unlike in vim)
;; When a region is active, as in evil’s visual mode, all the numbers within that region will be incremented/decremented (unlike in vim)
(require 'evil-numbers)
(global-set-key (kbd "<S-prior>") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "<S-next>") 'evil-numbers/dec-at-pt)

;;; PROJECTILE
(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  )

;;; WHICH-KEY
(use-package which-key
  :ensure t
  :config
    (which-key-mode))

;;; SWITCH-WINDOW
(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
        '("q" "s" "d" "f" "j" "k" "l" "m"))
  :bind
  ([remap other-window] . switch-window))

(defun split-and-follow-horizontally ()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically ()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))

(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

;;; AVY
(use-package avy
  :ensure t
  :bind
    ("M-s" . avy-goto-char))


;;; ELECTRIC-PAIR-PAIRS
(setq electric-pair-pairs '(
                            (?\{ . ?\})
                            (?\( . ?\))
                            (?\[ . ?\])
                            (?\" . ?\")
                            ))
(electric-pair-mode t)

;;; POPUP-KILL-RING
(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

;;; DASHBOARD
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*")))
                                        ; To add icons to the widget headings and their items:
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (dashboard-modify-heading-icons '((recents . "file-text")
                                    (bookmarks . "book")))
                                        ; To show navigator below the banner:
  (setq dashboard-set-navigator t)
  ;; Format: "(icon title help action face prefix suffix)"
  (setq dashboard-navigator-buttons
        `(;; line1
          ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
            "Homepage"
            "Browse homepage"
            (lambda (&rest _) (browse-url "homepage")))
           ("★" "Star" "Show stars" (lambda (&rest _) (show-stars)) warning)
           ("?" "" "?/h" #'show-help nil "<" ">"))
          ;; line 2
          ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
            "Linkedin"
            ""
            (lambda (&rest _) (browse-url "homepage")))
           ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))
  (setq dashboard-items '((recents  . 5)
                          (bookmarks . 5)
                          (projects . 5)
                          (agenda . 5)
                          (registers . 5)))
  )


;; YASNIPPET
(require 'yasnippet)
(yas-global-mode 1)

;; ORG-MODE
;; I like to see an outline of pretty bullets instead of a list of asterisks.
(use-package org-bullets
  :init
  (add-hook 'org-mode-hook #'org-bullets-mode))
;; I like seeing a little downward-pointing arrow instead of the usual ellipsis (...) that org displays when there’s stuff under a header.
(setq org-ellipsis "⤵")

;; Use syntax highlighting in source blocks while editing.
(setq org-src-fontify-natively t)

;; Make TAB act as if it were issued in a buffer of the language’s major mode.
(setq org-src-tab-acts-natively t)

;; When editing a code snippet, use the current window rather than popping open a new one (which shows the same information).
(setq org-src-window-setup 'current-window)

;; Allow export to markdown and beamer (for presentations).
(require 'org)
(require 'ox-md)
(require 'ox-latex)
(require 'ox-beamer)

;; You must define a beamer class in org-latex-export-classes: 
(eval-after-load "ox-latex"

  ;; update the list of LaTeX classes and associated header (encoding, etc.)
  ;; and structure
  '(add-to-list 'org-latex-classes
                `("beamer"
                  ,(concat "\\documentclass[presentation]{beamer}\n"
                           "[DEFAULT-PACKAGES]"
                           "[PACKAGES]"
                           "[EXTRA]\n")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))))

;; For nice code blocks, use Listings instead of Verbatim:

(setq org-latex-listings t)
    

;; Exporting to PDF

;; I want to produce PDFs with syntax highlighting in the code. The best way to do that seems to be with the minted package, but that package shells out to pygments to do the actual work. pdflatex usually disallows shell commands; this enables that.


(setq org-latex-pdf-process
      '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

;; Include the minted package in all of my LaTeX exports. 
(add-to-list 'org-latex-packages-alist '("" "minted"))
(setq org-latex-listings 'minted)




;; Store a link to the current location
(global-set-key (kbd "C-c l")     'org-store-link)


;; image size in preview
(setq org-image-actual-width 300)



;; To enable python, gnuplot,... in org-mode 'src' code blocs
;; shortcut c-c c-,
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (gnuplot .t)
   (latex.t)
   (shell . t)
   (ditaa .t)
   (plantuml .t)
   (arduino .t)))



(setq org-latex-create-formula-image-program 'imagemagick)

;; Don’t ask before evaluating code blocks.
(setq org-confirm-babel-evaluate nil)
 

;;  Shades the background of regular blocks, and colors source blocks only for Python and Emacs-Lisp languages.
(require 'color)

;; (set-face-attribute 'org-block nil :background
;;                     (color-darken-name
;;                      (face-attribute 'default :background) 4))


;; '(flyspell-default-dictionary "english")
;; Change Flyspell dictionary with F6 
(let ((langs '("english" "francais")))
  (setq lang-ring (make-ring (length langs)))
  (dolist (elem langs) (ring-insert lang-ring elem)))
(defun cycle-ispell-languages ()
  (interactive)
  (let ((lang (ring-ref lang-ring -1)))
    (ring-insert lang-ring lang)
    (ispell-change-dictionary lang)))
(global-set-key [f6] 'cycle-ispell-languages)

;; (dolist (hook '(text-mode-hook oef-mode-hook))
;;   (add-hook hook (lambda () (flyspell-mode 1))))
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)

;;; KEYBOARD
;; to increase / decrease  the buffer text size  `C-x C-+’ and ‘C-x C--’
;; (‘text-scale-adjust’)  (`C-+’ or ‘C--’ to repeat). To restore the default
;; (global) face height, type ‘C-x C-0’. ‘S-mouse-1’ pops up a menu where you 
;; can choose these same actions.
;; 2 keys for "en dash" (osX like) 
(global-set-key (kbd "M--") (lambda () (interactive) (insert "–")))
;; french guillemet 
(global-set-key (kbd "C-<") (lambda () (interactive) (insert "« ")))
(global-set-key (kbd "C->") (lambda () (interactive) (insert " »")))
;; (Ctrl + Alt + espace)  un espace insécable : 0xA0 
(global-set-key (kbd "C-M-SPC") (lambda () (interactive) (insert " ")))
;; magit-status
(global-set-key (kbd "C-c m") 'magit-status)
;; Expand Region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

;;; CORRECTION ORTHOGRAPHIQUE
;; This is bound to 'C-;' and 'échap TAB'
(flyspell-mode 1)


;;; TRADUCTION
(use-package google-translate
  :ensure t)
(require 'google-translate-smooth-ui)
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '( ("en" . "fr") ("fr" . "en") ("el" . "fr") ("fr" . "el") ("el" . "en") ("en" . "el")))
;; you'll be able to switch between different
;; translation directions directly from minibuffer by using "C-n" and
;; "C-p" key bindings



;;; javascript
(require 'js-comint)
(use-package indium
  :ensure t)



;;; PYTHON
(elpy-enable)
(define-key yas-minor-mode-map (kbd "C-c k") 'yas-expand)

;; (with-eval-after-load 'python
;;   (defun python-shell-completion-native-try ()
;;     "Return non-nil if can trigger native completion."
;;     (let ((python-shell-completion-native-enable t)
;;           (python-shell-completion-native-output-timeout
;;            python-shell-completion-native-try-output-timeout))
;;       (python-shell-completion-native-get-completions
;;        (get-buffer-process (current-buffer))
;;        nil "_"))))



(require 'auto-virtualenv)
(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)


(use-package virtualenvwrapper
  :ensure t
  :config
  (venv-initialize-interactive-shells) ;; if you want interactive shell support
  (venv-initialize-eshell) ;; if you want eshell support
  (setq venv-location "/home/hatterer/.virtualenvs/")
  )


;;; COMPLETION (better than built-in)
(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
;;  better search
(global-set-key (kbd "C-M-s") #'flx-isearch-forward)
(global-set-key (kbd "C-M-r") #'flx-isearch-backward)



;;; MULTIPLE CURSORS
(require 'multiple-cursors)
;; When you have an active region that spans multiple lines, the following will
;; add a cursor to each line:
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
;; When you want to add multiple cursors not based on continuous lines, but based on
;; keywords in the buffer, use:
(global-set-key (kbd "C-)") 'mc/mark-next-like-this)
(global-set-key (kbd "C-(") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-(") 'mc/mark-all-like-this)
;; First mark the word, then add more cursors.
;; To get out of multiple-cursors-mode, press `<return>` or `C-g`. The latter will
;; first disable multiple regions before disabling multiple cursors. If you want to
;; insert a newline in multiple-cursors-mode, use `C-j`.
;; - Sometimes you end up with cursors outside of your view. You can
;;   scroll the screen to center on each cursor with `C-v` and `M-v`.


;;; yafolding - Folding code blocks based on indentation.
(require 'yafolding)
(define-key yafolding-mode-map (kbd "<C-S-return>") nil)
(define-key yafolding-mode-map (kbd "<C-M-return>") nil)
(define-key yafolding-mode-map (kbd "<C-return>") nil)
(define-key yafolding-mode-map (kbd "C-c <C-M-return>") 'yafolding-toggle-all)
(define-key yafolding-mode-map (kbd "C-c <C-S-return>") 'yafolding-hide-parent-element)
(define-key yafolding-mode-map (kbd "C-c <C-return>") 'yafolding-toggle-element)
(add-hook 'prog-mode-hook
          (lambda () (yafolding-mode)))


;;; WEB-MODE
(use-package web-mode
  :ensure t
  :config
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))
  )

;;; EMMET-MODE
(defvar emmet-mode-keymap
  (let
      ((map (make-sparse-keymap)))
    (define-key map (kbd "C-j") 'emmet-expand-line)
    (define-key map (kbd "<C-return>") 'emmet-expand-line)
    (define-key map (kbd "<C-M-right>") 'emmet-next-edit-point)
    (define-key map (kbd "<C-M-left>") 'emmet-prev-edit-point)
    (define-key map (kbd "C-c w") 'emmet-wrap-with-markup)
    map)
  "Keymap for emmet minor mode.")



(require 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode) ;; Auto-start on any markup modes
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)
(add-hook 'web-mode-hook  'emmet-mode)



;;; RAINBOW-DELIMITERS
(require 'rainbow-delimiters)
(add-hook 'oef-mode-hook 'rainbow-delimiters-mode)

;;; RAINBOW-MODE
(require 'rainbow-mode)
(add-to-list 'rainbow-html-colors-major-mode-list 'oef-mode) ; 
(add-hook 'oef-mode-hook 'rainbow-mode) ; Auto-start CSS colorization

;;; WRAP-REGION-MODE
(require 'wrap-region)
(add-hook 'oef-mode-hook 'wrap-region-mode)



;; arduino-mode
;; You can compile and upload the sketches with "M-x compile" suivi de  "make upload". 
(require 'cl)
(autoload 'arduino-mode "arduino-mode" "Arduino editing mode." t)
(add-to-list 'auto-mode-alist '("\.ino$" . arduino-mode))



;;; Change bracket pairs from one type to another.
(defun xah-change-bracket-pairs ( @from-chars @to-chars)
  "Change bracket pairs from one type to another.

For example, change all parenthesis () to square brackets [].
Works on selected text, or current text block.
URL `http://ergoemacs.org/emacs/elisp_change_brackets.html'
Version 2018-03-31"
  (interactive
   (let (($bracketsList
          '("(paren)"
            "{brace}"
            "[square]"
            "<greater>"
            "`emacs'"
            "`markdown`"
            "~tilde~"
            "=equal="
            "\"ascii quote\""
            "[[double square,2]]"
            "“curly quote”"
            "‘single quote’"
            "‹angle quote›"
            "«double angle quote»"
            "「corner」"
            "『white corner』"
            "【LENTICULAR】"
            "〖white LENTICULAR〗"
            "〈angle bracket〉"
            "《double angle bracket》"
            "〔TORTOISE〕"
            "⦅white paren⦆"
            "〚white square〛"
            "⦃white curly bracket⦄"
            "〈angle bracket〉"
            "⦑ANGLE BRACKET WITH DOT⦒"
            "⧼CURVED ANGLE BRACKET⧽"
            "⟦math square⟧"
            "⟨math angle⟩"
            "⟪math DOUBLE ANGLE BRACKET⟫"
            "⟮math FLATTENED PARENTHESIS⟯"
            "⟬math WHITE TORTOISE SHELL BRACKET⟭"
            "❛HEAVY SINGLE QUOTATION MARK ORNAMENT❜"
            "❝HEAVY DOUBLE TURNED COMMA QUOTATION MARK ORNAMENT❞"
            "❨MEDIUM LEFT PARENTHESIS ORNAMENT❩"
            "❪MEDIUM FLATTENED LEFT PARENTHESIS ORNAMENT❫"
            "❴MEDIUM LEFT CURLY BRACKET ORNAMENT❵"
            "❬MEDIUM LEFT-POINTING ANGLE BRACKET ORNAMENT❭"
            "❮HEAVY LEFT-POINTING ANGLE QUOTATION MARK ORNAMENT❯"
            "❰HEAVY LEFT-POINTING ANGLE BRACKET ORNAMENT❱"
            "none"
            )))
     (list
      (ido-completing-read "Replace this:" $bracketsList )
      (ido-completing-read "To:" $bracketsList ))))
  (let ( $p1 $p2 )
    (if (use-region-p)
        (progn
          (setq $p1 (region-beginning))
          (setq $p2 (region-end)))
      (save-excursion
        (if (re-search-backward "\n[ \t]*\n" nil "move")
            (progn (re-search-forward "\n[ \t]*\n")
                   (setq $p1 (point)))
          (setq $p1 (point)))
        (if (re-search-forward "\n[ \t]*\n" nil "move")
            (progn (re-search-backward "\n[ \t]*\n")
                   (setq $p2 (point)))
          (setq $p2 (point)))))
    (save-excursion
      (save-restriction
        (narrow-to-region $p1 $p2)
        (let ( (case-fold-search nil)
               $fromLeft
               $fromRight
               $toLeft
               $toRight)
          (cond
           ((string-match ",2" @from-chars  )
            (progn
              (setq $fromLeft (substring @from-chars 0 2))
              (setq $fromRight (substring @from-chars -2))))
           (t
            (progn
              (setq $fromLeft (substring @from-chars 0 1))
              (setq $fromRight (substring @from-chars -1)))))
          (cond
           ((string-match ",2" @to-chars)
            (progn
              (setq $toLeft (substring @to-chars 0 2))
              (setq $toRight (substring @to-chars -2))))
           ((string-match "none" @to-chars)
            (progn
              (setq $toLeft "")
              (setq $toRight "")))
           (t
            (progn
              (setq $toLeft (substring @to-chars 0 1))
              (setq $toRight (substring @to-chars -1)))))
          (cond
           ((string-match "markdown" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "`\\([^`]+?\\)`" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           ((string-match "tilde" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "~\\([^~]+?\\)~" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           ((string-match "ascii quote" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "\"\\([^\"]+?\\)\"" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           ((string-match "equal" @from-chars)
            (progn
              (goto-char (point-min))
              (while
                  (re-search-forward "=\\([^=]+?\\)=" nil t)
                (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                (replace-match (concat $toLeft "\\1" $toRight ) "FIXEDCASE" ))))
           (t (progn
                (progn
                  (goto-char (point-min))
                  (while (search-forward $fromLeft nil t)
                    (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                    (replace-match $toLeft "FIXEDCASE" "LITERAL")))
                (progn
                  (goto-char (point-min))
                  (while (search-forward $fromRight nil t)
                    (overlay-put (make-overlay (match-beginning 0) (match-end 0)) 'face 'highlight)
                    (replace-match $toRight "FIXEDCASE" "LITERAL")))))))))))

(global-set-key (kbd "C-c (") 'xah-change-bracket-pairs)


;;; LATEX XETEX (synchronization with evince)
;; Forward/inverse search with evince using D-bus.
;;
(server-start)
(add-hook 'LaTeX-mode-hook 'TeX-PDF-mode)
(add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
(setq TeX-source-correlate-method 'synctex)
;;
(if (require 'dbus "dbus" t)
    (progn
      ;; universal time, need by evince
      (defun utime ()
    	(let ((high (nth 0 (current-time)))
    	      (low (nth 1 (current-time))))
    	  (+ (* high (lsh 1 16) ) low)))
      ;;
      ;; Forward search.
      ;; Adapted from http://dud.inf.tu-dresden.de/~ben/evince_synctex.tar.gz
      (defun auctex-evince-forward-sync (pdffile texfile line)
    	(let ((dbus-name
	       "org.gnome.evince.Daemon"  ; service
	       "/org/gnome/evince/Daemon" ; path
	       "org.gnome.evince.Daemon"  ; interface
	       "FindDocument"
	       (concat "file://" pdffile)
	       t     ; Open a new window if the file is not opened.
	       )))
	(dbus-call-method :session
			  dbus-name
			  "/org/gnome/evince/Window/0"
			  "org.gnome.evince.Window"
			  "SyncView"
			  texfile
			  (list :struct :int32 line :int32 1)
			  (utime))))
  ;;
  (defun auctex-evince-view ()
    (let ((pdf (file-truename (concat default-directory
				      (TeX-master-file (TeX-output-extension)))))
	  (tex (buffer-file-name))
	  (line (line-number-at-pos)))
      (auctex-evince-forward-sync pdf tex line)))

  ;; New view entry: Evince via D-bus.
  (setq TeX-view-program-list '())
  (add-to-list 'TeX-view-program-list
	       '("EvinceDbus" auctex-evince-view))

  ;; Prepend Evince via D-bus to program selection list
  ;; overriding other settings for PDF viewing.
  (setq TeX-view-program-selection '())
  (add-to-list 'TeX-view-program-selection
	       '(output-pdf "EvinceDbus"))

  ;; Inverse search.
  ;; Adapted from: http://www.mail-archive.com/auctex@gnu.org/msg04175.html
  (defun auctex-evince-inverse-sync (file linecol timestamp)
    (let ((buf (get-file-buffer (substring file 7)))
	  (line (car linecol))
	  (col (cadr linecol)))
      (if (null buf)
	  (message "Sorry, %s is not opened..." file)
	(switch-to-buffer buf)
	(goto-line (car linecol))
	(unless (= col -1)
	  (move-to-column col)))))

  (dbus-register-signal
   :session nil "/org/gnome/evince/Window/0"
   "org.gnome.evince.Window" "SyncSource"
   'auctex-evince-inverse-sync))



