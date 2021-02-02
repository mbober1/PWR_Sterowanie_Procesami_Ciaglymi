
function [error] = mnk_on(b, u, bn, Pn)
    y = (b(1) * u(3)) + (b(2) * u(2)) + (b(3) * u(1)) + d*rand();

    f = [ u(3), u(2), u(1) ];

    E = y - f*transpose(bn);

    Pn = Pn - (Pn * transpose(f) * f * Pn) / (1 + f * Pn * transpose(f));

    bn = bn + transpose(Pn * transpose(f) * E)

    error = norm(bn - transpose(b));    
end