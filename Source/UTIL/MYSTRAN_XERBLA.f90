      SUBROUTINE MYSTRAN_XERBLA(SRNAME, INFO)
          USE IOUNT1, ONLY: F06
          IMPLICIT NONE
          CHARACTER(LEN=*), INTENT(IN) :: SRNAME
          INTEGER,          INTENT(IN) :: INFO

          ! Write to F06 first
          WRITE(F06, '(A,A,A,I0,A)') &
              ' *** BLAS ERROR in ', TRIM(SRNAME), &
              ' parameter ', INFO, ' had an illegal value'

          ! Then call the real xerbla_ from BLAS
          CALL XERBLA(SRNAME, INFO)

          ! Then abort
          STOP 'illegal BLAS argument'
      END SUBROUTINE MYSTRAN_XERBLA
