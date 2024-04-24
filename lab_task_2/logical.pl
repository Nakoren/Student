%Task 4

%Var 7

%Беседует трое друзей: Белокуров, Рыжов, Чернов. Брюнет сказал 
%Белокурову: “Любопытно, что один из нас блондин, другой брюнет, третий - рыжий, но ни 
%у кого цвет волос не соответствует фамилии”. Какой цвет волос у каждого из друзей?

%logicalTask/0
logicalTask :- 
    Friends = [_,_,_],
    member([belokurov, Color1], Friends),
    member([rizhov, Color2], Friends),
    member([chernov, Color3], Friends),

    member([_,white], Friends),
    member([_,ginger], Friends),
    member([_,black], Friends),

    Color1 \= white,
    Color2 \= ginger,
    Color3 \= black,

    write("Belokurov is "), write(Color1), nl,
    write("Rizhov is "), write(Color2), nl,
    write("Chernov is "), write(Color3), nl.
