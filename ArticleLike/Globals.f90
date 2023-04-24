MODULE GLOBALS 
    IMPLICIT NONE 
    real*8 pi, wCurrent
    real*8 h, fmin, fmax, fstep, eps22, eps11, eps0, e24, e15, c44, c55, rho
    parameter (pi=3.141592653589793d0)
    CONTAINS 
        subroutine InitGlobals
            c55 = 0.25d2
            c44 = 0.743d2
            e15 = 5.16d0
            e24 = 11.7d0
            eps11 = 34d0
            eps22 = 780d0
            
            eps0 = 8.85d-3
            h = 5d0
            rho = 4.630d0
            
            fmin = 0.01d0
            fmax = 2.01d0
            fstep = 0.005d0
        end subroutine InitGlobals
        
END MODULE GLOBALS 