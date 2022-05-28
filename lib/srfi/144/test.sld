(define-library (srfi 144 test)
  (import (scheme base) (chibi test) (srfi 144))
  (export run-tests)
  (begin
    ;; note default (current-test-epsilon) for (chibi test) test is 1e-5
    (define (run-tests)
      (test-begin "srfi-144: flonums")
      (test-assert (flonum? (flonum 5)))
      (test 5. (fl+ 2. 3.))
      (test -1. (fl- 2. 3.))
      (test 6. (fl* 2. 3.))
      (test 0.6666666666 (fl/ 2. 3.))
      (test 10. (fl+* 2. 3. 4.))
      (test 0. (fladjacent -0. 1.))
      (test -0. (flcopysign 0. -1.))
      (test 3. (make-flonum 3. 0))
      (test 6. (make-flonum 3. 1))
      (test 3072. (make-flonum 3. 10))
      (call-with-values (lambda () (flinteger-fraction 12.345))
        (lambda (int frac)
          (test 12. int)
          (test .345 frac)))
      (test 0. (flexponent 1.))
      (test 255. (flexponent 1e77))
      (test 255 (flinteger-exponent 1e77))
      (test 0 (sign-bit 0.))
      (test 0 (sign-bit 1.))
      (test 0 (sign-bit +inf.0))
      (test 1 (sign-bit -0.))
      (test 1 (sign-bit -1.))
      (test 1 (sign-bit -inf.0))
      (test-not (flunordered? 0. 1.))
      (test-not (flunordered? 0. -inf.0))
      (test-assert (flunordered? +nan.0 0.))
      (test-assert (flunordered? 0. +nan.0))
      (test-assert (flinteger? 42.))
      (test-not (flinteger? 42.1))
      (test-assert (flzero? -0.))
      (test-assert (flzero? 0.))
      (test-not (flzero? 0.1))
      (test-not (flzero? +nan.0))
      (test-assert (flpositive? 1.))
      (test-assert (flpositive? +inf.0))
      (test-not (flpositive? -1.))
      (test-assert (flnegative? -1.))
      (test-assert (flnegative? -inf.0))
      (test-not (flnegative? 1.))
      (test-assert (flodd? 1.))
      (test-not (flodd? 2.))
      (test-not (fleven? 3.))
      (test-assert (fleven? 4.))
      (test-assert (flfinite? 5.))
      (test-assert (flinfinite? -inf.0))
      (test-assert (flnan? +nan.0))
      (test-assert (flnormalized? 1.))
      (test-assert (fldenormalized? (fladjacent 0. +inf.0)))
      (test 1. (flabsdiff 2. 3.))
      (test 1. (flabsdiff 3. 2.))
      (test 0. (flposdiff 2. 3.))
      (test 1. (flsgn 0.))
      (test -1. (flsgn -0.))
      (test 1. (flexp 0.))
      (test 2.718281828 (flexp 1.))
      (test 8. (flexp2 3.))
      (test 1.718281828 (flexp-1 1.))
      (test 9. (flsquare 3.))
      (test 1.414213562 (flsqrt 2.))
      (test 1.259921050 (flcbrt 2.))
      (test 5. (flhypot 3. 4.))
      (test 81. (flexpt 3. 4.))
      (test 1.098612289 (fllog 3.))
      (test 0.693147186 (fllog1+ 1.))
      (test 2.807354922 (fllog2 7.))
      (test 10. (fllog2 1024.))
      (test 3.010299957 (fllog10 1024.))
      (test 0.841470985 (flsin 1.))
      (test 0.540302306 (flcos -1.))
      (test 1.557407725 (fltan 1.))
      (test 1.570796327 (flasin 1.))
      (test fl-pi (flacos -1.))
      (test 0.785398163 (flatan 1.))
      (test 0.463647609 (flatan 1. 2.))
      (test 1.175201194 (flsinh 1.))
      (test 1.543080635 (flcosh -1.))
      (test 0.761594156 (fltanh 1.))
      (test 0.881373587 (flasinh 1.))
      (test 0. (flacosh 1.))
      (test +inf.0 (flatanh 1.))
      (test 24. (flgamma 5.))
      (call-with-values (lambda () (flloggamma 0.1))
        (lambda (res sign)
          (test 2.252713 res)
          (test 1 sign)))
      (test 0.440050586 (flfirst-bessel 1 1.))
      (test -0.781212821 (flsecond-bessel 1 1.))
      (test 0.842700793 (flerf 1.))
      (test 0.157299207 (flerfc 1.))
      (test #t (< 0.0
                  fl-least
                  fl-epsilon
                  1.0
                  (+ 1.0 fl-epsilon)
                  fl-greatest
                  +inf.0))
      (test +inf.0 (flmin))
      (test -inf.0 (flmax))
      (test-end))))
