in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

start():-
    open('C:/Users/minen/Desktop/testProlog/file.txt',read,Str),
    readfile(Str,Lines),
    close(Str),
    leaveUnique(Lines,[],Res),
    write(Res),
    nl.

readfile(Str,[]):-at_end_of_stream(Str).
readfile(Str,[El|Tail]):-
    \+ at_end_of_stream(Str),
    read(Str, El),
    readfile(Str,Tail).

leaveUnique([],Res,Res).

leaveUnique([El|Tail], Cur, Res):-
    in_list(Cur,El),
    leaveUnique(Tail, Cur, Res).

leaveUnique([El|Tail],Cur,Res):-
    append(Cur,[El], NextCur),
    leaveUnique(Tail, NextCur, Res).