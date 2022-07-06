(defpackage island/tests/main
  (:use :cl
        :island
        :rove))
(in-package :island/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :island)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
