
function blad_MISE=MISE_PID(K)
    
    kp=K(1);  % pierwszy elelemt wywolania to kp
    ki=K(2);  % drugi element wywlania to ki
    kd=K(3); 
    
    T1=0.3;
    T2=0.1;
    
      s=tf('s');
  K1=1/(s*(T1*s+1));
  K2=tf(1,[T2,1]);
  K_obiekt=K1*K2;
  s=tf('s');
  K_regulator=kp+(ki/s)+((kd*s)/(s+1));
  Kotw=K_obiekt * K_regulator;
  Ke=1/(1+Kotw);
  [a,t]=step(Ke,10);

  blad_MISE=0;
  N=length(a);

  for i=1:1:N
    blad_MISE=blad_MISE+a(i)^2;
  end
  
end
