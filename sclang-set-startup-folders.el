;;; sclang-set-startup-folders --- Create links to folders for running at startup/boot

;;; Commentary:

;;; Code:

(defun sclang-user-app-support-dir ()
  "Return path of SC user app support directory for current user."
  (concat (file-truename "~/") "Library/Application Support/SuperCollider/"))

(defun sclang-set-server-actions-folder ()
  "Set path to folder contining scripts to run when sc-server boots."
  (interactive)
  (let ((folder (read-directory-name "choose folder:")))
    (message folder)
    (find-file (concat (sclang-user-app-support-dir) "serverStartup.scd"))
    (erase-buffer)
    (insert
     (concat "\"" folder "\*\.scd\".pathMatch do:  _.loadFixed(\""
             (file-name-directory (directory-file-name folder))
             "\");"))
    (save-buffer)))

(defun sclang-set-lang-actions-folder ()
  "Set path to folder contining scripts to run when sc-server boots."
  (interactive)
  (let ((folder (read-directory-name "choose folder:")))
    (message folder)
    (find-file (concat (sclang-user-app-support-dir) "langStartup.scd"))
    (erase-buffer)
    (insert
     (concat "\"" folder "\*\.scd\".pathMatch do:  _.loadFixed(\""
             (file-name-directory (directory-file-name folder))
             "\");"))
    (save-buffer)))

(defun sclang-delete-lang-actions-folder ()
  "Remove link to folder contining scripts to run when lang compiles."
  (interactive)
  (let ((folder (concat (sclang-user-app-support-dir) "langStartup")))
    (if (file-exists-p folder) (delete-directory folder))))

(defun sclang-delete-server-actions-folder ()
  "Remove link to folder contining scripts to run when sc-server boots."
  (interactive)
  (let ((folder (concat (sclang-user-app-support-dir) "serverStartup")))
    (if (file-exists-p folder) (delete-directory folder))))

(provide 'sclang-set-startup-folders)
;;; sclang-set-startup-folders ends here
