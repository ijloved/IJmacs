;;------------------------------------------------------------------------------------------
;; ORG - mode

(use-package org
  :ensure t
  :defer t
  :mode ("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode)
  :interpreter ("org" . org-mode)
  :bind
  ("\C-cl" . org-store-link)
  ("\C-cc" . org-capture)
  ("\C-ca" . org-agenda)
  ("\C-cb" . org-iswitchb)
  :config
  (add-hook 'org-mode-hook (lambda ()
                             (setq word-wrap t)
                             (setq truncate-lines nil)
                             (flyspell-mode t)
                             ;;(linum-mode nil)
                             (hs-minor-mode t)))
  ;; NOTES

  (setq org-default-notes-file "~/AGENDA/notes.org")
  ;; LOG SETTING
  (setq org-log-done t)   (setq org-log-done 'time)   (setq org-log-done 'note)
  ;; TODO KEYWORDS
  ;; This idea comes from http://doc.norang.ca/org-mode.html
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
  
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "pink" :weight bold)
                ("NEXT" :foreground "yellow" :weight bold)
                ("DONE" :foreground "green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "green" :weight bold)
                ("MEETING" :foreground "green" :weight bold)
                ("PHONE" :foreground "green" :weight bold))))
  (setq org-todo-state-tags-triggers
      (quote (("CANCELLED" ("CANCELLED" . t))
              ("WAITING" ("WAITING" . t))
              ("HOLD" ("WAITING") ("HOLD" . t))
              (done ("WAITING") ("HOLD"))
              ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
              ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
              ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

  ;; AGENDA
  (setq org-directory "~/AGENDA")
  (setq org-agenda-files (list "~/AGENDA/PERSONAL.org"
                               "~/AGENDA/HANUL.org"
                               "~/AGENDA/WOLSONG.org"
                               "~/AGENDA/KORI.org"
                               "~/AGENDA/HANBIT.org"
                               "~/AGENDA/ETC.org"
                               "~/AGENDA/DEPT.org"
                               "~/AGENDA/IJ_Archive.org"
                               "~/AGENDA/DIARY.org"))

  (setq org-agenda-include-diary nil)
  (setq org-archive-mark-done nil)
  (setq org-archive-location "~/AGENDA/IJ_Archive.org::* From %s")

    ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and
  ;; org-protocol
  
  (defun IJ-ORG-PROPERTIES-STRING ()
    "This string is for org-capture-template"
    (concat ":PROPERTIES:\n"
            ":CATEGORY:\n"
            ":SITE:\n"
            ":STATUS:\n"
            ":NAME:\n"
            ":FROM:\n"     
            ":TO:\n"
            ":EFFORT:\n"
            ":WORKWITH:\n" 
            ":WITH:\n"     
            ":AT:\n"       
            ":TYPE:\n"
            ":KEYWORD:\n"
            ":CONTENT:\n"
            ":END:\n"))
  
  (setq org-capture-templates
        '(("t" "todo " entry (file "~/AGENDA/refile.org")
           "* TODO %a\n %(IJ-ORG-PROPERTIES-STRING) %?\n%U\n" :clock-in t :clock-resume t) 
          ("r" "respond" entry (file "~/git/org/refile.org")
           "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t
           :clock-resume t :immediate-finish t) 
          ("n" "note" entry (file "~/AGENDA/refile.org")
           "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
          ("j" "Journal" entry (file+datetree "~/AGENDA/diary.org")
           "* %?\n%U\n" :clock-in t :clock-resume t :empty_lines 1)
          ("w" "org-protocol" entry (file "~/AGENDA/refile.org")
           "* TODO Review %c\n%U\n" :immediate-finish t)
          ("m" "Meeting" entry (file "~/AGENDA/refile.org")
           "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
          ("p" "Phone call" entry (file "~/AGENDA/refile.org")
           "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
          ("h" "Habit" entry (file "~/AGENDA/refile.org")
           "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"<%Y-%m-%d %a
        .+1d/3d>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))) 

  );; End of use-package org

;; (setq auto-mode-alist (cons '("\\.org$"  . org-mode) auto-mode-alist))
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; (require 'org-install) ???

;; (global-set-key "\C-cl" 'org-store-link)
;; (define-key global-map "\C-cc" 'org-capture)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)

