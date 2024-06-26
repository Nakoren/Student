
man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

%men/0
men :- man(X), write(X), nl, fail.

%children(+X)
children(X) :- parent(X,Y), write(Y), nl, fail.

%mother(+X,+Y)
mother(X, Y) :- parent(X,Y), woman(X).

%mother(+X):
mother(X) :- parent(Y,X), woman(Y), write(Y), nl, fail.

%brother(+X,+Y)
brother(X, Y) :- parent(M,X), parent(M,Y), man(M), not(X==Y) ,man(X).

%brothers(+X)
brothers(X) :- parent(M,X), parent(M,Y), man(M) , not(X==Y), man(Y), man(X), write(Y), nl, fail.

%b_s(+X,+Y)
b_s(X, Y) :- parent(M,X), parent(M,Y), man(M),not(X==Y).

%b_s(+X)
b_s(X) :- parent(M,X), parent(M,Y), man(M) ,write(Y), not(X==Y), nl, fail.

%Task 2
%Var 7
%father(?X,?Y)
father(X, Y) :- parent(Y,X), man(Y).

%father(?X)
father(X) :- parent(Y,X), man(Y), write(Y).

%sister(?X,?Y)
sister(X, Y) :- parent(M,X), parent(M,Y), not(X==Y) , woman(X).

%sisters(?X)
sisters(X) :- parent(M,X), parent(M,Y), not(X==Y) , woman(Y), write(Y), nl, fail.

%Task 3
%grand_son(+X,+Y)
grand_son(X,Y) :- parent(M,X), parent(Y,M), man(X).

%grand_sons(+X):
grand_sons(X):- parent(X,M), parent(M,Y), man(Y), write(Y), nl, fail.

%grand_pa_and_son(+X,+Y)
grand_pa_and_son(X,Y) :- parent(X,M), parent(M,Y), man(X), man(Y).
grand_pa_and_son(X,Y) :- parent(Y,M), parent(M,X), man(X), man(Y).

%nephew(+X,+Y)
nephew(X,Y) :- parent(P,X), brother(P,Y) ,man(X).

%nephews(+X)
nephews(X) :- brother(X,P), parent(P,N) , man(N), write(N), nl, fail.

%father_in_law(?X)
father_in_law(X) :- man(X),  parent(X,C), parent(W,C), parent(F,W), man(F), write(F).