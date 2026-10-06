% Aristas dirigidas: conectado(Origen, Destino, Costo)
conectado(vancouver, edmonton, 16).
conectado(vancouver, calgary, 13).
conectado(calgary, edmonton, 4).
conectado(calgary, regina, 14).
conectado(edmonton, saskatoon, 12).
conectado(saskatoon, calgary, 9).
conectado(regina, saskatoon, 7).
conectado(saskatoon, winnipeg, 20).
conectado(regina, winnipeg, 4).
% Regla 1: Determinar si un nodo tiene aristas (de salida o entrada)
tiene_aristas(X) :- conectado(X, _, _).
tiene_aristas(X) :- conectado(_, X, _).

% Regla 2: Costo para ir de X a Z pasando obligatoriamente por Y
costo_pasando_por(X, Y, Z, CostoTotal) :-
    conectado(X, Y, C1),
    conectado(Y, Z, C2),
    CostoTotal is C1 + C2.

% Regla 3: Verificar si existe camino entre dos nodos (con manejo de ciclos para evitar bucles infinitos)
camino(X, Y) :- camino_aux(X, Y, []).

camino_aux(X, Y, _) :- 
    conectado(X, Y, _).
camino_aux(X, Y, Visitados) :-
    conectado(X, Z, _),
    Z \== Y,
    \+ member(Z, Visitados),
    camino_aux(Z, Y, [X|Visitados]).