;;; drone.el --- a simple package                     -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oliver Marks

;; Author: Oliver Marks <oly@digitaloctave.com>
;; Keywords: drone ci
;; Version: 0.0.1

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This package will look for drone.yml in your current project and launch your tests

;;; Code:
(require 'projectile)

(defun drone-exec ()
  (interactive)
  (let ((dotdronefile (format "%s.drone.yml" (projectile-project-root))))
    ;;(message dotdronefile)
    (if (file-exists-p dotdronefile)
        (shell-command (format "cd %s;drone exec &" (projectile-project-root)))
      (message "Missing drone file @%s" dotdronefile))))

;;; drone.el ends here
