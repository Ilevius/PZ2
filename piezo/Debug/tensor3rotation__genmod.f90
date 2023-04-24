        !COMPILER-GENERATED INTERFACE MODULE: Wed Apr 12 16:24:30 2023
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE TENSOR3ROTATION__genmod
          INTERFACE 
            SUBROUTINE TENSOR3ROTATION(ROTATIONMATRIX,TENSOR3,NEWTENSOR3&
     &)
              REAL(KIND=8) :: ROTATIONMATRIX(3,3)
              REAL(KIND=8) :: TENSOR3(3,3,3)
              REAL(KIND=8) :: NEWTENSOR3(3,3,3)
            END SUBROUTINE TENSOR3ROTATION
          END INTERFACE 
        END MODULE TENSOR3ROTATION__genmod
