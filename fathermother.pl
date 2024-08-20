male(john).
male(oliver).
male(ali).
male(james).
male(jack).
male(harry).

female(helen).
female(sopie).
female(mary).
female(sue).

parent(john, mary).
parent(john, sue).
parent(helen, mary).
parent(helen, sue).
parent(oliver, james).
parent(sophie, james).
parent(mary, jack).
parent(ali, jack).
parent(sue, harry).
parent(james, harry).

father(X, Y) :-
	male(X), 
	parent(X, Y).

mother(X, Y) :-
	female(X), 
	parent(X, Y).

grandfather(X, Y) :-
	father(X, Z), 
	parent(Z, Y).

grandmother(X, Y) :-
	mother(X, Z), 
	parent(Z, Y).

sister(X, Y) :-
	parent(Z, X), 
	parent(Z, Y), 
	female(X), X \= Y.

brother(X, Y) :-
	parent(Z, X), 
	parent(Z, Y), 
	male(X), X \= Y.

sibling(X, Y) :-
	parent(Z, X), 
	parent(Z, Y), X \= Y.

uncle(X, Y) :-
	brother(X, Z), 
	parent(Z, Y).

aunt(X, Y) :-
	sister(X, Z), 
	parent(Z, Y).

% who is sister of Mary, who are there parent
% sister(X, mary), parent(X, Y)

% who has parent
% parent(_, X) THEN use ; to get all X

% who is a child of someone
% parent(_, X), male(X) THEN use ; to get all X

% who is a sister of someone
% sister(X, _) THEN use ; to get all X