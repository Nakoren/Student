%Task 1

%Task 1.1
% max(+X, +Y, +Z, -U)
max(X, Y, Z, X) :- X > Y, X > Z, !.
max(_, Y, Z, Y) :- Y > Z, !.
max(_, _, Z, Z).

%Task 1.2
% fact_up(+N, -X)
fact_up(0, 1) :- !.
fact_up(N, X) :- N_prev is N - 1, fact_up(N_prev, X_prev), X is N * X_prev.

% fact_down(+N, -X)
fact_down(N, X) :- fact_down(0, 1, N, X).

% fact_down(+N_current, +X_current, +N, -X)
fact_down(N, X, N, X) :- !.
fact_down(N_current, X_current, N, X) :- N_next is N_current + 1, X_next is X_current * N_next, fact_down(N_next, X_next, N, X).

%Task 1.3
% digits_sum_up(+N, -Sum)
digits_sum_up(0, 0) :- !.
digits_sum_up(N, Sum) :- N1 is N // 10, Remain is N mod 10, digits_sum_up(N1, Sum1), Sum is Sum1 + Remain.

% digits_sum_down(+N, -Sum)
digits_sum_down(N, Sum) :- digits_sum_down(N, 0, Sum).

% digits_sum_down(+N, +CurrentSum, -Sum)
digits_sum_down(0, Sum, Sum) :- !.
digits_sum_down(N, CurrentSum, Sum) :- N1 is N // 10, Remain is N mod 10, NewSum is CurrentSum + Remain, digits_sum_down(N1, NewSum, Sum).

%Task 1.4

%is_divider(+Number, +Divider)
is_divider(Number, Divider) :- Remain is Number mod Divider, Remain is 0.

% is_square(+PossibleSquare)
is_square(PossibleSquare) :- MaxDivider is PossibleSquare // 2, is_square(PossibleSquare, MaxDivider).

%is_square(+PossibleSquare, +Number)
is_square(_, 1) :- !, fail.
is_square(PossibleSquare, Number) :- PossibleSquare is Number * Number; NewNumber is Number - 1, is_square(PossibleSquare, NewNumber).

%is_square_free(+Number)
is_square_free(1).
is_square_free(Number) :- is_square_free(Number, Number).

%is_square_free(+Number, +Divider)
is_square_free(_, 1).
is_square_free(Number, Divider) :- not((is_divider(Number, Divider), is_square(Divider))), NewDivider is Divider - 1, is_square_free(Number, NewDivider).

%Task 1.5

%list_reader(+Length, -List)
list_reader(0, []).
list_reader(Length, [Head|Tail]) :- read(Head), NewLength is Length - 1, list_reader(NewLength, Tail).

%list_writer(+List)
list_writer([]).
list_writer([Head|Tail]) :- write(Head), write(" "), list_writer(Tail).

%Task 1.6

% sum_list_down(+List, ?Sum)
sum_list_down(List, Sum) :- sum_list_down(List, 0, Sum).

% sum_list_down(+List, +CurSum, ?Sum)
sum_list_down([], CurSum, CurSum) :- !.
sum_list_down([Head|Tail], CurSum, Sum) :- NewSum is CurSum + Head, sum_list_down(Tail, NewSum, Sum).

% sum_list_up(+List, ?Sum)
sum_list_up([], 0) :- !.
sum_list_up([Head|Tail], Sum) :- sum_list_up(Tail, SumOfTail), Sum is SumOfTail + Head.

%Task 1.7

% remove_items_by_digit_sum(+DigitSum, +ListIn, -ListOut)
remove_items_by_digit_sum(_, [], []) :- !.
remove_items_by_digit_sum(DigitSum, [HeadIn|TailIn], ListOut) :- digits_sum_down(HeadIn, HeadInSum), HeadInSum == DigitSum, remove_items_by_digit_sum(DigitSum, TailIn, ListOut).
remove_items_by_digit_sum(DigitSum, [HeadIn|TailIn], [HeadIn|TailOut]) :- digits_sum_down(HeadIn, HeadInSum), HeadInSum =\= DigitSum, remove_items_by_digit_sum(DigitSum, TailIn, TailOut).

% remove_items_by_digit_sum_and_print(+DigitSum, +List)
remove_items_by_digit_sum_and_print(DigitSum, List) :- remove_items_by_digit_sum(DigitSum, List, Result), list_writer(Result).

%list_writer(+List[])
list_writer([]) :- !.
list_writer([Head|Tail]) :- print(Head), list_writer(Tail). 