
(define-library (chibi show)
  (export
   show fn fn-fork with update! each each-in-list call-with-output
   displayed written written-shared written-simply numeric nothing
   nl fl space-to tab-to
   padded padded/left padded/right padded/both
   trimmed trimmed/left trimmed/right trimmed/both trimmed/lazy
   fitted fitted/left fitted/right fitted/both
   joined joined/prefix joined/suffix joined/last joined/dot joined/range
   upcased downcased)
  (import (scheme base) (scheme char) (scheme write)
          (chibi show base))
  (include "show/show.scm"))
