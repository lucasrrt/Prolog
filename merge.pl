%Mergesort
split([], _, [], []).
split(XS, K, [], XS):-
	K < 1.
split([X|XS], K, [X|YS], ZS):-
	K >= 1,
	P is K -1,
	split(XS, P, YS, ZS).

merge1([], [], []).
merge1(XS, [], XS).
merge1([], YS, YS).
merge1([X|XS], [Y|YS], [X|ZS]):-
	X =< Y,
	merge1(XS, [Y|YS], ZS).
merge1([X|XS], [Y|YS], [Y|ZS]):-
	Y < X,
	merge1([X|XS], YS, ZS).

mergesort([], []).
mergesort([X], [X]).
mergesort([X, Y], [X, Y]):-
	X =< Y, !.
mergesort([X, Y], [Y, X]):-
	X > Y, !.
mergesort(XS, ZS):-
	length(XS, L),
	L > 0,
	K is L / 2,
	split(XS, K, XS1, XS2),
	mergesort(XS1, YS1),
	mergesort(XS2, YS2),
	merge1(YS1, YS2, ZS), !.
