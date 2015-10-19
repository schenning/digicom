function [x, ms ] = rraised_cosine(alpha,T,from,to)
%
% function [ x, t ] = rraised_cosine(alpha,T,from,to)
%
% returns a normalized raised-cosine pulse with excess bandwidth "alpha",
% evaluated between "from" and "to" (in normalized time)
% T points per time unit
% x will have size (1, ceil(T x to) - floor(T x from) + 1)
%
if (alpha < 0) | (alpha > 1),
        error('Illegal alpha')
end
if (to < from )
        error('From must be smaller than to')
end
%
from = floor(from * T);
to = ceil(to * T);
u = max(abs(from),abs(to));
if from * to < 0
        l = 0;
else
        l = min(abs(from),abs(to));
end
%
ms=(l:u)/T;
%
denum = pi * ms .* (1 - (4 * alpha * ms).^2);
i = find(abs(denum) < eps);
denum(i) = ones(1:length(i));

x = ( sin(pi*(1-alpha)*ms) + 4 * alpha * ms .* cos((1+alpha)*pi*ms) ) ./ denum;

%Take care of all the singular points by using l'Hospital
for n = i,
        if ms(n) == 0,
                x(n) = 1 - alpha + 4 * alpha / pi;
        else
                x(n) = alpha * ( cos(pi * (1-alpha) / 4 / alpha ) ...
                               - 2 / pi * cos( pi * ( 1 + alpha ) / 4 / alpha ));
        end
end
if ( to <= 0 ),
        x = fliplr(x);
elseif (from < 0)
% x contains the raised_cosine from 0 to max(abs(from),to)
        x = [ fliplr(x(2:(abs(from)+1))), x(1:(to+1)) ];
end

