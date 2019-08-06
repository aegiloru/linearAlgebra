% First we set the domain. Here it is [0,2] with 16000
% sample points.
t = linspace(0,2 ,16000)'; %Note the ? at the end
%
% Now define the two functions.
sound1 = sin(2*pi*440*t); %define the first function
sound2 = sin(2*pi*880*t); %define the second function
y= sound1 + sound2;
%
% Plot the two functions. Note we only plot the first
% 1/100th of a second.
subplot(3,1,1); plot(t,sound1); axis([0,.01,-1, 1])
subplot(3,1,2); plot(t,sound2); axis([0,.01,-1, 1])
subplot(3,1,3); plot(t,y); axis([0,.01,-1, 1])
soundsc(sound1,8000) %The 8000 is needed to tell the
%soundsc command the sampling frequency. Here there are
% 8000samples per second. 
