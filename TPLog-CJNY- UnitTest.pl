:- include('TPLog-CJNY- EshtabaEnLaFloreria.pl').
%Pistas para el test Punto 4:
    % Prueba sunflower
pista(arbol_amarillo, color(amarillo)).
pista(arbol_amarillo, epoca(floracion, verano)).
pista(arbol_amarillo, altura(alta)).
    % Prueba caracterísitca inexistente
pista(arbol_inexistente, color(turquesa)).
    % Prueba flor inexistente
pista(arbol_verde, tipo(flor)).
pista(arbol_verde, altura(media)).

%Test Punto 3:
:-begin_tests(punto3).
    test("Prueba conjunto de cortas y tipo flor"):- cortasYtipoFlor(Plantas),
    Plantas == [lily, tulip, orchid]. %Verifica que "Plantas" sea la lista dada. (Sensible al orden).

    test("Prueba planta correcta: lily"):- cortasYtipoFlor(lily).

    test("Prueba planta incorrecta: bamboo", fail):- cortasYtipoFlor(bamboo).

    test("Prueba planta inexistente: diente_de_leon", fail):- cortasYtipoFlor(diente_de_leon).

    test("Prueba conjunto de plantas desordenadas", fail):- cortasYtipoFlor(Plantas),
    Plantas == [orchid, lily, tulip]. %Orden distinto al de Plantas, por lo que debe fallar (entonces el test tiene éxito).

    test("Prueba conjunto de plantas correctas + incorrecta", fail):- cortasYtipoFlor(Plantas),
    Plantas == [orchid, lily, tulip, fern].
:-end_tests(punto3).

%Test Punto 4:
:-begin_tests(punto4).
    test("Prueba para planta correcta: rose"):- cumplePistasDelObservador(arbol_rojo, rose).

    test("Prueba para planta correcta: sunflower"):- cumplePistasDelObservador(arbol_amarillo, sunflower).

    %test("Prueba inversible: rose"):- cumplePistasDelObservador(Observacion, rose).

    %test("Prueba inversible: sunflower"):- cumplePistasDelObservador(Observacion, sunflower).

    test("Prueba para planta incorrecta: rose", fail):- cumplePistasDelObservador(arbol_inexistente, Planta).

    test("Prueba para flor inexistente", fail):- cumplePistasDelObservador(arbol_verde, Planta).

    test("Prueba para planta incorrecta: arbol_rojo", fail):- cumplePistasDelObservador(arbol_rojo, lily).
:-end_tests(punto4).