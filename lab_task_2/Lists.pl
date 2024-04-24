%Task 3
%Var 7

%Task 3.1

%list_2_slide_right_start(+List[])
list_2_slide_right_start(List) :- list_2_Slide_Right(List,Slided), list_writer(Slided).

%list_2_Slide_Right(+List[],-Slided)
list_2_Slide_Right(List, Slided) :-
    append(Left, Right, List),
    length(Right, 2),
    append(Right, Left, Slided).

%Task 3.2

%search_before_min_Start(List[]+)
search_before_min_Start(List) :- search_before_min(List,Result), list_writer(Result),!.

%search_before_min(+List, ?Result)
search_before_min(List, Result) :- get_min_start(List, Min), search_before_min(List, Min, [], Result).

%search_before_min(+List, +Min, +ResList, -Result)
search_before_min([Min|Tail], Min, Result, Result) :- !.
search_before_min([Head|Tail], Min, ResList, Result) :- insert_back_element(ResList, Head, NewResList), search_before_min(Tail, Min, NewResList, Result).

%get_min_start(+List, -Min)
get_min_start([Head|Tail],Min) :- get_min(Tail, Head, Min).

%get_min(+List, +curMin, -Min)
get_min([], Min, Min) :- !.
get_min([Head|Tail], Min, X) :- Head<Min, get_min(Tail, Head, X).
get_min([Head|Tail], Min, X) :- get_min(Tail, Min, X).

%insert_back_element(+List, +Element, -TailWithElement)
insert_back_element([], Element, [Element]):-!.
insert_back_element([Head|Tail], Element, [Head|TailWithElement]):-
  insert_back_element(Tail, Element, TailWithElement).

%Task 3.3

%list_1_slid_left_start(+List[])
list_1_slid_left_start(List) :- list_2_slide_left(List,Slided), list_writer(Slided).

%list1SlideLeft(+List[],-Slided)
list_2_slide_left(List, Slided) :-
    append(Left, Right, List),
    length(Left, 1),
    append(Right, Left, Slided).


%List_writer(+List[])
list_writer([]) :- !.
list_writer([Head|Tail]) :- print(Head), list_writer(Tail). 