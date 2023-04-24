        !COMPILER-GENERATED INTERFACE MODULE: Wed Apr 12 16:24:30 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TENSOR4ROTATION__genmod
          INTERFACE 
            SUBROUTINE TENSOR4ROTATION(ROTATIONMATRIX,TENSOR4,NEWTENSOR4&
     &)
              REAL(KIND=8) :: ROTATIONMATRIX(3,3)
              REAL(KIND=8) :: TENSOR4(3,3,3,3)
              REAL(KIND=8) :: NEWTENSOR4(3,3,3,3)
            END SUBROUTINE TENSOR4ROTATION
          END INTERFACE 
        END MODULE TENSOR4ROTATION__genmod
