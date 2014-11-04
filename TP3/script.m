%%

sel = input('Escolha ficheiro para treinar a rede\n1- 44202.mat\n2- 63502.mat\n> ');

if(sel == 1) 
    load('44202.mat');
else
    load('63502.mat');t
end

cr = [];
aux = Trg;


last = 0;
cont = 1;

tempOne = 1;

while(~isempty(tempOne))
    %Find first crysis
    tempOne = find(aux == 1, 1, 'first');%find(X,K,'first') is the same as find(X,K)
    
    if(isempty(tempOne))
        break;
    end
    
    %Consider excude all the data before that crysis?
    aux = Trg((tempOne+last+1): length(Trg));

    tempTwo = find(aux == 0, 1, 'first');
    cr(cont, 1) = tempOne+last;
    
    cr(cont, 2) = tempOne+last+tempTwo;
    aux = Trg((tempOne+last+tempTwo+1): length(Trg));

    %So, in cr we are saving all the epileptic crysis, and for each crysis we store the start and end, right?

    %Why do we need the "last" variable?
    
    %disp(cr);
    last = tempOne+last+tempTwo;
    cont = cont + 1;
end

disp(cr);
size(cr)
%If size(cr) == [22 2] then our pacient has 22 crysis, which we need to separate into training, test and validation cases, using divideind
