function [x, y, scale] = sync_block(freq1, freq2)

  N = 10000;
  br = 100;
  block = N/br;
  scale = linspace(0,1, N);
  %x = zeros(size(scale));
  %y = zeros(size(scale));

  phase_x_adv = (2*pi*freq1/N);
  phase_x = 0;
  x_was = 0;
  x_is = 0;
  sync_x_go = 0;

  phase_y_adv = (2*pi*freq2/N);
  phase_y = 0;
  y_was = 0;
  y_is = 0;
  sync_y_go = 0;

  for(m = 0:block-1)
    for(n=1:br)
      x((m*br) + n) = sin(phase_x);
      x_is = x((m*br) + n);
      if(x_is >=0 && x_was<0)
	phase_y = 0;
      end%if
      phase_x+=phase_x_adv;
      x_was = x_is;
    end%for

    for(n=1:br)
      y_was;
      y((m*br) + n) = sin(phase_y);
      y_is = y((m*br) + n); 
      if(y_is >=0 && y_was<0)
	phase_x = 0
      end%if    
      phase_y+=phase_y_adv;
      y_was = y_is;
    end%for

  end%for

plot(y)
hold
plot(x, '1');
grid on;
xlabel ("samples, SR = 1000");
ylabel ("amplitude");




end%function
