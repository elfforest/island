(asdf:defsystem "island"
  :version "0.1.0"
  :author "Vladimir R"
  :license "MIT"
  :depends-on ("swank"
               "uiop")
  :components ((:module "src"
                :components
                ((:file "main"))))
  :description ""
  :in-order-to ((asdf:test-op (asdf:test-op "island/tests"))))

(asdf:defsystem "island/tests"
  :author "Vladimir R"
  :license "MIT"
  :depends-on ("island"
               "rove")
  :components ((:module "tests"
                :components
                ((:file "main"))))
  :description "Test system for island"
  :perform (asdf:test-op (op c) (symbol-call :rove :run c)))
