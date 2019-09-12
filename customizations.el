
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;; for El-get
(with-eval-after-load 'tls
  (push "/private/etc/ssl/cert.pem" gnutls-trustfiles))

(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-command-list
   (quote
    (("TeX" "%(PDF)%(tex) %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %t" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "%(PDF)amstex %`%S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "texexec --once --texutil %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "texexec %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil t :help "Run BibTeX")
     ("View" "%V" TeX-run-discard-or-function nil t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-command t t :help "Generate PostScript file")
     ("Index" "makeindex %s" TeX-run-command nil t :help "Create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")
     ("Jump to PDF" "%V" TeX-run-discard-or-function nil t :help "Run Viewer")
     ("latex->dvips->ps2pdf (PSTricks)" "%`%l%(mode)%’ %t && dvips -Ppdf %d -o && ps2pdf %f && open -a Skim.app %s.pdf" TeX-run-command nil
      (latex-mode doctex-mode)))))
 '(TeX-engine (quote xetex))
 '(TeX-view-program-selection
   (quote
    ((output-dvi "open")
     (output-pdf-skim-running "Skim")
     (output-pdf "Skim")
     (output-html "open"))))
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 311 t)
 '(aquamacs-tool-bar-user-customization
   (quote
    ((4194530 open-file save-buffer nil cut copy paste undo nil latex view bibtex preview))) t)
 '(current-language-environment "UTF-8")
 '(cursor-type t)
 '(debug-on-error t)
 '(default-frame-alist
    (quote
     ((tool-bar-lines . 1)
      (menu-bar-lines . 1)
      (foreground-color . "Black")
      (background-color . "White")
      (cursor-type . box)
      (cursor-color . "Red")
      (vertical-scroll-bars . right)
      (internal-border-width . 0)
      (fringe))))
 '(emulate-mac-french-keyboard-mode t)
 '(exec-path
   (quote
    ("/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/Applications/Aquamacs.app/Contents/MacOS/libexec" "/Applications/Aquamacs.app/Contents/MacOS/bin" "/usr/local/texlive/2015/bin" "/Library/TeX/texbin")))
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(global-company-mode t)
 '(global-flyspell-mode t)
 '(global-linum-mode t)
 '(indent-tabs-mode nil)
 '(ns-right-command-modifier (quote meta))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(org-agenda-files
   (quote
    ("/Users/raoul/org/photocopies.org" "/Users/raoul/org/Comment j'ai fait fonctionner MobileOrg.org" "/Users/raoul/org/from-mobile.org")))
 '(org-mobile-files (quote (org-agenda-files "~/org")))
 '(package-selected-packages
   (quote
    (yafolding company emmet-mode wrap-region org-mobile-sync blacken ido-vertical-mode nhexl-mode ediprolog language-detection package-lint expand-region rainbow-delimiters rainbow-mode smartscan org-tree-slide org-mac-iCal org-download multiple-cursors)))
 '(py-shell-name "python3")
 '(text-mode-hook (quote (er/add-text-mode-expansions smart-spacing-mode)))
 '(visual-line-mode nil t))

 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(latex-mode-default ((t (:inherit tex-mode-default :stipple nil :strike-through nil :underline nil :slant normal :weight normal :height 140 :width normal :family "FreeMono")))))
