;; * replace yes with y
(defalias 'yes-or-no-p 'y-or-n-p)

;; Backups
(setq make-backup-files nil)
;; (setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
;; (setq delete-old-versions t)
;; (setq version-control t)
;; (setq vc-make-backup-files t)
;; (setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Sentences end with a single space
(setq sentence-end-double-space nil)

;;;; Easier Transition between Windows :: M-up, M-down, M-left, and M-right keys.
(windmove-default-keybindings 'meta)

;;; When a user paste clipboard content in Emacs using mouse button 2,
;;; the content will be pasted in the place at mouse click.  Comment
;;; below line for the default behavior (at mouse click).
(setq mouse-yank-at-point t)

;;;; ShowParenMode : highlight matching parentheses , Show-paren-mode allows one to see matching
;;;; pairs of parentheses and other characters. When point is on one of the pared characted, the
;;;; oter is highlighted. Activate it once.
(setq-default show-paren-delay 0)


;; highlight current line
(add-hook 'emacs-lisp-mode-hook (lambda () (hl-line-mode 1)))
(add-hook 'c++-mode-hook (lambda () (hl-line-mode 1)))

;; (defun my-delete-frame ()
;;   "Deletes the current frame. If this is the last frame, quit Emacs."
;;   (interactive)
;;   (if (cdr (frame-list))
;;       (delete-frame)
;;     (save-buffers-kill-emacs)))
;; (global-set-key [\M-f4] 'my-delete-frame)

;; (defun my-make-frame ()
;;   "Make a new frame and maximize it."
;;   (interactive)
;;   (w32-send-sys-command 61488 (make-frame)))
;; (global-set-key "\M-n" 'my-make-frame)

;; Make Splitted Window Showing the previous buffer
(defun my/vsplit-last-buffer (prefix)
  "Split the window vertically and display the previous buffer."
  (interactive "p")
  (split-window-vertically)
  (other-window 1 nil)
  (if (= prefix 1)
    (switch-to-next-buffer)))
(defun my/hsplit-last-buffer (prefix)
  "Split the window horizontally and display the previous buffer."
  (interactive "p")
  (split-window-horizontally)
  (other-window 1 nil)
  (if (= prefix 1) (switch-to-next-buffer)))
(bind-key "C-x 2" 'my/vsplit-last-buffer)
(bind-key "C-x 3" 'my/hsplit-last-buffer)


;; BBDB
(setq load-path (cons (expand-file-name "~/.emacs.d/elpa/bbdb-20140830.2031") load-path))
(require 'bbdb)
(bbdb-initialize)
;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus) 
;; (add-hook 'gnus-startup-hook 'bbdb-insinuate-message) 
;; (add-hook 'message-setup-hook 'bbdb-define-all-aliases) 
;; (sams-bind-alias-tabs-in-gnus) 


;; MAGIT
(add-to-list 'load-path "~/.emacs.d/site-lisp/magit")
(require 'magit)
(setq magit-auto-revert-mode nil)
(setq magit-last-seen-setup-instructions "1.4.0")
