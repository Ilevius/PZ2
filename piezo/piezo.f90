    program piezo
    use GLOBALS
    implicit none

    call InitGlobals
    
    call DzetaPlot

    CONTAINS
    
    
        FUNCTION MakeAs(alfa, w)
        implicit none
        real*8 w
        complex*16 MakeAs(6), alfa
               
            MakeAs(1) = -c44*eps22-e24**2 
            MakeAs(2) = alfa**2*e15*e24-eps22*(w**2*rho-alfa**2*c55)
            MakeAs(3) = alfa**2*(eps22*e15-eps11*e24)
            MakeAs(4) = alfa**2*e24*c55 - alfa**2*e15*c44 - w**2*rho*e24
            MakeAs(5) = 0d0
            MakeAs(6) = alfa**2*(eps11*c44 + e15*e24)
        

        
        
        END FUNCTION MakeAs
    
    
    
        FUNCTION MakeGammas(alfa, w)
        implicit none
        real*8 w
        complex*16 MakeGammas(2), alfa, t1, t2, D_root, a(6), test 
        
    
            a = MakeAs(alfa, w)

            D_root = sqrt( (a(1)*a(2) + a(1)*a(6))**2 - 4d0*a(1)**2*(a(2)*a(6) - a(3)*a(4)) )
        
            t1 = ( -(a(1)*a(2) + a(1)*a(6)) - D_root )/(2d0*a(1)**2)
            t2 = ( -(a(1)*a(2) + a(1)*a(6)) + D_root )/(2d0*a(1)**2)
        
            MakeGammas(1) = sqrt(t1)
            MakeGammas(2) = sqrt(t2)
        END
    
    
            
        FUNCTION MakeG(alfa, w)
        implicit none
        real*8 w
        complex*16 alfa, MakeG(2), gammas(2), a(6)
        

        
            a = MakeAs(alfa, w)
            gammas = MakeGammas(alfa, w) 
            MakeG(1) = (-a(1)*gammas(1)**2 - a(2))/a(3)
            MakeG(2) = (-a(1)*gammas(2)**2 - a(2))/a(3)
        END FUNCTION MakeG
        
        
        
        FUNCTION th(x)
        implicit none
        complex*16 th, x
            th = (1-exp(-2d0*x))/(1+exp(-2d0*x))
        END FUNCTION th
        
        
        
        FUNCTION delta1(alfa)
        implicit none
        real*8 alfa, delta1, d
        complex*16 gammas(2), G(2), delta1_c, alfa_c
            d = h/2d0
            alfa_c = alfa           
            gammas = MakeGammas(alfa_c, wCurrent)
            G = MakeG(alfa_c, wCurrent)
            
            delta1_c = gammas(1)*(e24*G(1) + c44)*(gammas(2)*(e24-eps22*G(2)) + th(gammas(2)*d)*G(2)*eps0*alfa)  & 
                - gammas(2)*(e24*G(2) + c44)*(gammas(1)*(e24 - eps22*G(1)) + th(gammas(1)*d)*G(1)*eps0*alfa)
            
            delta1 = abs(delta1_c)
        END FUNCTION delta1    
        
         
             
        
        SUBROUTINE DzetaPlot
        implicit none
        real*8 fCurrent
        integer Ndz, i
        real*8 dz(10)
        complex*16 gammas(2)
            open(1, file='dzeta.txt', FORM='FORMATTED')
            do fCurrent = fmin, fmax, fstep
                wCurrent = fCurrent*2d0*pi
                !    Hamin(F,smin,smax,hs,eps,Nmax,dz,Ndz)
                call Hamin(delta1, 0.1d0, 200d0, 5d-4, 1d-3, 10, dz, Ndz)
                do i = 1, Ndz
                    write(1, '(2E15.6E3)') fCurrent, dz(i)    
                enddo
                
                if (Ndz == 0) then 
                    write(1, '(2E15.6E3)') fCurrent, 0d0
                endif    
            enddo
        END SUBROUTINE DzetaPlot
        
    
    
    
    
    end program piezo

