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

%Test Punto 1:
:- begin_tests(punto1).

test(es_arbusto_verdadero):- es_arbusto(rose). %Prueba que "rose" sea un arbusto.

test(es_arbusto_falso, fail):- es_arbusto(lily). %Prueba que "lily" no sea un arbusto.

test(floracion_primavera):- 
    florecen_en_primavera(rose),
    florecen_en_primavera(tulip),
    florecen_en_primavera(orchid). %Prueba que "rose", "tulip" y "orchid" florezcan en primavera.

test(floracion_primavera_falso, fail):- 
    florecen_en_primavera(cactus). %Prueba que "cactus" no florezca en primavera.

test(color_especifico_verdadero):- 
    colorEspecifico(rose, rojo). %Prueba que "rose" sea de color rojo.

test(color_especifico_verdadero):- 
    colorEspecifico(tulip, amarillo). %Prueba que "tulip" sea de color amarillo.

test(color_especifico_falso, fail):- 
    colorEspecifico(fern, rojo). %Prueba que "fern" no sea de color rojo.

:- end_tests(punto1).

%Test Punto 2:
:- begin_tests(punto2).

test(riego_especial_falso, fail):- 
    riegoEspecial(rose). %Prueba de que no florece en verano.

test(atrae_insecto_rojo):- 
    atrae_insectos_beneficos(rose). %Prueba que "rose" atrae insectos benéficos.

test(atrae_insecto_amarillo):- 
    atrae_insectos_beneficos(sunflower). %Prueba que "sunflower" atrae insectos benéficos.
    atrae_insectos_beneficos(tulip). %Prueba que "tulip" atrae insectos benéficos.

test(no_atrae_insectos, fail):- 
    atrae_insectos_beneficos(fern). %Prueba que "fern" no atrae insectos benéficos.

test(consideradas_altas_correcto):-
    consideradas_altas(cactus), %Prueba de que plantas, son consideradas altas.
    consideradas_altas(bamboo),
    consideradas_altas(fern),
    consideradas_altas(ivy).

test(consideradas_altas_falso, fail):- 
    consideradas_altas(lily). %Prueba de que "lily" no es considerada alta.
:- end_tests(punto2).

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