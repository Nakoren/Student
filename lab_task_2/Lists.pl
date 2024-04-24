%Task 3
%Var 7

%Task 3.1
%list2SlideRight(+List[],-Slided)
list2Slide(List, Slided) :-
    append(Left, Right, List),
    length(Right, 2),
    append(Right, Left, Slided), !.

%Task 3.2


%Task 3.3

%list1SlideLeft(+List[],-Slided)
list2Slide(List, Slided) :-
    append(Left, Right, List),
    length(Left, 1),
    append(Right, Left, Slided).
