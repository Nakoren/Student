man(anatoliy).
man(dimitriy).
man(vlad).
man(kirill).
man(mefodiy).
woman(vladina).
woman(galya).
woman(sveta).
woman(zoya).
woman(katrin).
dite(dimitriy, anatoliy).
dite(dimitriy, galya).
dite(vladina, anatoliy).
dite(vladina, galya).
dite(kirill, dimitriy).
dite(mefodiy, dimitriy).
dite(kirill, sveta).
dite(mefodiy, sveta).
dite(zoya, vlad).
dite(zoya, vladina).
dite(katrin, vlad).
dite(katrin, vladina).

sin(X,Y):-dite(X,Y),man(X).
doch(X,Y):-dite(X,Y),woman(X).

brak(X,Y):-dite(Z,X),!,dite(Z,Y),not(X=Y).
/* bro(X,Y) Y ÿâëÿåòñÿ áðàòîì Õ
 *  sister(X, Y) Y ÿâëÿåòñÿ ñåñòðîé Õ
 *  br_s
 *  tetya
 *  dadya
 *  vnuki(X,Y)
*/

max(X,Y,X):-X>Y,!.
max(_,Y,Y).

max3(X,Y,U,X):-X>Y,X>U,!.
max3(_,Y,U,Y):-Y>U,!.
max3(_,_,U,U).

fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

