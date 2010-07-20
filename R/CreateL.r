CreateL<-function(matrix)
{   k<-dim(matrix)[1]
    q1<-matrix(c(rep(1,k)),k,1)
    K<-matrix(0,k,k)
    Q<-cbind(q1,matrix)
    O<-matrix(c(rep(0,16)),4,4)

    for (i in 1:k)
    {
      for (j in 1:k)
          {K[i,j]<-sqrt(sum((matrix[i,]-matrix[j,])^2))   }
    }
    
    L<-rbind(cbind(K,Q),cbind(t(Q),O))
	L1<-solve(L)
    
	Lsubk<-L1[1:k,1:k]
    Lsubk3<-rbind(cbind(Lsubk,matrix(0,k,2*k)),cbind(matrix(0,k,k),Lsubk,matrix(0,k,k)),cbind(matrix(0,k,2*k),Lsubk))
    return(list(L=L,Linv=L1,Lsubk=Lsubk,Lsubk3=Lsubk3))
}
