(defun xtof/create-recurring-timestamp ()
  "foo"
  (interactive)
  (let ((fs "%Y-%m-%d %a %H:%M")
        (date (org-read-date nil t nil "input base date"))
        (recurrence-type (completing-read "input recurrence type:" (list "+" "++" ".+") nil t nil nil ".+"))
        (recurrence-rate-min (read-from-minibuffer "input recurrence rate min:" nil nil nil nil nil nil))
        (recurrence-rate-max (read-from-minibuffer "input recurrence rate nax:" "1" nil nil nil "1" nil))
        (recurrence-interval (completing-read "input recurrence interval:" (list "y" "w" "m" "d" "h") nil t nil nil "d")))
    (format "<%s %s%s>"
            (format-time-string fs date)
            recurrence-type
            (cond ((string= "" recurrence-rate-min) (concat recurrence-rate-max recurrence-interval))
                  (t (concat recurrence-rate-min recurrence-interval "/" recurrence-rate-max recurrence-interval))))))

(defvar xtof/org-capture-project-template
  "* PROJ %^{Project} :PROJ:
   %?")

(defvar xtof/org-capture-task-template
  "* TODO %^{Task} %^G
   :PROPERTIES:
   :CREATED: %U
   :Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|3:00|4:00}
   :END:
   %?")

(defvar xtof/org-capture-habit-template
  "* TODO %^{Habit}  
   SCHEDULED: %(xtof/create-recurring-timestamp)
   :PROPERTIES:
   :STYLE: habit
   :Effort: %^{effort|1:00|0:05|0:15|0:30|2:00|3:00|4:00}
   :END:
   OPENED: %U
   %?
   %i")

(defvar xtof/org-capture-memo-template
  "* %^{Subject} 
   :PROPERTIES:
   :TO: %^{to|Self}
   :DATE: %U
   :END:
   %?")

(defvar xtof/org-capture-note-template
  "* %^{Description} 
   :PROPERTIES: 
   :DATE: %U
   :END:
   %?")

(defvar xtof/org-capture-activity-log-template
  "* %^{Title} 
   :PROPERTIES:
   :DATE: %U
   :END:
   %?")

(defvar xtof/org-capture-dream-log-template
  "* %^{Title} 
   %?")

(defvar xtof/org-capture-meditation-log-template
  "* %^{Title}
   :PROPERTIES:
   :STARTTIME: %^{start time}U
   :DURATION: %^{duration|0:30}
   :END:
   %?")

;; (defvar
;;   xtof/org-capture-tga-log-template
;;   "* %^{Title} 
;;   :PROPERTIES:
;;   :STARTTIME: %^{start time}U
;;   :ENDTIME: %^{end time}U
;;   :END:
;;   %?")

(setq org-capture-templates
      `(("p" 
         "project" 
         entry (file "~/Dropbox/org/projects.org") 
         ,xtof/org-capture-project-template)
        ("t"
         "task"
         entry (file+headline "~/Dropbox/org/inbox.org" "tasks")
         ,xtof/org-capture-task-template)
        ("h"
         "habit"
         entry (file+headline "~/Dropbox/org/inbox.org" "tasks")
         ,xtof/org-capture-habit-template)
        ("m"
         "memo" 
         entry (file+datetree "~/Dropbox/org/memos.org") 
         ,xtof/org-capture-memo-template)
        ("n"
         "note"
         entry (file+headline "~/Dropbox/org/notes.org" "notes")
         ,xtof/org-capture-note-template)
        ;;
        ("l" "logs")
        ("la" 
         "activity log entry" 
         entry (file+datetree "~/Dropbox/org/activity_log.org") 
         ,xtof/org-capture-activity-log-template)
        ("ld" 
         "dream log entry" 
         entry (file+datetree "~/Dropbox/org/dream_log.org") 
         ,xtof/org-capture-dream-log-template)
        ("lm" 
         "meditation log entry" 
         entry (file+datetree "~/Dropbox/org/meditation_log.org") 
         ,xtof/org-capture-meditation-log-template)
        ;; ("lt" 
        ;;  "tga log entry" 
        ;;  entry (file+datetree "~/Dropbox/org/tga_log.org") 
        ;;  ,xtof/org-capture-tga-log-template)
        )
      )
