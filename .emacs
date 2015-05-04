;; -*-emacs-lisp-*-
;; Ref. http://pages.sachachua.com/.emacs.d/Sacha.html
;; Ref. https://github.com/cinsk/emacs-scripts/blob/master/init.el (http://www.cinsk.org)

;; Personal Information
(setq user-full-name "IkJung Yun"
      user-mail-address "YIJ329@kins.re.kr"
      user-affilation-name "Korea Institute of Nuclear Safety"
      user-modification-date "2015.04.26")


;; ;;; emacs packages for my personal uses are placed in $HOME/.emacs.d

;; (setq user-emacs-directory "~/.emacs.d/")

;; (if (not (file-accessible-directory-p user-emacs-directory))
;;     (if (yes-or-no-p
;;          (format "create user directory(%s)? " user-emacs-directory))
;;         (make-directory user-emacs-directory t)))

;; (let ((srcpath (concat (file-name-as-directory
;;                         (expand-file-name user-emacs-directory))
;;                        "src")))
;;   (add-to-list 'load-path srcpath)
;;   (when (and (boundp 'uinit/use-byte-compile) uinit/use-byte-compile)
;;     (byte-recompile-directory srcpath 0)))

;; (defvar user-custom-package-directory
;;   (concat (file-name-as-directory user-emacs-directory)
;;           "packages")
;;   "Manually installed packages are in this directory")



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)

(add-to-list 'package-archives
             '("sc" . "http://joseito.republika.pl/sunrise-commander/") t)

(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-pinned-packages '(magit . "melpa-stable"))

(package-initialize)

;; Use-Package
;; https://github.com/jwiegley/use-package
(eval-when-compile
  (require 'use-package))
(require 'diminish)                ;; if you use :diminish
(require 'bind-key)                ;; if you use any :bind variant

;; Load-Personal Setting
(load "~/.emacs.d/my-emacs.d.el")

;; Load-Personal Setting
(load "~/.emacs.d/my-org.el")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(ansi-color-names-vector
   ["black" "red" "green" "yellow" "magenta" "blue" "cyan" "white"])
 '(c-default-style
   (quote
    ((c-mode . "linux")
     (c++-mode . "k&r")
     (java-mode . "java")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(column-number-mode t)
 '(compilation-window-height 15)
 '(custom-enabled-themes (quote (wheatgrass)))
 '(default-input-method "korean-hangul")
 '(display-time-mode t)
 '(egg-enable-tooltip t)
 '(gdb-many-windows t)
 '(gdb-show-main t)
 '(global-cwarn-mode t)
 '(grep-find-use-grep-r nil)
 '(menu-bar-mode t)
 '(org-agenda-files
   (quote
    ("~/AGENDA/PERSONAL.org" "~/AGENDA/HANUL.org" "~/AGENDA/WOLSONG.org" "~/AGENDA/KORI.org" "~/AGENDA/HANBIT.org" "~/AGENDA/ETC.org" "~/AGENDA/DEPT.org" "~/AGENDA/DIARY.org")))
 '(org-export-latex-default-packages-alist
   (quote
    (("" "kotex" t)
     ("AUTO" "inputenc" nil)
     ("T1" "fontenc" nil)
     ("" "fixltx2e" nil)
     ("" "graphicx" t)
     ("" "longtable" nil)
     ("" "float" nil)
     ("" "wrapfig" nil)
     ("" "soul" t)
     ("" "textcomp" t)
     ("" "marvosym" t)
     ("" "wasysym" t)
     ("" "latexsym" t)
     ("" "amssymb" t)
     ("" "hyperref" nil)
     "\\tolerance=1000")))
 '(package-selected-packages
   (quote
    (2048-game with-editor dash-at-point dash-functional bbdb auto-compile use-package color-theme-solarized color-theme python-mode sr-speedbar ## org-plus-contrib org)))
 '(resize-minibuffer-mode t)
 '(scroll-bar-mode nil)
 '(send-mail-function (quote mailclient-send-it))
 '(set-language-environment "Korean")
 '(show-paren-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(tooltip-mode nil)
 '(visible-bell t)
 '(which-function-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Consolas" :foundry "outline" :slant normal :weight normal :height 113 :width normal)))))


;; * Preventing the control characters in shell mode
;; Allow shell mode to handle color output from shell commands
;; (notably from ls --color command)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;
;; Make the inferior shell a login shell.
(setq explicit-bash-args (quote ("--noediting" "-i" "-l")))



;;---------------------------------------------------------------------------------------------------
;; Mode :: http://tkhwang.tistory.com/29
;; (setq auto-mode-alist (cons '("\\.html$" . html-helper-mode)  auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.htm$"  . html-helper-mode)  auto-mode-alist))
(setq auto-mode-alist (cons '("\\.c$"    . c-mode)            auto-mode-alist))
(setq auto-mode-alist (cons '("\\.a$"    . c-mode)            auto-mode-alist))
(setq auto-mode-alist (cons '("\\.h$"    . c++-mode)          auto-mode-alist))
(setq auto-mode-alist (cons '("\\.cpp$"  . c++-mode)          auto-mode-alist))
(setq auto-mode-alist (cons '("\\.scl$"  . c-mode)            auto-mode-alist))
(setq auto-mode-alist (cons '("\\.el$"   . emacs-lisp-mode)   auto-mode-alist))
(setq auto-mode-alist (cons '("\\.bat$"  . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.mak$"  . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.gmk$"  . shell-script-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.min$"  . shell-script-mode) auto-mode-alist))


;;--------------------------------------------------------------------------------------------
;; Indent set-up
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(add-hook 'emacs-lisp-mode-hook 'turn-on-auto-fill)
(add-hook 'c-mode-hook 'turn-on-auto-fill)
(add-hook 'LaTex-mode-hook 'turn-on-auto-fill)

;;--------------------------------------------------------------------------------------------
;;;; Showing and hiding block of code (Hs-package)
;;; http://emacs-fu.blogspot.com/2008/12/showing-and-hiding-blocks-of-code.html
;;; http://tkhwang.tistory.com/35
(add-hook 'c-mode-common-hook
          (lambda()
            (local-set-key (kbd "C-c <right>") 'hs-show-block)
            (local-set-key (kbd "C-c <left>") 'hs-hide-block)
            (local-set-key (kbd "C-c <up>") 'hs-show-all)
            (local-set-key (kbd "C-c <down>") 'hs-hide-all)
            (local-set-key (kbd "C-c C-c") 'compile)
            (hs-minor-mode t)
            ;;(linum-mode t)
            ))


                                        ;--------------------------------------------------------------------------------------------
;;;; Keymaps
;;; Emacs uses key-maps to record which keys call which commands. When you use global-set-key to set
;;; the key-binding for a single command in all part of Emacs, you are specifying the key-binding in
;;; "current-global-map"
;;; Specific modes, such as C mode or Text mode, have their own key-maps; the mode-specific key-maps
;;; override the global map that is shared by all buffers.

(global-set-key (kbd "C-c C-i") 'indent-region)
(global-set-key (kbd "C-c ;") 'comment-region)
(global-set-key (kbd "C-c C-;") 'uncomment-region)
(global-set-key "\C-co" 'occur) ; I use occur alo, so let's bind it to a key
(global-set-key "\C-cs" 'eshell)
(global-set-key "\C-c C-s" 'unicode-shell) ;; defined in .emacs written by cinsk.
(global-set-key (kbd "C-c d") 'gdb)
;;; Unbind 'C-x f'  => There is a reason for this unbinding : I found I inanadvertently typed C-x f
;;; when I meant to type C-x C-f. Rather than find a file, as I intented, I accidentally set the
;;; width for filled text, alomost always to a width I did not want. Since I hardly ever reset my
;;; default width. I simply unbound the key.
(global-unset-key "\C-xf")
;;; Rebind 'C-x C-b' for 'buffer-menu)
(global-set-key "\C-x\C-b" 'buffer-menu)
(global-set-key [(control c)(n)(return)] 'linum-mode)

;;--------------------------------------------------------------------------------------------
;; Set the spacing between lines
;; line=spacing 5 : there will be 5 pixels between lines
;; line=spacing 0.5 : deicmal value means the proprotion (0.5 = 50%)
;; With the above code, pressing F7 will toggle line spacing to small and large This is Useful for
;; example, when you often switch between coding and document reading or novel reading 

(defun toggle-line-spacing ()
  "Toggle line spacing between no extra space to extra half line height."
  (interactive)
  (if (eq line-spacing nil)
      (setq-default line-spacing 0.5) ; add 0.5 height between lines
    (setq-default line-spacing nil)   ; no extra heigh between lines
    ))

(global-set-key (kbd "<f7>") 'toggle-line-spacing)


;;---------------------------------------------------------------------------------------------------
;;;; Korean Evironment Set
;; (prefer-coding-system 'euc-kr)
;; (set-default-coding-systems 'euc-kr)
;; (set-terminal-coding-system 'euc-kr)
;; (set-keyboard-coding-system 'euc-kr)
;; (set-selection-coding-system 'euc-kr)
;; (setq-default buffer-coding-system 'euc-kr)
;; (setq-default buffer-file-coding-system 'euc-kr)
;; (setq-default file-name-coding-system 'euc-kr)
;; (setq-default locale-coding-system 'euc-kr)

;; (prefer-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-terminal-coding-system 'utf-8)
;; (set-keyboard-coding-system 'utf-8)
;; (set-selection-coding-system 'utf-8)
;; (setq-default buffer-coding-system 'utf-8)
;; (setq-default buffer-file-coding-system 'utf-8)
;; (setq-default file-name-coding-system 'utf-8)
;; (setq-default locale-coding-system 'utf-8)

;;;; Color-theme
;;(setq load-path (cons (expand-file-name "~/.emacs.d/color-theme-6.6.0") load-path))
;;(load-library "color-theme")
;;;; (require 'color-theme)

;; (defvar color-theme-favorites '(color-theme-deep-blue
;;                                 color-theme-cinsk-wood
;;                                 color-theme-charcoal-black
;;                                 color-theme-clarity
;;                                 color-theme-comidia
;;                                 color-theme-dark-blue2
;;                                 color-theme-dark-laptop
;;                                 color-theme-taylor
;;                                 color-theme-robin-hood)
;;   "My favorite color theme list")

;; (load-library "etheme")

;; ;; Don't delete duplicated line, otherwise cursor will be removed.
;; (require 'etheme)
;; (etheme-apply-theme "cinsk")
;; (etheme-apply-theme "cinsk")


;;;; aspell
;;;; (setq load-path (cons (expand-file-name "C:/emacs/Aspell/bin") load-path))
(setq-default ispell-program-name "aspell")
(setq-default ispell-local-dictionary "english")


;;---------------------------------------------------------------------------------------------------
;;;; Indent Tabs Mode
;; By default, Emacs inserts tabs in place of multiple spaces when it formats a region. (For
;;Example, you might indet many lines of text all at once with the indent-region command). Tabs
;; look fine on a terminal or with ordinary pringting, but they produce badly indented output
;; when you use Tex or Texinfo since TeX ignores Tabs. The following turns off Inder Tabs Mode
;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)
;;;
;;; TAB & space setting
;;;
(setq-default indent-tabs-mode nil)    ; do not insert tab character.


;; These hook configuration ensures that all tab characters in C, C++
;; source files are automatically converted to spaces on saving.
;; (add-hook 'c-mode-hook '(lambda ()
;;                           (make-local-variable 'write-contents-hooks)
;;                           (add-hook 'write-contents-hooks 'source-untabify)))
;; (add-hook 'c++-mode-hook '(lambda ()
;;                             (make-local-variable 'write-contents-hooks)
;;                             (add-hook 'write-contents-hooks 'source-untabify)))



;; LaTex-mode-hook is not Latex-mode-hook. T is a upper case letter.

;;;; Turn on math mode by default
(add-hook 'LaTeX-mode-hook 'latex-math-mode)

;; turn on REFTeX mode by Default
(autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
(autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
(autoload 'reftex-citation "reftex-cite" "Make citation" nil)
(autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex) ; with AUCTeX LaTeX mode
;;(add-hook 'latex-mode-hook 'turn-on-reftex) ; with Emacs latex mode

;;;; turn on flyspell mode by default
(require 'flyspell)
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(autoload 'flyspell-delay-command "flyspell" "Delay on command." t)
(autoload 'tex-mode-flyspell-verify "flyspell" "" t)

;; the default flyspell behaviour
(put 'LeTex-mode 'flyspell-mode-predicate 'tex-mode-flyspell-verify)
;; some extra flyspell delayed command
(mapcar 'flyspell-delay-command    '(scroll-up1 scroll-down1))

(add-hook 'LaTeX-mode-hook 'flyspell-mode)

;; (add-hook 'LaTeX-mode-hook '(flyspell-mode t))


;;;
;;; Buffer Menu
;;;

;; Sort by the 2nd column (buffer name) in Buffer list
(setq Buffer-menu-sort-column 2)

;; ibuffer - advanced buffer menu
(global-set-key (kbd "C-x C-b") 'ibuffer)
(autoload 'ibuffer "ibuffer" "List buffers." t)

(setq ibuffer-saved-filter-groups
      '(("default"
         ("dired" (mode . dired-mode))
         ("manual" (or
                    (name . "^\\*info.*\\*$")
                    (name . "^\\*Man.*\\*$")
                    (name . "^\\*Help.*\\*$")))
         ("emacs" (or
                   (name . "^\\*scratch\\*$")
                   (name . "^TAGS$")
                   (name . "^\\*.*\\*$"))))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups "default")))

;;;
;;; Switching between buffers using iswitchb
;;;
(iswitchb-mode 1)            ; smart buffer switching mode
;;(setq iswitchb-default-method 'maybe-frame) ; ask to use another frame.




(put 'upcase-region 'disabled nil)

(setq-default fill-column 95)
(setq fill-column 95)

;; Same Frame - speedbar
(setq load-path (cons (expand-file-name "~/.emacs.d/elpa/sr-speedbar-20141004.532") load-path))
(require 'sr-speedbar)
(setq sr-speedbar-right-side nil)
(setq sr-speedbar-default-width 30)
;;(global-set-key (kbd "C-c b") 'sr-speedbar-toggle)

;;; PYTHON MODE
(setq load-path (cons (expand-file-name "~/.emacs.d/elpa/python-mode-20150327.438") load-path))
(setq py-install-directory "c:/msys64/home/WhiteBear/.emacs.d/elpa/python-mode-20150327.438")
(require 'python-mode)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (setq py-install-directory "~/.emacs.d/elpa/python-mode-20150327.438")
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))




;; WINDOW SETTING
(cd "~/")
(eval (find-file '"~/AGENDA/WOLSONG.org"))



;; Maximize Emacs on Windoes at startup
;; http://stackoverflow.com/questions/815239/how-to-maximize-emacs-on-windows-at-startup
;; Author : http://www.weitz.de/win/#emacs
(w32-send-sys-command 61488)



