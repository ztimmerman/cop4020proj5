menu(Roster) :-
  write('\tClass roster management system'), nl,
  write('\t=============================='), nl,
  write('\t   MENU'), nl,
  write('\t=============================='), nl,
  write('\t0. Reset roster'), nl,
  write('\t1. Load roster from file'), nl,
  write('\t2. Store roster to file'), nl,
  write('\t3. Display roster sorted by ID'), nl,
  write('\t4. Add student to roster'), nl,
  write('\t5. Remove student from roster'), nl,
  write('\t6. Exit'), nl,
  write('\tEnter your choice (followed by a \'.\'): '),
  read(Sel),
  process(Sel, Roster).

process(0, Roster) :-
    nl,
    write('\tReseting roster!'),
    nl, nl, menu([]).

process(1, Roster) :-
    nl,
    write('\tLoading roster from file.'),
    nl, nl, menu(Roster).

process(2, Roster) :-
    nl,
    write('\tStoring roster to file.'),
    nl, nl, menu(Roster).

process(3, Roster) :-
  nl,
  write('\tDisplaying roster sorted by ID.'), nl,
%  naive_sort(Roster, NewRoster),
%  write(NewRoster),
%  nl, nl, menu(NewRoster).
  write(Roster),
  nl, nl, menu(Roster).


process(4, Roster) :-
  nl,
  write('\tAdding student to roster: '),
  read_student_info([A, B, C]),
  nl, nl, menu([[A, B, C] | Roster]).

process(5, Roster) :-
  nl,
  write('\tRemoving student from roster: '), nl,
  write('Input student\'s name: '),
  read(A),
  remove([_, A , _], Roster, X),
  nl, nl, menu(X).

process(6, _) :- write('Good-bye'), nl, !.
process(_, Roster) :- menu(Roster).

remove(_, [], []).
remove(Item, [Item | MyList], MyList).
remove(Item, [X | L], [X | T]) :- remove(Item, L, T).

perm([],[]).
perm([X | Y], Z) :- perm(Y, W), remove(X, Z, W).

naive_sort(List, Sorted) :- perm(List, Sorted), is_sorted(Sorted).
is_sorted([]).
is_sorted([_]).
is_sorted([A, B | L]) :-
  is_less_than(A,B),
  is_sorted([B | L]).

is_less_than([A, _, _], [B, _, _]):- A < B.

read_student_info([A, B, C]) :-
  write('\tStudent ID: '),
  read(A),
  write('\tStudent Name'),
  read(B),
  write('\tStudent Grade'),
  read(C).
