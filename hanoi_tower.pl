%N é o número de discos na torre
hanoi(N):-move(N,1,2,3).

move(0,_,_,_):-!.

move(N,A,B,C):-
	M is N-1,
	move(M,A,C,B),
	inform(A,B),
	move(M,C,B,A).

inform(X,Y):-
	write('mova um disco do pino '),
	write(X),
	write(' para o pino '),
	write(Y), nl.
