function [realbuf] =callSIMDas(RData)
%EF#2
    Receive = evalin('base','Receive');
    raw = RData(1:Receive(end).endSample, :);
    scale = 7/(2^15 - 1); % compensate for LUT
    realbuf =scale*abs(double(simdas(1,raw))); % to image buffer directly not interbuffer
%EF#2
end