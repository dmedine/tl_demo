function [x, y, scale] = sync(freq1, freq2)

  N = 10000;

  scale = linspace(0,1, N);
  x = sin(freq1*2*pi*scale);
  phase_adv = (2*pi*freq2/N);
  phase = 0;
  x_was = 0;
  x_is = 0;

  for(n=1:size(x)(2))
     x_is = x(n);
     if(x_is <=0 && x_was>0)
       phase = 0;
     end%if
     y(n) = sin(phase);
     phase+=phase_adv;
     x_was = x_is;

  end%for

plot(y)
hold
plot(x, '1');
grid on;
xlabel ("samples, SR = 1000");
ylabel ("amplitude");




end%function
