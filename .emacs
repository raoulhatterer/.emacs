(require 'package) 
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))

(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list
   'package-archives
   '("gnu" . "http://elpa.gnu.org/packages/")))
;;(add-to-list 'load-path "~/.emacs.d/lisp/oef-mode") ;; Tell emacs where is your personal elisp lib dir
;;(load "oef-mode.el") ;; load the packaged named oef-mode

(package-initialize)


;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package auto-virtualenv   :ensure t)
(use-package elpy   :ensure t)
(use-package flx-ido   :ensure t)
(use-package google-translate   :ensure t)
(use-package indium  :ensure t)
(use-package js-comint   :ensure t)
(use-package multiple-cursors   :ensure t)
(use-package rainbow-delimiters   :ensure t)
(use-package rainbow-mode   :ensure t)
(use-package web-mode   :ensure t)
(use-package wrap-region   :ensure t)
(use-package emmet-mode   :ensure t)
(use-package expand-region  :ensure t)



;; FaceList
;; List faces using ‘M-x list-faces-display’ and customize them by hitting enter. This is a standard Emacs command.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debug-on-error t)
 '(global-company-mode t)
 '(package-selected-packages
   (quote
    (wrap-region corral company-web company-jedi company-math company-auctex yafolding auto-virtualenv jquery-doc exec-path-from-shell indium js-comint quickrun flycheck noctilux-theme pdf-tools zone-rainbow xah-find web-mode use-package tidy rainbow-mode rainbow-identifiers rainbow-delimiters rainbow-blocks python projectile-git-autofetch projectile-codesearch org multiple-cursors multi-web-mode magit magic-latex-buffer keychain-environment jedi hydandata-light-theme hlinum google-translate git-link git-auto-commit-mode flx-isearch flx-ido find-file-in-repository embrace elpy egg diredful dired-rainbow dired-k dired+ clues-theme basic-theme aurora-theme auctex ample-zen-theme alect-themes ac-html ac-emmet)))
 '(save-place t)
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Save M-x history
(savehist-mode 1)

;;  Typed text replaces the selection if the selection is active
(delete-selection-mode 1)

;; Flycheck automatically checks buffers for errors while you type, and reports
;; warnings and errors directly in the buffer and in an optional IDE-like error
;; list.
(add-hook 'after-init-hook 'global-flycheck-mode)

; '(flyspell-default-dictionary "english")
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
(require 'google-translate)
(require 'google-translate-smooth-ui)
(global-set-key "\C-ct" 'google-translate-smooth-translate)
(setq google-translate-translation-directions-alist
      '( ("en" . "fr") ("fr" . "en") ("el" . "fr") ("fr" . "el") ("el" . "en") ("en" . "el")))
;; you'll be able to switch between different
;; translation directions directly from minibuffer by using "C-n" and
;; "C-p" key bindings



;;; javascript
(require 'js-comint)
(require 'indium)

;;; PYTHON
(elpy-enable)

(require 'auto-virtualenv)
(add-hook 'python-mode-hook 'auto-virtualenv-set-virtualenv)

;;; Block-code in Org-mode
(setq org-babel-python-command "python3")
(org-babel-do-load-languages
 'org-babel-load-languages '((sh . t)(python . t)(emacs-lisp . t)))

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

;;; WEB-MODE
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.css?\\'" . web-mode))

;;; EMMET-MODE
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
