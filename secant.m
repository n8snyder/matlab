function [x, y, err, iter] = secant(f, p0, p1, xtol, ytol, maxit)
    format long e
    done = false;
    iter = 1;
    x(1) = p0;
    x(2) = p1;
    y(1) = f(p0);
    y(2) = f(p1);
    x(3) = p1 - (f(p1))*(p1 - p0)/(f(p1) - (f(p0)));
    y(3) = f(x(3));
    err = abs(y(3)-y(2));
    if( (iter == maxit) || (abs(x(3) - x(2)) < xtol) || (abs(abs(y(3)) - abs(ytol)) > abs(y(3))) )
        done = true;
    end
    while ((~(iter == maxit) && (abs(x(iter+2) - x(iter+1)) >= xtol) && (abs(abs(y(iter+2)) - abs(ytol)) <= abs(y(iter+2)))) && ~(abs(x(iter+2))==Inf) || (done == false))
        iter = iter+1;
        x(iter+2) = x(iter+1) - ((y(iter+1))*(x(iter+1) - x(iter)))/(y(iter+1) - (y(iter)));
        y(iter+2) = f(x(iter+2));
        err = abs(y(iter+2)-y(iter+1));
        if( (iter == maxit) || (abs(x(iter+2) - x(iter+1)) < xtol) || (abs(abs(y(iter+2)) - abs(ytol)) > abs(y(iter+2))) || (abs(x(iter+2))==Inf))
            done = true;
        end
    end
    x=x';
    y=y';
    [x,y]
    err
    iter
end