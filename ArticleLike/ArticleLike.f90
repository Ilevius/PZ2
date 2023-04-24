    program ArticleLike
    use GLOBALS
    implicit none
    call InitGlobals
    call DzetaPlot
    
      
    
    CONTAINS 
    
        FUNCTION MakeGamma(alfa)
        ! Here we obtain matrix A eigenvalues
        implicit none
        real*8 alfa, a, b, c
        complex*16 MakeGamma(2), d_root
            a = c44*eps22 + e24**2
            b = rho*wCurrent**2*eps22 - 2d0*e24*e15*alfa**2 - c44*eps11*alfa**2 - c55*eps22*alfa**2
            c = (c55*eps11 + e15**2)*alfa**4 - rho*wCurrent**2*eps11*alfa**2
            
            
            b= b/a
            c = c/a
            a = a/a
            
            d_root = sqrt(b**2 - 4*a*c)
            MakeGamma(1) = sqrt( (-b + d_root)/(2d0*a) )
            MakeGamma(2) = sqrt( (-b - d_root)/(2d0*a) )
        END FUNCTION MakeGamma
        
          
        
        FUNCTION MakeG(alfa)
        implicit none
        real*8 alfa
        complex*16 MakeG(2), gammas(2)
            gammas = MakeGamma(alfa) 
            MakeG(1) = (e24*gammas(1)**2 - e15*alfa**2)/( eps22*gammas(1)**2 - eps11*alfa**2 )
            MakeG(2) = (e24*gammas(2)**2 - e15*alfa**2)/( eps22*gammas(2)**2 - eps11*alfa**2 )
        END FUNCTION MakeG
        
        
        FUNCTION th(x)
        implicit none
        complex*16 th, x
            th = (1-exp(-2d0*x))/(1+exp(-2d0*x))
        END FUNCTION th
        
        
        
        FUNCTION delta1(alfa)
        implicit none
        real*8 alfa, delta1, d
        complex*16 gammas(2), G(2), delta1_c, test
            d = h/2d0
            gammas = MakeGamma(alfa)
            G = MakeG(alfa)
            
            test = th(gammas(2)*d)
            delta1_c = gammas(1)*(e24*G(1) + c44)*(gammas(2)*(e24-eps22*G(2)) + th(gammas(2)*d)*G(2)*eps0*alfa)  & 
                - gammas(2)*(e24*G(2) + c44)*(gammas(1)*(e24 - eps22*G(1)) + th(gammas(1)*d)*G(1)*eps0*alfa)
            
            delta1 = abs(delta1_c)
        END FUNCTION delta1    
        
        !FUNCTION delta2(alfa)
        !implicit none
        !real*8 alfa, delta2, d
        !complex*16 gammas(2), G(2), delta2_c, test
        !    d = h/2d0
        !    gammas = MakeGamma(alfa)
        !    G = MakeG(alfa)
        !    
        !    test = th(gammas(2)*d)
        !    delta2_c = gammas(1)*(e24*G(1) + c44)*(gammas(2)*(e24-eps22*G(2)) + tanh(gammas(2)*d)**(-1)*G(2)*eps0*alfa)  & 
        !        - gammas(2)*(e24*G(2) + c44)*(gammas(1)*(e24 - eps22*G(1)) + tanh(gammas(1)*d)**(-1)*G(1)*eps0*alfa)
        !    
        !    delta2 = abs(delta2_c)
        !END FUNCTION delta2   
        !     
        
        SUBROUTINE DzetaPlot
        implicit none
        real*8 fCurrent
        integer Ndz, i
        real*8 dz(10)
        complex*16 gammas(2)
            open(1, file='newDzeta.txt', FORM='FORMATTED')
            do fCurrent = fmin, fmax, fstep
                wCurrent = fCurrent*2d0*pi
                !call Halfc(delta1Halfc, 0.1d0, 50d0, 1d-4, 1d-3, 10, dz, Ndz)
                call Hamin(delta1, 1d-6, 300d0, 1d-3, 1d-3, 10, dz, Ndz)
                do i = 1, Ndz
                    write(1, '(3E15.6E3)') fCurrent*h, dz(i), wCurrent/dz(i)
                enddo

                
                if (Ndz == 0) then 
                    write(1, '(2E15.6E3)') fCurrent, 0d0
                endif    
            enddo
        END SUBROUTINE DzetaPlot

        
        
        
        
        
        
        
        
        
        !                    Alternatives
        
        
        FUNCTION delta1Halfc(alfa)
        implicit none
        real*8 alfa, d
        complex*16 gammas(2), G(2), delta1Halfc
            d = h/2d0
            gammas = MakeGamma(alfa)
            G = MakeG(alfa)
             
            delta1Halfc = gammas(1)*(e24*G(1) + c44)*(gammas(2)*(e24-eps22*G(2)) + th(gammas(2)*d)*G(2)*eps0*alfa)  & 
                - gammas(2)*(e24*G(2) + c44)*(gammas(1)*(e24 - eps22*G(1)) + th(gammas(1)*d)*G(1)*eps0*alfa)
            
        END FUNCTION delta1Halfc   
        
        
    end program ArticleLike

