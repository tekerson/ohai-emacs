;;; -*- lexical-binding: t -*-
(require 'ohai-package)

(use-package projectile
  :config
  (projectile-register-project-type 'npm '("package.json")
                                    :compile "npm build"
                                    :test "npm test"
                                    :run "npm start"
                                    :test-suffix ".spec")

  (projectile-register-project-type 'docker-compose '("docker-compose.yml")
                                    :compile "docker-compose build"
                                    :run "docker-compose up"))

(provide 'orly-projectile)
