yesterday('Воскресенье', 'Суббота').
yesterday('Пондельник', 'Воскресенье').
yesterday('Вторник', 'Пондельник').
yesterday('Среда', 'Вторник').
yesterday('Четверг', 'Среда').
yesterday('Пятница', 'Четверг').
yesterday('Суббота', 'Пятница').

tomorrow('Воскресенье', 'Пондельник').
tomorrow('Пондельник', 'Вторник').
tomorrow('Вторник', 'Среда').
tomorrow('Среда', 'Четверг').
tomorrow('Четверг', 'Пятница').
tomorrow('Пятница', 'Суббота').
tomorrow('Суббота', 'Воскресенье').

truthfulness_day('Пондельник','Чук',0).
truthfulness_day('Вторник','Чук',0).
truthfulness_day('Среда','Чук',0).
truthfulness_day('Четверг','Чук',1).
truthfulness_day('Пятница','Чук',1).
truthfulness_day('Суббота','Чук',1).
truthfulness_day('Воскресенье','Чук',1).
truthfulness_day('Вторник','Гек',0).
truthfulness_day('Четверг','Гек',0).
truthfulness_day('Суббота','Гек',0).
truthfulness_day('Понедельник','Гек',1).
truthfulness_day('Среда','Гек',1).
truthfulness_day('Пятница','Гек',1).
truthfulness_day('Воскресенье','Гек',1).


comment1(Speaker,1):-Speaker = 'Чук'.
comment1(Speaker,0):-Speaker \= 'Чук'.

comment2(Now,1):-yesterday(Now,'Воскресенье').
comment2(Now,0):-not(yesterday(Now,'Воскресенье')).

comment3(Now,1):-tomorrow(Now,'Пятница').
comment3(Now,0):-not(tomorrow(Now,'Пятница')).

infa_sotka_day(Buddy,Truly_Buddy):-truthfulness_day('Среда',Buddy,Truly_Buddy).

main:-
    truthfulness_day(Now,Speaker,Truly_Speaker),
    truthfulness_day(Now,Buddy,Truly_Buddy),
    comment1(Speaker,Truly_Speaker),
    comment2(Now,Truly_Speaker),
    comment3(Now,Truly_Buddy),
    infa_sotka_day(Buddy,Truly_Buddy),
    write('С кем обащался:'), write(Speaker),nl,
    write('Его приятель:'), write(Buddy),nl,
    write('Сегодня:'), write(Now),
    !.
