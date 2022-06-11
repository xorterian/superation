\p 100
base=exp(1);N=15;h=1000;
init()={
print("Base [exp(1)]:");
base=input();
if(base==0,base=exp(1));
print("Size of Carleman matrices [15]:");
N=input();
if(N==0,N=15);
print("Continuity of functional power [1000]:");
h=input();
if(h==0,h=1000);
[D1,X1]=mateigen(M(base^x,N),1);
[D2,X2]=mateigen(M(base^x,N)^-1,1);
a=1;for(n=1,h,a=expoh(a));b=a;for(n=1,h,b=logoh(b));abs_err=abs(b-1);
print(Str("Absolute error: ",abs_err));
}

opow(f,n)=g=if(subst(f,x,0)==f,f,x);for(i=1,n,g=subst(g,x,f));g;
D(f,n)=for(k=1,n,f=deriv(f));f;
M(f,{n=8})=matrix(n,n,j,k,1/(k-1)!*subst(D(f^(j-1),k-1),x,0));
T(A)=sum(k=1,#A,A[2,k]*x^(k-1));

[D1,X1]=mateigen(M(base^x,N),1);
[D2,X2]=mateigen(M(base^x,N)^-1,1);
expoh(z)=subst(T(X1*matdiagonal(D1^(1/h))*X1^-1),x,z);
logoh(z)=subst(T(X2*matdiagonal(D2^(1/h))*X2^-1),x,z);
a=1;for(n=1,h,a=expoh(a));b=a;for(n=1,h,b=logoh(b));abs_err=abs(b-1);
print(Str("Absolute error: ",abs_err));

expoz(x,z)=if(z<0,logoz(x,-z),if(x>1,base^expoz(log(x)/log(base),z),if(x<-1,log(expoz(base^x,z))/log(base), if(z>1,base^expoz(x,z-1),a=x;for(n=1,h*z,a=expoh(a));a))));
logoz(x,z)=if(z<0,expoz(x,-z),if(x>1,base^logoz(log(x)/log(base),z),if(x<-1,log(logoz(base^x,z))/log(base),if(z>1,log(logoz(x,z-1))/log(base),a=x;for(n=1,h*z,a=logoh(a));a))));
