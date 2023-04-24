MODULE GLOBALS 
    IMPLICIT NONE 
    real*8 pi, wCurrent
    real*8 h, fmin, fmax, fstep, eps22, eps11, eps0, e24, e15, c44, c55, rho
    real*8 eps_tensor(3,3), rotationMatrix(3,3), newEps_tensor(3,3), eps33, e_tensor(3,3,3), newE_tensor(3,3,3), c_tensor(3,3,3,3), newC_tensor(3,3,3,3), C6(6,6), C63(3,6)
    parameter (pi=3.141592653589793d0)
    CONTAINS 
        subroutine InitGlobals
            !c55 = 0.25d2
            !c44 = 0.743d2
            !e15 = 5.16d0
            !e24 = 11.7d0
            !eps11 = 34d0
            !eps22 = 780d0
            !c44 = 0.25d2
            !c55 = 0.743d2
            !e24 = 5.16d0
            !e15 = 11.7d0
            !eps22 = 34d0
            !eps11 = 780d0
            
            eps33 = 24d0
            eps0 = 8.85d-3
            h = 5d0
            rho = 4.630d0
            
            fmin = 0.01d0
            fmax = 4.01d0
            fstep = 0.02d0
            
            ! тестирование изменений тензора электр проницакмости при смене системы координат
            eps_tensor = 0d0
            NewEps_tensor = 0d0
            eps_tensor(1,1) = 34d0
            eps_tensor(2,2) = 780d0
            eps_tensor(3,3) = 24d0
            
            rotationMatrix = 0d0
            rotationMatrix(1,2) = -1d0
            rotationMatrix(2,1) = 1d0
            rotationMatrix(3,3) = 1d0
            
            !rotationMatrix = 0d0
            !rotationMatrix(1,2) = 1d0
            !rotationMatrix(2,1) = 1d0
            !rotationMatrix(3,3) = 1d0
            
            call tensor2rotation(rotationMatrix, eps_tensor, NewEps_tensor)
            print*, 'Old eps tensor'
            print*,  eps_tensor
            
            print*, 'New eps tensor'
            print*,  NewEps_tensor
            
            ! тестирование изменения тензора пьезоконстант
            e_tensor = 0d0
            e_tensor(3,1,1) = 2.46
            e_tensor(3,2,2) =  -1.1
            e_tensor(3,3,3) = 4.4
            e_tensor(1,3,1) = 5.16
            e_tensor(1,1,3) = 5.16
            e_tensor(2,3,2) = 11.7
            e_tensor(2,2,3) = 11.7
            
            call tensor3rotation(rotationMatrix, e_tensor, newE_tensor)
            
            print*, ''
            print*, 'Old e tensor'
            call tensor3toC6(e_tensor, C63)
            call display3tensorVoigt(C63)
            
            print*, 'New e tensor'
            call tensor3toC6(newE_tensor, C63)
            !call display3tensorVoigt(C63)
            call display3tensor(newE_tensor)
            
            ! изменение тензора упругих постоянных 
            c_tensor = 0d0
            c_tensor(1,1,1,1) = 2.26d2
            c_tensor(1,1,2,2) = 0.96d2
            c_tensor(1,1,3,3) = 0.68d2
            c_tensor(2,2,2,2) = 2.7d2
            c_tensor(2,2,3,3) = 1.01d2
            c_tensor(3,3,3,3) = 1.86d2
            
            c_tensor(1,3,1,3) = 0.25d2
            c_tensor(3,1,1,3) = 0.25d2
            c_tensor(1,3,3,1) = 0.25d2
            c_tensor(3,1,3,1) = 0.25d2
            
            c_tensor(2,3,2,3) = 0.743d2
            c_tensor(2,3,3,2) = 0.743d2
            c_tensor(3,2,2,3) = 0.743d2
            c_tensor(3,2,3,2) = 0.743d2
            
            c_tensor(1,2,1,2) = 0.955d2
            c_tensor(1,2,2,1) = 0.955d2
            c_tensor(2,1,1,2) = 0.955d2
            c_tensor(2,1,2,1) = 0.955d2
            
            call tensor4rotation(rotationMatrix, c_tensor, newC_tensor)
            
            print*, ''
            print*, 'Old c tensor'
            call tensor4toC6(c_tensor, C6)
            call display4tensorVoigt(C6)
            

            print*, 'New c tensor'
            call tensor4toC6(newC_tensor, C6)
            !call display4tensorVoigt(C6)
            call display4tensor(newC_tensor)
            c44 = C6(4,4)
            c55 = C6(5,5)
            e24 = C63(2,4)
            e15 = C63(1,5)
            eps22 = NewEps_tensor(2,2)
            eps11 = NewEps_tensor(1,1)
            
            pause
            
            
        end subroutine InitGlobals
        
END MODULE GLOBALS 