fact1(N,X):-fact2(0,1,N,X).
fact2(N,Y,N,Y):-!.
fact2(N,_,N,_):-!,fail.
fact2(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact2(I1,Y1,N,X).

max_summ_cifr_el([A], A) :- !.
max_summ_cifr_el([CurEl|Tail], Res1) :-
	summ_cifr(CurEl,SCCurEl), max_summ_cifr_el(Tail, Res1),
	summ_cifr(Res1, ScRes1), SCCurEl < ScRes1, !. 
max_summ_cifr_el([CurEl|Tail], CurEl).

sum_el([], 0) :- !.
sum_el([H|T],Sum) :- sum_el(T, SumT), Sum is H + SumT.

sum_el_down(List, Sum) :- sum_el_down(List, 0, Sum).
sum_el_down([], Sum, Sum) :- !.
sum_el_down([H|T],CurSum, Sum) :- NewSum is CurSum + H, 
	sum_el_down(T, NewSum, Sum).

sum_pr_el_down(List, Sum) :- sum_pr_el_down(List, 0, Sum).
sum_pr_el_down([], Sum, Sum) :- !.
sum_pr_el_down([H|T],CurSum, Sum) :- pr(H), NewSum is CurSum + H, 
	sum_pr_el_down(T, NewSum, Sum), !.
sum_pr_el_down([_|T],CurSum, Sum) :-  
	sum_pr_el_down(T, CurSum, Sum).

append1([], L, L):-!.
append1([H|T], L, [H|R]) :- append1(T, L, R).

pr(2):-!.
pr(X):-pr1(X,2).
pr1(X,X):-!.
pr1(X,I):- Y is X mod I, Y\=0, I1 is I+1, pr1(X,I1).




summ_cifr(0,0):-!.
summ_cifr(X,SummCifr):-X1 is X // 10, Ost is X mod 10, 
	summ_cifr(X1, SummCifr1), SummCifr is SummCifr1 + Ost.

summ_cifr_down(N,X):- summ_cifr(N,0,X).
summ_cifr(0,X,X):-!.
summ_cifr(N,CurX,X):-N1 is N // 10, Ost is N mod 10,
	NewX is CurX + Ost, summ_cifr(N1, NewX, X).


fib(1,1):-!.
fib(2,1):-!.
fib(N,X):-N1 is N-1, N2 is N-2, fib(N1,X1), fib(N2,X2), X is X1+X2.

fib1(N,X):-fib2(1,1,2,N,X).
fib2(_,B,N,N,B):-!.
fib2(A,B,I,N,X):- I1 is I+1, C is A+B, fib2(B,C,I1,N,X).


n_pr(N,X):-npr(N,N,X).
npr(N,I,I):- Y is N mod I, Y=0, pr(I),!.
npr(N,I,X):- I1 is I-1, npr(N,I1,X).


pr3_00:-read(N),write(N).

pr3_0:-read(N),r_list(A,N),w_list(A).
r_list(A,N):-r_list(A,N,0,[]).
r_list(A,N,N,A):-!.
r_list(A,N,K,B):-read(X),append(B,[X],B1),K1 is K+1,r_list(A,N,K1,B1).
w_list([]):-!.
w_list([H|T]):-write(H),nl,w_list(T).

count_loc_max(List, Count):-count_loc_max(List, 0, Count).
count_loc_max([_,_],Count,Count):-!.
count_loc_max([A,B,C|Tail],CurCount, Count):- B > A, B > C,
	NewCount is CurCount + 1, count_loc_max([B,C|Tail],NewCount, Count),!. 
count_loc_max([_,B,C|Tail], CurCount, Count):- 
	count_loc_max([B,C|Tail], CurCount, Count).

pr3_1:-read(N),r_list(A,N),list_sum(A,S),write(S).
list_sum(A,S):-list_sum(A,S,0).
list_sum([],S,S):-!.
list_sum([H|T],S,Sum):-Sum1 is Sum+H,list_sum(T,S,Sum1).

pr3_2:-read(N),r_list(A,N),read(I),el_no(A,I,X),write(X).
el_no(A,I,X):-el_no(A,I,1,X).
el_no([H|_],I,I,H):-!.
el_no([_|T],I,K,X):-K1 is K+1,el_no(T,I,K1,X).

pr3_3:-read(N), r_list(A,N), list_min(A,M), write(M).
list_min([H|T],M):-list_min(T,M,H).
list_min([],M,M):-!.
list_min([H|T],M,Min):-H<Min,!,list_min(T,M,H).
list_min([_|T],M,Min):-list_min(T,M,Min).

pr_c(0,0):-!.
pr_c(A,N):- pr_c(A,N,1).
pr_c(0,N,N):-!.
pr_c(A,N,Pr):-Ost is A mod 10,Pr1 is Pr*Ost, A1 is A div 10, pr_c(A1,N,Pr1).

pr_c2(0,0):-!.
pr_c2(A,N):-pr_c1(A,N).
pr_c1(0,1):-!.
pr_c1(A,N):-P is A mod 10, V is A div 10,pr_c1(V,U),N is U*P.

pr_sd(A,N):-pr_sd(A,1,N,0).
pr_sd(A,A,N,N):-!.
pr_sd(A,I,N,Sum):- Ost is A mod I, Ost=0, !, S is Sum+I, I1 is I+1, 
					pr_sd(A,I1,N,S).
pr_sd(A,I,N,Sum):-I1 is I+1, pr_sd(A,I1,N,Sum).

euler(A,N):-euler(1,A,0,N).
euler(A,A,N,N):-!.
euler(I,A,Count,N):-nod(I,A,1),!, K is Count+1, I1 is I+1,euler(I1,A,K,N).
euler(I,A,Count,N):-I1 is I+1,euler(I1,A,Count,N).

nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-Ost is A mod B, nod(B,Ost,C).

read_str(A,N):-get0(X),r_str(X,A,[],N,0).
r_str(10,A,A,N,N):-!.
r_str(X,A,B,N,K):-K1 is K+1,append(B,[X],B1),get0(X1),r_str(X1,A,B1,N,K1).

write_str([]):-!.
write_str([H|T]) :- put(H),write_str(T).

pr5_1:-	read_str(A,N),write_str(A),write(', '),write_str(A),write(', '),
		write_str(A),write(', '),write(N).

pr5_2:-read_str(A,N),count_words(A,K),write(K).

count_words(A,K):-count_words(A,0,K).

count_words([],K,K):-!.
count_words(A,I,K):-skip_space(A,A1),get_word(A1,Word,A2),Word \=[],I1 is I+1,count_words(A2,I1,K),!.
count_words(_,K,K).

skip_space([32|T],A1):-skip_space(T,A1),!.
skip_space(A1,A1).

get_word([],[],[]):-!.
get_word(A,Word,A2):-get_word(A,[],Word,A2).

get_word([],Word,Word,[]).
get_word([32|T],Word,Word,T):-!.
get_word([H|T],W,Word,A2):-append(W,[H],W1),get_word(T,W1,Word,A2).

get_words(A,Words,K):-get_words(A,[],Words,0,K).

get_words([],B,B,K,K):-!.
get_words(A,Temp_words,B,I,K):-
	skip_space(A,A1),get_word(A1,Word,A2),Word \=[],
	I1 is I+1,append(Temp_words,[Word],T_w),get_words(A2,T_w,B,I1,K),!.
get_words(_,B,B,K,K).

pr5_3:-read_str(A,N),get_words(A,Words,K),uniq_el(Words,Uniq_words),count_elems(Words,Uniq_words,Counts),
		max_in_list(Counts,Imax),el_no(Uniq_words,Imax,Word),write_str(Word).

write_list_str([]):-!.
write_list_str([H|T]):-write_str(H),nl,write_list_str(T).

uniq_el(Ref,Res):-uniq_el(Ref,Res,[]).
uniq_el([],Res,Res):-!.
uniq_el([H|T],Res,Cur):-check(H,Cur,Cur,R), uniq_el(T,Res,R).
check(El,[El|_],Ref,Ref):-!.
check(El,[],Ref,R):-append(Ref,[El],R),!.
check(El,[_|T],Ref,R):-check(El,T,Ref,R).

count_elems(_,[],[]):-!.
count_elems(A,[H|T],[Cur|Tail]):-count_el(H,A,Cur),count_elems(A,T,Tail).

count_el(El,List,Count):-count_el(El,List,Count,0).
count_el(_,[],Count,Count):-!.
count_el(El,[El|T],Count,Cur):-Cur1 is Cur+1, count_el(El,T,Count,Cur1),!.
count_el(El,[_|T],Count,Cur):-count_el(El,T,Count,Cur).

max_in_list([H|T],Imax):-max_in_list(T,H,1,2,Imax).
max_in_list([],_,Cur,_,Cur):-!.
max_in_list([H|T],Max,Cur,Ind,Imax):-H>Max,Ind1 is Ind+1,max_in_list(T,H,Ind,Ind1,Imax),!.
max_in_list([_|T],Max,Cur,Ind,Imax):-Ind1 is Ind+1,max_in_list(T,Max,Cur,Ind1,Imax).

read_str_f(A,N,Flag):-get0(X),r_str_f(X,A,[],N,0,Flag).
r_str_f(-1,A,A,N,N,0):-!.
r_str_f(10,A,A,N,N,1):-!.
r_str_f(X,A,B,N,K,Flag):-K1 is K+1,append(B,[X],B1),get0(X1),r_str_f(X1,A,B1,N,K1,Flag).

read_list_str(List,List_len):-read_str_f(A,N,Flag),r_l_s(List,List_len,[A],[N],Flag).
r_l_s(List,List_len,List,List_len,0):-!.
r_l_s(List,List_len,Cur_list,Cur_list_len,_):-
	read_str_f(A,N,Flag),append(Cur_list,[A],C_l),append(Cur_list_len,[N],C_l_l),
	r_l_s(List,List_len,C_l,C_l_l,Flag).



pr5_6:-	see('c:/Prolog/29_1_prolog_F/29_1.txt'),read_list_str(List,List_len),seen,
		tell('c:/Prolog/29_1_prolog_F/test.txt'),write_list_str(List),told.

build_all_razm_p:-
		read_str(A,N),read(K),b_a_rp(A,K,[]).
		
b_a_rp(A,0,Perm1):-write_str(Perm1),nl,!,fail.
b_a_rp(A,N,Perm):-in_list(A,El),N1 is N-1,b_a_rp(A,N1,[El|Perm]).

%razm_povt(+Alphabet,+N,+RazmCur,-Razm)
razm_povt(_,0,Razm,Razm):-!.
razm_povt(Alphabet,NCur,RazmCur,Razm):-in_list(Alphabet,El),NNew is NCur-1,razm_povt(Alphabet,NNew,[El|RazmCur],Razm).



in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).


