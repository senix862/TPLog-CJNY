:- include('TPLog-CJNY- EshtabaEnLaFloreria.pl').
%Pistas para el test Punto 4:
    % Prueba sunflower
pista(planta_amarillo, color(amarillo)).
pista(planta_amarillo, epoca(floracion, verano)).
pista(planta_amarillo, altura(alta)).
    % Prueba caracterísitca inexistente
pista(arbol_inexistente, color(turquesa)).
    % Prueba flor inexistente
pista(planta_verde, tipo(flor)).
%pista(planta_verde, altura(media)).

%Test Punto 1:
:- begin_tests(punto1).

test(es_arbusto_verdadero):- esArbusto(rose). %Prueba que "rose" sea un arbusto.

test(es_arbusto_falso, fail):- esArbusto(lily). %Prueba que "lily" no sea un arbusto.

test(floracion_primavera):- 
    florecenEnPrimavera(rose),
    florecenEnPrimavera(tulip),
    florecenEnPrimavera(orchid). %Prueba que "rose", "tulip" y "orchid" florezcan en primavera.

test(floracion_primavera_falso, fail):- 
    florecenEnPrimavera(cactus). %Prueba que "cactus" no florezca en primavera.

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
    sistemaRiegoEspecial(rose). %Prueba de que no florece en verano.

test(atrae_insecto_rojo):- 
    atraeInsectosBeneficiosos(rose). %Prueba que "rose" atrae insectos benéficos.

test(atrae_insecto_amarillo):- 
    atraeInsectosBeneficiosos(sunflower). %Prueba que "sunflower" atrae insectos benéficos.
    atraeInsectosBeneficiosos(tulip). %Prueba que "tulip" atrae insectos benéficos.

test(no_atrae_insectos, fail):- 
    atraeInsectosBeneficiosos(fern). %Prueba que "fern" no atrae insectos benéficos.

test(consideradasAltas_correcto):-
    consideradasAltas(cactus), %Prueba de que plantas, son consideradas altas.
    consideradasAltas(bamboo),
    consideradasAltas(fern),
    consideradasAltas(ivy).

test(consideradasAltas_falso, fail):- 
    consideradasAltas(lily). %Prueba de que "lily" no es considerada alta.
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

    test("Prueba para planta correcta: sunflower"):- cumplePistasDelObservador(planta_amarillo, sunflower).

    test("Prueba inversible: rose"):- cumplePistasDelObservador(Observacion, rose).

    test("Prueba inversible: sunflower"):- cumplePistasDelObservador(Observacion, sunflower).

    test("Prueba para planta incorrecta: rose", fail):- cumplePistasDelObservador(arbol_inexistente, Planta).

    test("Prueba para flor inexistente", fail):- cumplePistasDelObservador(planta_verde, Planta).

    test("Prueba para planta incorrecta: arbol_rojo", fail):- cumplePistasDelObservador(arbol_rojo, lily).

:-end_tests(punto4).

%Test Punto 5:
:-begin_tests(punto5).

test("Prueba para flor inexistente", fail):- atraeMasVisitas(florLoto,Companera).

test("Prueba para flor inexistente", fail):- atraeMasVisitas(Planta,cala).

test("Prueba para flores inexistentes", fail):- atraeMasVisitas(florLoto,cala).

test("Prueba cantidad de pistas: 0", fail):- cantidadPistasCumplidas(cactus,0).

test("Prueba cantidad de pistas: 4"):- cantidadPistasCumplidas(rose,Cantidad), assertion(Cantidad = 4).

:-end_tests(punto5).