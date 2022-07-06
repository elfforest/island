(provide 'core-bib)

(setq bib-files-directory (directory-files
                             (concat (getenv "HOME") "/Documents/bibliography") t
                             "^[A-Z|a-z].+.bib$")
      pdf-files-directory (concat (getenv "HOME") "/Documents/bibliography/pdf"))

