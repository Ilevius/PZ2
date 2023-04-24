        !COMPILER-GENERATED INTERFACE MODULE: Wed Apr 12 16:24:30 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TENSOR2ROTATION__genmod
          INTERFACE 
            SUBROUTINE TENSOR2ROTATION(ROTATIONMATRIX,TENSOR2,NEWTENSOR2&
     &)
              REAL(KIND=8) :: ROTATIONMATRIX(3,3)
              REAL(KIND=8) :: TENSOR2(3,3)
              REAL(KIND=8) :: NEWTENSOR2(3,3)
            END SUBROUTINE TENSOR2ROTATION
          END INTERFACE 
        END MODULE TENSOR2ROTATION__genmod
