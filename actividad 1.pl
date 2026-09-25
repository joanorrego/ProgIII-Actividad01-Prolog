% Punto 1: Arbol genealogico Simpson

% Hechos
padre(abraham, homero).
padre(abraham, herbert).
padre(clancy, marge).
padre(clancy, patty).
padre(clancy, selma).
padre(homero, bart).
padre(homero, lisa).
padre(homero, maggie).

madre(mona, homero).
madre(jacqueline, marge).
madre(jacqueline, patty).
madre(jacqueline, selma).
madre(marge, bart).
madre(marge, lisa).
madre(marge, maggie).
madre(selma, ling).

% Reglas
progenitor(X, Y) :- padre(X, Y).
progenitor(X, Y) :- madre(X, Y).

abuelo(X, Y) :- padre(X, Z), progenitor(Z, Y).
abuela(X, Y) :- madre(X, Z), progenitor(Z, Y).

hermanos(X, Y) :- progenitor(Z, X), progenitor(Z, Y), X \= Y.

tio_o_tia(X, Y) :- hermanos(X, Z), progenitor(Z, Y).


% Punto 2: Caso Coronel West

% Hechos
estadounidense(west).
enemigo(corea_del_sur, usa).
misil(m1).
tiene(corea_del_sur, m1).
vendio(west, m1, corea_del_sur).

% Reglas
arma(X) :- misil(X).
hostil(X) :- enemigo(X, usa).

criminal(Persona) :-
    estadounidense(Persona),
    arma(Objeto),
    vendio(Persona, Objeto, Pais),
hostil(Pais).
