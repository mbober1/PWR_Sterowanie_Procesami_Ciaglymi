
function [error] = mnk_off(b, u, d)
    N = length(u);
    Zn = randn(N,1);
    u = [0, 0, u];

    for i = 1:N
        y(i) = (b(1) * u(i + 2)) + (b(2) * u(i + 1)) + (b(3) * u(i)) + d*Zn(i);
        FI(i,:) = [ u(i+2), u(i+1), u(i) ];
    end

    bn_off = (inv(transpose(FI) * FI)) * transpose(FI) *  transpose(y);
    
    error = norm(bn_off - transpose(b));
end