sochet([],_,0):-!.
sochet([H|Sub_set],[H|Set],K):-K1 is K-1, sochet(Sub_set,Set,K1).
sochet(Sub_set,[H|Set],K):-sochet(Sub_set,Set,K).

make_pos_list(K, K, []):-!.
make_pos_list(K, CurPos, [NewPos|TailPos]) :- NewPos is CurPos + 1, make_pos_list(K, NewPos, TailPos).

make_3a_empty_word(K, K, _, []):-!.
make_3a_empty_word(K, CurIndex, [NewIndex|PosTail], [a|Tail]) :- 
	NewIndex is CurIndex + 1, make_3a_empty_word(K, NewIndex, PosTail, Tail),!.
make_3a_empty_word(K, CurIndex, PosList, [_|Tail]) :- 
	NewIndex is CurIndex + 1, make_3a_empty_word(K, NewIndex, PosList, Tail).	

build_word([],[],_):-!.
build_word([a|WordTail],[X|WordEmpty3aTail],RestWord) :- 
	nonvar(X),build_word(WordTail,WordEmpty3aTail,RestWord),!.
build_word([Y|WordTail],[X|WordEmpty3aTail],[Y|RestWordTail]) :- 
	var(X),build_word(WordTail,WordEmpty3aTail,RestWordTail).

build_3a_words_of_k(Alphabet,K,Word) :- make_pos_list(K, 0, PosList), 
	sochet(Pos_a_List, PosList, 3), make_3a_empty_word(K, 0, Pos_a_List, WordEmpty3a), Alphabet = [a|NewAlphabet], 
	M is K - 3, razm_povt(NewAlphabet, M, [], RestWord), build_word(Word, WordEmpty3a, RestWord).

