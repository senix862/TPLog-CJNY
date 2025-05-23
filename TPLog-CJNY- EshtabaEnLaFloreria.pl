%Base de conocimiento

% Hechos de plantas y sus características -> planta(Nombre, Caracteristica).
planta(rose, color(rojo)).
planta(rose, altura(media)).
planta(rose, epoca(floracion, primavera)).
planta(rose, tipo(arbusto)).

planta(lily, color(blanco)).
planta(lily, altura(corta)).
planta(lily, epoca(floracion, verano)).
planta(lily, tipo(flor)).

planta(tulip, color(amarillo)).
planta(tulip, altura(corta)).
planta(tulip, epoca(floracion, primavera)).
planta(tulip, tipo(flor)).

planta(sunflower, color(amarillo)).
planta(sunflower, altura(alta)).
planta(sunflower, epoca(floracion, verano)).
planta(sunflower, tipo(flor)).

planta(cactus, color(verdes)).
planta(cactus, altura(baja)).
planta(cactus, epoca(floracion, verano)).
planta(cactus, tipo(suculenta)).

planta(fern, color(verdes)).
planta(fern, altura(media)).
planta(fern, epoca(floracion, todo_el_ano)).
planta(fern, tipo(helecho)).

planta(orchid, color(purple)).
planta(orchid, altura(corta)).
planta(orchid, epoca(floracion, primavera)).
planta(orchid, tipo(flor)).

planta(bamboo, color(verdes)).
planta(bamboo, altura(alta)).
planta(bamboo, epoca(floracion, todo_el_ano)).
planta(bamboo, tipo(pasto)).

planta(ivy, color(verdes)).
planta(ivy, altura(media)).
planta(ivy, epoca(floracion, todo_el_ano)).
planta(ivy, tipo(plantas_enredaderas)).

% Hechos de plantas que son compañeras -> plantas_companeras(Planta1, Planta2).
plantas_companeras(rose, lily).
plantas_companeras(lily, rose).
plantas_companeras(tulip, sunflower).
plantas_companeras(sunflower, tulip).
plantas_companeras(cactus, fern).
plantas_companeras(fern, cactus).
plantas_companeras(orchid, ivy).
plantas_companeras(ivy, orchid).
plantas_companeras(bamboo, rose).
plantas_companeras(rose, bamboo).


% A partir de acá, crear las reglas para cumplir con los puntos pedidos en el tp.
% 1.Queremos poder preguntar sobre nuestras plantas si: a. Son de tipo arbusto. b. Florecen en primavera. c. Tienen un color específico.

esArbusto(Planta):- planta(Planta,tipo(arbusto)).
florecenEnPrimavera(Planta):- planta(Planta,epoca(floracion,primavera)).
colorEspecifico(Planta,Color):- planta(Planta,color(Color)).

% 2.Sabemos que: a. Las plantas que son arbustos y florecen en verano deben tener un sistema de riego especial.
% b. Las plantas rojas o amarillas atraen más insectos benéficos. c. Las plantas que no son de tipo flor son consideradas altas.
%Realizar el predicado que nos permita agregar este conocimiento y el punto 1 no deba modificarse.

:- discontiguous planta/2.

planta(Planta,riego(especial)):- 
    planta(Planta,tipo(arbusto)),
    planta(Planta,epoca(floracion,verano)).

planta(Planta,atraeInsectos(beneficioso)):-
    planta(Planta,color(rojo)).

planta(Planta,atraeInsectos(beneficioso)):-
    planta(Planta,color(amarillo)).

planta(Planta,consideradas(altas)):-
    planta(Planta, tipo(_)),
    not(planta(Planta, tipo(flor))).


% 3.Se necesita conocer el conjunto de todas las plantas que son cortas y de tipo flor.

cortasYtipoFlor(ConjuntoCortasYFlor):-
    findall(Planta,(planta(Planta, altura(corta)), planta(Planta, tipo(flor))),ConjuntoCortasYFlor).


% 4.Ahora debemos agregar las pistas obtenidas durante las observaciones. Por ejemplo:
% Queremos relacionar una planta y un observador solo si todas las pistas que tiene el observador son características de la planta. En este punto no se puede usar findall.
%rose
pista(arbol_rojo, tipo(arbusto)).
pista(arbol_rojo, altura(media)).
pista(arbol_rojo, color(rojo)).
%lily
pista(arbol_blanco, tipo(flor)).
pista(arbol_blanco, color(blanco)).
%cactus
pista(arbol_verde, epoca(floracion, verano)).
pista(arbol_verde, color(verdes)).
pista(arbol_verde, tipo(suculenta)).
%tulip
pista(arbol_amarillo, epoca(floracion, primavera)).
pista(arbol_amarillo, color(amarillo)).



cumplePistasDelObservador(Observacion, Planta):- planta(Planta,_), pista(Observacion,_),
    forall(pista(Observacion, Caracteristica), planta(Planta, Caracteristica)).


% 5.Finalmente, queremos saber si una planta está atrayendo más visitas que su compañera. Para ello, la cantidad de pistas que cumple
% debe ser mayor que la de las plantas compañeras.

cantidadPistasCumplidas(Planta, Cantidad) :- 
    findall(Pista, (pista(Pista, Caracteristica), planta(Planta, Caracteristica)), Lista),
    length(Lista, Cantidad).

% Verifica si una planta atrae más visitas que su compañera
atraeMasVisitas(Planta,Companera) :-
    plantas_companeras(Planta, Companera),
    cantidadPistasCumplidas(Planta, CantidadPlanta),
    cantidadPistasCumplidas(Companera, CantidadCompanera),
    CantidadPlanta > CantidadCompanera.