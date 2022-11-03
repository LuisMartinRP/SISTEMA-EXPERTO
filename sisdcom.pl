%problema(virus).
problema(memoria).
problema(fuentedepoder).
problema(discoduro).
problema(procesador).
%problema(desconocido).

go :-write('Sistema diagnostico de problemas en PC.'), nl,
	write('Responde correctamente con si. o no.'), nl,
      	hypothesize(Problema),
      	write('El problema del pc es: '),
      	write(Problema),
      	nl,solu(Problema),
      	undo.

hypothesize(virus):-virus, !.
hypothesize(memoria):-memoria, !.
hypothesize(fuentedepoder):-fuentedepoder, !.
hypothesize(discoduro):-discoduro, !.
hypothesize(procesador):-procesador, !.
hypothesize(desconocido).

virus:-	verify('¿El antivirus y el cortafuegos de tu equipo están desactivados'),
	verify('¿Hay credenciales de acceso que no funcionan'),
	verify('¿La conexión a internet va muy lenta'),
	verify('¿Algunos programas no arrancan correctamente'),
	verify('¿Se está enviando spam desde tu equipo').

memoria:-verify('¿El PC hace varios pitidos cuando lo encendemos'),
	verify('¿El PC tarda mucho en arrancar, incluso con sistemas de almacenamiento de alta velocidad'),
	verify('¿Cuanto más tiempo lleva el PC encendido, más lento va todo'),
	verify('¿Suceden pantallazos azules'),
	verify('¿Se refleja incorrectamente la cantidad de memoria RAM').

fuentedepoder:-verify('¿El PC se apaga o reinicia sin motivo'),
	verify('¿El ventilador de la fuente hace ruidos extraños'),
	verify('¿Hay olor a quemado'),
	verify('¿El equipo no enciende'),
	verify('¿Hay excesivo calor procedente de la fuente de poder').

discoduro:-verify('¿Hay datos, archivos y carpetas corruptos'),
	verify('¿La PC se apaga mucho más lento de lo normal'),
	verify('¿Suena una especie de ''click'' cuando accedes a algunos archivos'),
	verify('¿No se cargar el Sistema Operativo'),
	verify('¿Hay sobrecalientamiento procedente del disco duro').

procesador:-verify('¿Los ventiladores están al máximo'),
	verify('¿La PC da señal de imagen'),
	verify('¿La PC se reinicia o apaga sola').		


solu(virus):-write('\nAlgunas soluciones son:\n'),
	write('Activa el software antimalware y cortafuegos en el equipo\n'),
	write('Eliminar archivos sospechosos.\n'),
	write('Si tienes problemas con alguna extensión, lo que debes hacer es simplemente eliminarla.'),
	write('Usar la función MRT de Windows').

solu(memoria):-write('\nAlgunas soluciones son:\n'),
		write('Sustituir la memoria que ha fallado.\n'),
		write('Limpiar los contactos del módulo de memoria RAM.\n'),
		write('Reballing de un módulo de RAM para sustituir los chips de memoria,\n'), 
		write('quitando los chips dañados mediante una pistola de calor y luego soldando el nuevo chip\n').

solu(fuentedepoder):-write('\nAlgunas soluciones son:\n'),
		write('Reemplazarla, ya que no son de por sí un componente reparable y difícilmente podrás conseguir algo.').

solu(discoduro):-write('\nAlgunas soluciones son:\n'),
		write('Encaso de ser fisico el problema se recomienda reemplazarlo.\n'),
		write('Si el problema es logico se puede usar un software de reparacion como: CHKDSK\n'),
		write('Otra manera de comprobar si tu disco duro tiene sectores defectuosos está también integrada en Windows.').

solu(procesador):-write('\nAlgunas soluciones son:\n'),
		write('Cambiar a un ventilador adecuado para ayudar a la refrigeración.\n'),
		write('Adquirir un nuevo procesador\n').

solu(desconocido):-write('No hay opciones.\n').

ask(Question) :-
    write('Responde a lo siguiente: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == si ; Response == y)
      ->
       assert(si(Question)) ;
       assert(no(Question)), fail).

:- dynamic si/1,no/1.

verify(S) :-
   (si(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).

undo :- retract(si(_)),fail. 
undo :- retract(no(_)),fail.
undo.
