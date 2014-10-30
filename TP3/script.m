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
    tempOne = find(aux == 1, 1, 'first');
    
    if(isempty(tempOne))
        break;
    end
    
    aux = Trg((tempOne+last+1): length(Trg));

    tempTwo = find(aux == 0, 1, 'first');
    cr(cont, 1) = tempOne+last;
    
    cr(cont, 2) = tempOne+last+tempTwo;
    aux = Trg((tempOne+last+tempTwo+1): length(Trg));
    
    disp(cr);
    last = tempOne+last+tempTwo;
    cont = cont + 1;
end

disp(cr);


