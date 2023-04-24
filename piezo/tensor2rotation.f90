!                                                                   Переход к новой системе координат
SUBROUTINE tensor2rotation(rotationMatrix, tensor2, newTensor2)
    IMPLICIT NONE
    integer i, j, k, l
    real*8 rotationMatrix(3,3), tensor2(3,3), newTensor2(3,3)
        do i = 1, 3
            do j = 1, 3
                newTensor2(i,j) = 0d0
                do l = 1, 3
                    do k = 1, 3
                        newTensor2(i,j) = newTensor2(i,j) +  rotationMatrix(i,k)*rotationMatrix(j,l)*tensor2(k,l)   
                    enddo    
                enddo    
            enddo    
        enddo    
END  SUBROUTINE tensor2rotation   
    
    
    
SUBROUTINE tensor3rotation(rotationMatrix, tensor3, newTensor3)
    IMPLICIT NONE
    integer i, j, k, l, m, n
    real*8 rotationMatrix(3,3), tensor3(3,3,3), newTensor3(3,3,3)
        do i = 1, 3
            do j = 1, 3
                do k = 1, 3
                    newTensor3(i,j,k) = 0d0
                    do l = 1, 3
                        do m = 1, 3
                            do n = 1, 3
                                newTensor3(i,j, k) = newTensor3(i,j,k) +  rotationMatrix(i,l)*rotationMatrix(j,m)*rotationMatrix(k,n)*tensor3(l,m,n)   
                            enddo    
                        enddo    
                    enddo
                enddo
            enddo    
        enddo    
END  SUBROUTINE tensor3rotation     
    
    
    
SUBROUTINE tensor4rotation(rotationMatrix, tensor4, newTensor4)
    IMPLICIT NONE
    integer i, j, k, l, m, n, p, q
    real*8 rotationMatrix(3,3), tensor4(3,3,3,3), newTensor4(3,3,3,3)
        do i = 1, 3
            do j = 1, 3
                do k = 1, 3
                    do p = 1, 3
                        newTensor4(i,j,k,p) = 0d0
                        do l = 1, 3
                            do m = 1, 3
                                do n = 1, 3
                                    do q = 1, 3
                                        newTensor4(i,j,k,p) = newTensor4(i,j,k,p) +  rotationMatrix(i,l)*rotationMatrix(j,m)*rotationMatrix(k,n)*rotationMatrix(p,q)*tensor4(l,m,n,q)
                                    enddo
                                enddo    
                            enddo    
                        enddo
                    enddo
                enddo
            enddo    
        enddo    
END  SUBROUTINE tensor4rotation  
                
!                                                          Печать тензоров на экран    
SUBROUTINE display3tensor(tensor3)
IMPLICIT NONE
    integer i, j, k
    real*8 tensor3(3,3,3)    
    do i = 1, 3
        do j = 1, 3
            do k = 1, 3
                if (tensor3(i,j,k) .NE. 0d0) then
                    print*, i, j, k, ' = ', tensor3(i,j,k)
                endif    
            enddo    
        enddo    
    enddo   
END SUBROUTINE display3tensor    
    
    
SUBROUTINE display4tensor(tensor4)
IMPLICIT NONE
    integer i, j, k, p
    real*8 tensor4(3,3,3,3)    
    do i = 1, 3
        do j = 1, 3
            do k = 1, 3
                do p = 1, 3
                    if (tensor4(i,j,k,p) .NE. 0d0) then
                        print*, i, j, k, p, ' = ', tensor4(i,j,k,p)
                    endif
                enddo
            enddo    
        enddo    
    enddo   
END SUBROUTINE display4tensor    

SUBROUTINE display4tensorVoigt(tensor4)
IMPLICIT NONE
    integer i, j
    real*8 tensor4(6,6)    
    do i = 1, 6
        do j = 1, 6
            if (tensor4(i,j) .NE. 0d0) then
                print*, i, j, ' = ', tensor4(i,j)
            endif
        enddo    
    enddo   
END SUBROUTINE display4tensorVoigt    
    
    
SUBROUTINE display3tensorVoigt(tensor3)
IMPLICIT NONE
    integer i, j
    real*8 tensor3(3,6)    
    do i = 1, 3
        do j = 1, 6
            if (tensor3(i,j) .NE. 0d0) then
                print*, i, j, ' = ', tensor3(i,j)
            endif
        enddo    
    enddo   
END SUBROUTINE display3tensorVoigt 

!                                                       Преобразователи в нотацию Фохта    
SUBROUTINE tensor4toC6(tensor4, VoigtMatrix)
IMPLICIT NONE
    integer i, j, k, l, m, n
    real*8 tensor4(3,3,3,3), VoigtMatrix(6,6)
    VoigtMatrix = 0d0
	do i=1,3 
        do j=1,3 
            do k=1,3 
                do l=1,3  
                    if(i == j) then
	                    m = i   
                    else   
                        m = 9-(i+j)
	                end if

                    if(k == l) then
	                    n = k   
                    else   
                    n = 9-(k+l)
	                end if
                    VoigtMatrix(m,n) = tensor4(i,j,k,l)  
                end do 
            end do 
        end do 
    end do
END SUBROUTINE tensor4toC6
    
    
    
SUBROUTINE tensor3toC6(tensor3, VoigtMatrix)
IMPLICIT NONE
    integer i, j, k, l
    real*8 tensor3(3,3,3), VoigtMatrix(3,6)
    VoigtMatrix = 0d0
	do i=1,3 
        do j=1,3 
            do k=1,3 
                if(j == k) then
	                l = j   
                else   
                l = 9-(j+k)
	            end if
                VoigtMatrix(i,l) = tensor3(i,j,k)  
            end do 
        end do 
    end do
END SUBROUTINE tensor3toC6