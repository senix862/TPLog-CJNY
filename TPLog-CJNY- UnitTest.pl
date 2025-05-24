% Trabajo práctico de Lógica - Jardín Botánico Virtual TESTS
% Grupo: Caceres Catherine, Yanzon Brisa, Navarro Mario, Jalowicki Emiliano
% Materia: Algoritmos y Programación II
:- discontiguous pista/2.
:- include('TPLog-CJNY- EshtabaEnLaFloreria.pl').
% Pistas para el test Punto 4.
pista(planta_amarillo, color(amarillo)).
pista(planta_amarillo, epoca(floracion, verano)).
pista(planta_amarillo, altura(alta)).
    % Prueba caracterísitca inexistente
pista(arbol_inexistente, color(turquesa)).
    % Prueba flor inexistente
pista(planta_verde, tipo(flor)).
pista(planta_verde, altura(media)).

% Test Punto 1:
:- begin_tests(punto1).

test(es_arbusto_verdadero):- esArbusto(rose). 

test(es_arbusto_falso, fail):- esArbusto(lily).

test(floracion_primavera):- 
    florecenEnPrimavera(rose),
    florecenEnPrimavera(tulip),
    florecenEnPrimavera(orchid). 

test(floracion_primavera_falso, fail):- 
    florecenEnPrimavera(cactus). 

test(color_especifico_verdadero):- 
    colorEspecifico(rose, rojo).

test(color_especifico_verdadero):- 
    colorEspecifico(tulip, amarillo). 

test(color_especifico_falso, fail):- 
    colorEspecifico(fern, rojo).

:- end_tests(punto1).

% Test Punto 2:
:- begin_tests(punto2).

test("Prueba para planta con riego especial (debe fallar)", fail):-
    planta(Planta, riego(especial)).

test("Prueba de atraccion de insectos - planta roja: rose"):-
    planta(rose, atraeInsectos(beneficioso)).

test("Prueba de atraccion de insectos - planta amarilla: tulip"):-
    planta(tulip, atraeInsectos(beneficioso)).

test("Prueba de atraccion de insectos - planta amarilla: sunflower"):-
    planta(sunflower, atraeInsectos(beneficioso)).

test("Prueba de plantas que no son flores y se consideran altas (conjunto esperado)") :-
    findall(Planta, planta(Planta, consideradas(altas)), Lista),
    sort(Lista, Ordenadas),
    Ordenadas == [bamboo, cactus, fern, ivy, rose].

:- end_tests(punto2).

% Test Punto 3:
:- begin_tests(punto3).

test("Prueba de plantas cortas y de tipo flor") :-
    cortasYtipoFlor(Resultado),
    sort(Resultado, Ordenado),
    Ordenado == [lily, orchid, tulip].

test("Prueba inversible: planta corta y flor - tulip") :-
    cortasYtipoFlor(Conjunto), member(tulip, Conjunto).

test("Prueba inversible: planta corta y flor - lily") :-
    cortasYtipoFlor(Conjunto), member(lily, Conjunto).

test("Prueba de que bamboo no está en el conjunto de plantas cortas y flor", fail) :-
    cortasYtipoFlor(Conjunto), member(bamboo, Conjunto).

:- end_tests(punto3).


% Test Punto 4:
:-begin_tests(punto4).
    test("Prueba para planta correcta: rose"):- cumplePistasDelObservador(arbol_rojo, rose).

    test("Prueba para planta correcta: sunflower"):- cumplePistasDelObservador(planta_amarillo, sunflower).

    test("Prueba inversible: rose"):-
        cumplePistasDelObservador(Observacion, rose),
        (Observacion == arbol_rojo).

    test("Prueba inversible: sunflower"):-
        cumplePistasDelObservador(Observacion, sunflower),
        (Observacion == planta_amarillo).

    test("Prueba para planta incorrecta: rose", fail):- cumplePistasDelObservador(arbol_inexistente,Planta).

    test("Prueba para flor inexistente", fail):- cumplePistasDelObservador(planta_verde,Planta).

    test("Prueba para planta incorrecta: arbol_rojo", fail):- cumplePistasDelObservador(arbol_rojo, lily).

:-end_tests(punto4).

% Test Punto 5:
:-begin_tests(punto5).

test("Prueba para flor inexistente", fail):- atraeMasVisitas(florLoto,Companera).

test("Prueba para flor inexistente", fail):- atraeMasVisitas(Planta,cala).

test("Prueba para flores inexistentes", fail):- atraeMasVisitas(florLoto,cala).

test("Prueba cantidad de pistas: 0", fail):- cantidadPistasCumplidas(cactus,0).

test("Prueba cantidad de pistas: 5"):- cantidadPistasCumplidas(rose, 5).

:-end_tests(punto5).