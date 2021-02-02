%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%               LABORATOIUM 4                       %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% WYWOLANIE ALGORYTMU ZNAJDUJACEGO NASTAWY     %%%%

clear
close all
w0=[0,0,0]; % wektor poczatkowy
[PID,PID_MISE]=fminsearch(@MISE_PID,w0); % algorytm szukajacy optymalnych nastaw dla PID

kp=PID(1) %wzmocnienie czlonu proporocjalnego
ki=PID(2) %wzmocnienie czlonu calkujacego
kd=PID(3) %wzmonienie czlonu rozniczkujacego 


s=tf('s');

PID=kp+ki/s+((kd*s)/(s+1)); %wylicza wspolczyniki regulatora ciaglego
T1=1;
T2=1/5;
K1=1/(s*(T1*s+1));
K2=tf(1,[T2,1]);
K_obiekt=K1*K2;    %wylicza wspolczynniki obiektu 

PID_dyskretny=c2d(PID,1);  %wylicza wspolczynniki regulatora dyskretnego dla T=1
PID_dyskretny=c2d(PID,14); %wylicza wspolczynniki regulatora dyskretnego dla ró¿nych T

MISE=[0.9361,0.9141,0.9747,1.048,1.134,1.36,1.718,1.953,5.516,1.225,2.762,4.353]; %wartosci MISE dla roznych Ts
Ts=[1,2,3,4,5,7,9,10,15,6,12,14]; %Ts- okres probkowania
plot(Ts,MISE-0.7188,'bo')
xlabel('okres probkowania');
ylabel('b³¹d œredniokwadratowy');


