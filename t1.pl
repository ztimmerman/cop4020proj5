menu(X) :-
   write('\tClass roster management system'), nl,
   write('\t=============================='), nl,
   write('\t   MENU'), nl,
   write('\t=============================='), nl,
   write('\t0. Option 0'), nl,
   write('\t1. Option 1'), nl,
   write('\t2. Exit'), nl,
   write('\tEnter your choice (followed by a \'.\'): '),
   read(Sel),
   process(Sel, X).

process(0, X) :-
    nl,
    write('\tGot option 0 here.'),
    nl, nl, menu(X).

process(1, X) :-
    nl,
    write('\tGot option 1 here.'),
    nl, nl, menu(X).

process(2, _) :- write('Good-bye'), nl, !.
process(_, X) :- menu(X).
