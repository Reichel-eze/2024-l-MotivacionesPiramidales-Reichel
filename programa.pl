% Parcial Motivaciones ¿Piramidales?

% 1) Agregar hechos para completar la información de las necesidades 
% y niveles con algunos de los ejemplos mencionados e inventando 
% nuevas necesidades e incluso niveles. Se asume que los niveles 
% son distintos y están ordenados jerárquicamente entre sí, que no
% hay niveles sin necesidades y que una misma necesidad no puede 
% estar en dos niveles a la vez.

%necesidad(Necesidad, NivelAlQuePertenece)
necesidad(respiracion, fisiologico).
necesidad(alimentacion, fisiologico).
necesidad(descanso, fisiologico).
necesidad(reproduccion, fisiologico).

necesidad(integridadFisica, seguridad).
necesidad(empleo, seguridad).
necesidad(salud, seguridad).

necesidad(amistad, social).
necesidad(afecto, social).
necesidad(intimidad, social).

necesidad(confianza, reconocimiento).
necesidad(respeto, reconocimiento).
necesidad(exito, reconocimiento).

necesidad(autorrealizacion, creatividad).

%nivelSuperior(NivelSuperior, NivelPorDebajo)       --> con esto voy formando la jerarquia de los niveles
nivelSuperior(autorrealizacion, reconocimiento).
nivelSuperior(reconocimiento, social).
nivelSuperior(social, seguridad).
nivelSuperior(seguridad, fisiologico).

% 2) Permitir averiguar la separación de niveles que hay entre dos 
% necesidades, es decir la cantidad de niveles que hay entre una y otra.
% Por ejemplo, con los ejemplos del texto de arriba, la separación 
% entre empleo y salud es 0, y la separación entre respiración y 
% confianza es 3.

separacionDeNecesidades(NecesidadA, NecesidadB, Separacion) :-
    necesidad(NecesidadA, NivelA),
    necesidad(NecesidadB, NivelB),
    separacionDeNiveles(NivelA, NivelB, Separacion).

separacionDeNiveles(Nivel, Nivel, 0).

separacionDeNiveles(NivelA, NivelB, Separacion) :-
    nivelSuperior(NivelB, NivelIntermedio),
    separacionDeNiveles(NivelA, NivelIntermedio, SeparacionIntermedia),
    Separacion is SeparacionIntermedia + 1.

% Necesidades de las personas 
% 3) Modelar las necesidades (sin satisfacer) de cada persona. 
% Recuerden leer los puntos siguientes para saber cómo se va a usar y cómo modelar esta información.
% Por ejemplo:
% - Carla necesita alimentarse, descansar y tener un empleo. 
% - Juan no necesita empleo pero busca alguien que le brinde afecto. Se anotó en la facu porque desea ser exitoso. 
% - Roberto quiere tener un millón de amigos. 
% - Manuel necesita una bandera para la liberación, no quiere más que España lo domine ¡no señor!.
% - Charly necesita alguien que lo emparche un poco y que limpie su cabeza.

% NECESIDADES SIN SATISFACER

necesita(carla, alimentacion).
necesita(carla, descansar).
necesita(carla, empleo).

necesita(juan, afecto).
necesita(juan, exito).

necesita(roberto, amistad).

necesita(manuel, libertad).

necesita(charly, afecto).

% 4) Encontrar la necesidad de mayor jerarquía de una persona. 
% En el caso de Carla, es tener un empleo.

necesidadConMayorJerarquia(Persona, NecesidadMayor) :-
    necesita(Persona, NecesidadMayor),
    forall(necesita(Persona, _), mayorNecesidad(NecesidadMayor, _)).

necesidadConMayorJerarquiaNOT(Persona, NecesidadMayor) :-
    necesita(Persona, NecesidadMayor),
    not((necesita(Persona, OtraNecesidad), mayorNecesidad(OtraNecesidad, NecesidadMayor))).
    
mayorNecesidad(NecesidadMayor, NecesidadMenor) :-
    necesidad(NecesidadMayor, NivelA),
    necesidad(NecesidadMenor, NivelB),
    mayorNivel(NivelA, NivelB).

mayorNivel(NivelSuperior, NivelInferior) :-
    nivelSuperior(NivelSuperior, NivelInferior).

mayorNivel(NivelSuperior, NivelInferior) :-
    nivelSuperior(NivelSuperior, NivelIntermedio),
    mayorNivel(NivelIntermedio, NivelInferior).

% 5) Saber si una persona pudo satisfacer por completo algún nivel de la pirámide.
% Por ejemplo, Juan pudo satisfacer por completo el nivel fisiologico.




