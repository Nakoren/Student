%Task 2

%Var 7

%Task 2.1

% digits_Mult_up(+N, -M)
digits_Mult_up(0, 1) :- !.
digits_Mult_up(N, M) :- N1 is N // 10, Remain is N mod 10, digits_Mult_up(N1, Mult1), M is Mult1 * Remain.

% digits_Mult_down(+N, -M)
digits_Mult_down(N, M) :- digits_Mult_down(N, 1, M).

% digits_Mult_down(+N, +CurrentMult, -M)
digits_Mult_down(0, M, M) :- !.
digits_Mult_down(N, CurrentMult, M) :- N1 is N // 10, Remain is N mod 10, NewMult is CurrentMult * Remain, digits_Mult_down(N1, NewMult, M).

%Task 2.2

% digits_Count_up(+N, -M)
digits_Count_up(0, 0) :- !.
digits_Count_up(N, Count) :- Remain is N mod 10, Remain < 3, N1 is N // 10, digits_Count_up(N1, Count1), Count is Count1 + 1.
digits_Count_up(N, Count) :- Remain is N mod 10, N1 is N // 10, digits_Count_up(N1, Count).

% digits_Count_down(+N, -Count)
digits_Count_down(N, Count) :- digits_Count_down(N, 0, Count).

% digits_Count_down(+N, +CurrentCount, -Count)
digits_Count_down(0, Count, Count) :- !.
digits_Count_down(N, CurrentCount, Count) :- Remain is N mod 10, Remain < 3, N1 is N // 10, NewCount is CurrentCount + 1, digits_Count_down(N1, NewCount, Count).
digits_Count_down(N, CurrentCount, Count) :- Remain is N mod 10, N1 is N // 10, digits_Count_down(N1, CurrentCount, Count).

%Task 2.3

% gcd_up(+A, +B, -GCD)
gcd_up(A, B, GCD) :- (A > B -> gcd_up(A, B, B, GCD); gcd_up(B, A, A, GCD)).
% gcd_up(+A, +B, +CurrentGCD, -GCD)
gcd_up(_, _, 1, 1) :- !.
gcd_up(A, B, CurrentPossibleGCD, GCD) :- NextPossibleGCD is CurrentPossibleGCD - 1, gcd_up(A, B, NextPossibleGCD, SmallerCommonDivisor),
    (is_divisor(A, CurrentPossibleGCD), is_divisor(B, CurrentPossibleGCD), GCD is CurrentPossibleGCD, !; GCD is SmallerCommonDivisor).

% gcd_down(+A, +B, -GCD) (алгоритм Евклида)
gcd_down(A, 0, A) :- !.
gcd_down(A, B, GCD) :- B > A -> gcd_down(B, A, GCD).
gcd_down(A, B, GCD) :- Remainder is A mod B, gcd_down(B, Remainder, GCD).