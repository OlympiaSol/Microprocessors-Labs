#//////////////homework1/////////////////
#///AM=4001  AM=4812
clear all; #diagrafei oles tis metavlhtes sto octave
a=1; #mhkos pleyras toy tetragwnou
r=a/2; #aktina eggegrammenou kyklou
dist=0#;arxikopihsh metablhths gia apothhkeysh apostasewn
counter=0; #arxikopoihsh metrhth gia parakoloythhsh shmeiwn entos toy kykloy
figure('color','white'); #neo parathyro sxhmatos me leyko fonto
hold all #epitrepei pollaples grafes sto idio sxhma
axis square; #orizei thn analogia diastasewn ths grafikhs parastashs na nai ish
axis ([0 1 0 1]) #orizei ta oria ths grafikhs parastashs apo 0 ews 1 kai stous dyo ajones x kai y

#ektelesh pente vroxwn gia ektimhsh tou pi gia diaforetikes times tou N
for o=1:5
  fprintf("----------- LOOP %i ---------------\n",o);
  #fprintf("----------- Gia N=10 ---------------\n");
  n1=10;
  x1=rand(n1,a);   %random times apo to 0.0 ews to 1.0 kai exw sinolika n dianismata apo (x,y)
  y1=rand(n1,a);
  dist=(x1-r).^2 + (y1-r).^2;
  for i=1:n1
    if (dist(i)<=r^2)
        counter=counter+1;
        #plot(x1(i),y1(i),'b.');
    endif#else
        #plot(x1(i),y1(i),'r.');
    #end
  endfor
  pi_n1=(counter*4)/n1;
  fprintf("For N:%i , pi_n1=%f\n",n1,pi_n1);
  counter=0;

  #fprintf("----------- Gia N=100  ---------------\n");
  #fprintf("----------- LOOP %o ---------------\n",o);
  n2=100;
  x2=rand(n2,a);   %random times apo to 0.0 ews to 1.0 kai exw sinolika n dianismata apo (x,y)
  y2=rand(n2,a);
  dist=(x2-r).^2 + (y2-r).^2;
  for i=1:n2
    if (dist(i)<=r^2)
        counter=counter+1;
        #plot(x2(i),y2(i),'b.');#ta mple shmeia einai ayta pou vriskontai mesa ston kyklo
    endif#else
        #plot(x2(i),y2(i),'r.');#ta kokkina shmeia einai ayta pou vriskontai ejw apo ton kyklo
    #end
  endfor
  pi_n2=(counter*4)/n2;
  fprintf("For N:%i , pi_n2=%f\n",n2,pi_n2);
  counter=0;

  #fprintf("----------- Gia N=1000 ---------------\n");
  #fprintf("----------- LOOP %o ---------------\n",o);
  n3=1000;
  x3=rand(n3,a);   %random times apo to 0.0 ews to 1.0 kai exw sinolika n dianismata apo (x,y)
  y3=rand(n3,a);
  dist=(x3-r).^2 + (y3-r).^2;
  for i=1:n3
    if (dist(i)<=r^2)
        counter=counter+1;
        plot(x3(i),y3(i),'b.');
    else
        plot(x3(i),y3(i),'r.');
    end
  endfor
  pi_n3=(counter*4)/n3;
  fprintf("For N:%i , pi_n3=%f\n",n3,pi_n3);
  counter=0;

  #fprintf("----------- Gia N=4001  ---------------\n");
  #fprintf("----------- LOOP %o ---------------\n",o);
  n4=4001;
  x4=rand(n4,a);   %random times apo to 0.0 ews to 1.0 kai exw sinolika n dianismata apo (x,y)
  y4=rand(n4,a);
  dist=(x4-r).^2 + (y4-r).^2;
  for i=1:n4
    if (dist(i)<=r^2)
        counter=counter+1;
        #plot(x4(i),y4(i),'b.');
    endif#else
        #plot(x4(i),y4(i),'r.');
    #end
  endfor
  pi_n4=(counter*4)/n4;
  fprintf("For N:%i , pi_n4=%f\n",n4,pi_n4);
  counter=0;
  #fprintf("----------- Gia N=4001  ---------------\n");
  #fprintf("----------- LOOP %o ---------------\n",o);
  #n4=4001;
  #x4=rand(n4,a);   %random times apo to 0.0 ews to 1.0 kai exw sinolika n dianismata apo (x,y)
  #y4=rand(n4,a);
  #dist=(x4-r).^2 + (y4-r).^2;
  #for i=1:n4
   # if (dist(i)<=r^2)
        #counter=counter+1;
        #plot(x4(i),y4(i),'b.');
    #endif#else
        #plot(x4(i),y4(i),'r.');
    #end
  #endfor
  #pi_n4=(counter*4)/n4;
  #fprintf("For N:%i , pi_n4=%f\n",n4,pi_n4);
  #counter=0;
  #fprintf("----------- Gia N=10000  ---------------\n");
  #fprintf("----------- LOOP %o ---------------\n",o);
  n5=10000;
  x5=rand(n5,a);   %random times apo to 0.0 ews to 1.0 kai exw sinolika n dianismata apo (x,y)
  y5=rand(n5,a);
  dist=(x5-r).^2 + (y5-r).^2;
  for i=1:n5
    if (dist(i)<=r^2)
        counter=counter+1;
        #plot(x5(i),y5(i),'b.');
    endif#else
        #plot(x5(i),y5(i),'r.');
    #end
  endfor
  pi_n5=(counter*4)/n5;
  fprintf("For N:%i , pi_n1=%f\n",n5,pi_n5);
  counter=0;
endfor
