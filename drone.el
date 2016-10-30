;;; drone.el --- Launch your drone test suite, searches for drone.yml and runs if found                     -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Oliver Marks

;; Author: Oliver Marks <oly@digitaloctave.com>
;; URL: https://github.com/olymk2/emacs-drone
;; Keywords: Drone Tests Ci
;; Version: 0.1
;; Created 29 October 2016

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

;; This provides a single non interactive command which will launch this shell command "drone exec"
;; This will look for a .drone.yml file and run the command from this path
;; The output of running the tests will be displayed to the user 
;; Drone is an application that runs your tests using docker, it can run both locally and on drone.io server

;;; Code:

(defun drone-root ()
  (condition-case nil
    (let ((root-path (locate-dominating-file default-directory ".drone.yml")))
      (if root-path
        root-path
        (error "Missing .drone.yml not found in directory tree")))))

;;;###autoload
(defun drone-exec ()
  (interactive)
  (let ((default-directory (drone-root)))
    (compilation-start (format "drone exec"))))

;;; drone.el ends here
(provide 'drone) 
