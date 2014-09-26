cond = 1;

while cond < 100
    % Open mpaper %
    mpaper;
    
    % This wait for the Figure 1 - mpaper - to close %
    waitfor(1);
    
    % Here we have to copy the values of P to a P2 %
    %

    % Increase cond
    cond = cond + 1;
end