% Aristas bidireccionales (Mapa de España)
arista(coruna, vigo, 171).
arista(coruna, valladolid, 455).
arista(vigo, valladolid, 356).
arista(oviedo, bilbao, 304).
arista(bilbao, valladolid, 280).
arista(bilbao, madrid, 395).
arista(bilbao, zaragoza, 324).
arista(valladolid, madrid, 193).
arista(madrid, badajoz, 403).
arista(madrid, jaen, 335).
arista(madrid, albacete, 251).
arista(madrid, zaragoza, 325).
arista(zaragoza, barcelona, 296).
arista(barcelona, gerona, 100).
arista(barcelona, valencia, 349).
arista(albacete, valencia, 191).
arista(albacete, murcia, 150).
arista(albacete, granada, 278).
arista(valencia, murcia, 241).
arista(jaen, sevilla, 242).
arista(jaen, granada, 99).
arista(sevilla, cadiz, 125).
arista(sevilla, granada, 256).

% Regla para simular grafo no dirigido
distancia(X, Y, D) :- arista(X, Y, D).
distancia(X, Y, D) :- arista(Y, X, D).

% Encontrar ruta y costo total
ruta(Origen, Destino, Camino, CostoTotal) :-
    ruta_aux(Origen, Destino, [Origen], CaminoRevertido, CostoTotal),
    reverse(CaminoRevertido, Camino).

ruta_aux(X, X, Visitados, Visitados, 0).
ruta_aux(Origen, Destino, Visitados, Camino, CostoTotal) :-
    distancia(Origen, Siguiente, D1),
    \+ member(Siguiente, Visitados),
    ruta_aux(Siguiente, Destino, [Siguiente|Visitados], Camino, D2),
    CostoTotal is D1 + D2.