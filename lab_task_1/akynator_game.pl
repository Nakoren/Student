genre(witcher_3,3).
genre(elder_scrolls_5,3).
genre(battlefield_4,1).
genre(world_of_warcraft,3).
genre(grand_theft_auto_5,1).
genre(league_of_legends,5).
genre(dota_2,5).
genre(we_were_here,6).
genre(dark_Souls_3,3).
genre(elden_ring, 3).
genre(hollow_knight,4).
genre(katana_zero,4).
genre(call_of_duty_modern_warfare,1).
genre(the_binding_of_isaac,7).
genre(counter_strike_global_offensive,1).
genre(doom_eternal,1).
genre(frostpunk,2).
genre(civilization_6,2).
genre(pubg,1).
genre(sekiro_shadows_die_twice,3).
genre(rainbow_six_siege,1).
genre(warframe,1).
genre(enter_the_gungeon,7).

online(witcher_3,2).
online(elder_scrolls_5,2).
online(battlefield_4,1).
online(world_of_warcraft,1).
online(grand_theft_auto_5,2).
online(league_of_legends,1).
online(dota_2,1).
online(we_were_here,1).
online(dark_Souls_3,2).
online(elden_ring,2).
online(hollow_knight,2).
online(katana_zero,2).
online(call_of_duty_modern_warfare,1).
online(the_binding_of_isaac,2).
online(counter_strike_global_offensive,1).
online(doom_eternal,2).
online(frostpunk,2).
online(civilization_6,1).
online(pubg,1).
online(sekiro_shadows_die_twice,2).
online(rainbow_six_siege,1).
online(warframe,1).
online(enter_the_gungeon,2).

studio_size(witcher_3,1).
studio_size(elder_scrolls_5,1).
studio_size(battlefield_4,1).
studio_size(world_of_warcraft,1).
studio_size(grand_theft_auto_5,1).
studio_size(league_of_legends,1).
studio_size(dota_2,1).
studio_size(we_were_here,2).
studio_size(dark_Souls_3,1).
studio_size(elden_ring, 1).
studio_size(hollow_knight, 2).
studio_size(katana_zero,2).
studio_size(call_of_duty_modern_warfare, 1).
studio_size(the_binding_of_isaac,2).
studio_size(counter_strike_global_offensive,1).
studio_size(doom_eternal,1).
studio_size(frostpunk,2).
studio_size(civilization_6,1).
studio_size(pubg,1).
studio_size(sekiro_shadows_die_twice,1).
studio_size(rainbow_six_siege,1).
studio_size(warframe,1).
studio_size(enter_the_gungeon,2).

develop_date(witcher_3,1).
develop_date(elder_scrolls_5,1).
develop_date(battlefield_4,1).
develop_date(world_of_warcraft,1).
develop_date(grand_theft_auto_5, 1).
develop_date(league_of_legends, 1).
develop_date(dota_2, 1).
develop_date(we_were_here,1).
develop_date(dark_Souls_3,1).
develop_date(elden_ring, 2).
develop_date(hollow_knight, 2).
develop_date(katana_zero,2).
develop_date(call_of_duty_modern_warfare, 1).
develop_date(the_binding_of_isaac,2).
develop_date(counter_strike_global_offensive,1).
develop_date(doom_eternal, 2).
develop_date(frostpunk, 2).
develop_date(civilization_6,1).
develop_date(pubg,1).
develop_date(sekiro_shadows_die_twice,2).
develop_date(rainbow_six_siege,1).
develop_date(warframe,1).
develop_date(enter_the_gungeon,1).

difficulty(witcher_3,2).
difficulty(elder_scrolls_5,2).
difficulty(battlefield_4,4).
difficulty(world_of_warcraft,4).
difficulty(grand_theft_auto_5, 4).
difficulty(league_of_legends, 2).
difficulty(dota_2, 3).
difficulty(we_were_here,1).
difficulty(dark_Souls_3,3).   
difficulty(elden_ring, 3).
difficulty(hollow_knight, 3).
difficulty(katana_zero,2).
difficulty(call_of_duty_modern_warfare, 4).
difficulty(the_binding_of_isaac,3).
difficulty(counter_strike_global_offensive,4).
difficulty(doom_eternal, 2).
difficulty(frostpunk, 2).
difficulty(civilization_6,1).
difficulty(pubg,4).
difficulty(sekiro_shadows_die_twice,3).
difficulty(rainbow_six_siege,4).
difficulty(warframe,1).
difficulty(enter_the_gungeon,2).

extraQuestion(witcher_3, 1, 1).
extraQuestion(elder_scrolls_5, 1, 2).

%question1(-Ans1)
question1(Ans1) :- write("What's your game genre?"),nl,
                write("1) Shooter"),nl,
                write("2) Strategy"),nl,
                write("3) RPG"),nl,
                write("4) Platformer"),nl,
                write("5) Moba"),nl,
                write("6) Puzzle"),nl,
                write("7) Roguelike"),nl,
                read(Ans1).

%question2(-Ans2)
question2(Ans2) :- write("Does your game is online game?"),nl,
                write("1) Yes"),nl,
                write("2) No"),nl,
                read(Ans2).

%question3(-Ans3)
question3(Ans3) :- write("Is your game developed by big studio?"),nl,
                write("1) Yes"),nl,
                write("2) No"),nl,
                read(Ans3).

%question4(-Ans4)
question4(Ans4) :- write("Was your game developed before 2017?"),nl,
                write("1) Yes"),nl,
                write("2) No"),nl,
                read(Ans4).  

%question5(-Ans5)
question5(Ans5) :- write("What's difficulty of your game?"),nl,
                write("1) Easy"),nl,
                write("2) Normal"),nl,
                write("3) Hard"),nl,
                write("4) Game doesn't have difficulty"),nl,
                read(Ans5).

%extraQuestion(-AnsExtra)
extraQuestion(Res, 3, 2, 1 , 1 ,2) :- write("Was your game developed by CD Project Red?"), nl,
            write("1) Yes"), nl,
            write("2) No"), nl,
            read(AnsExtra),
            extraQuestion(Res,1,AnsExtra).

%checkSingleRes(?ResList)
checkSingleRes(ResList) :- length(ResList, Count), (Count == 1 -> 
                [Res|_] = ResList, write("Result is: "), write(Res),nl, fail;
                true
            ).

%akynator/0 - Входной предикат акинатора
akynator:- 
            question1(Ans1), 
            findall(Res, (genre(Res,Ans1)), ResList1),
            checkSingleRes(ResList1),

            question2(Ans2), 
            findall(Res, (genre(Res,Ans1), online(Res,Ans2)), ResList2),
            checkSingleRes(ResList2),

            question3(Ans3), 
            findall(Res, (genre(Res,Ans1), online(Res,Ans2), studio_size(Res,Ans3)), ResList3),
            checkSingleRes(ResList3),

            question4(Ans4),
            findall(Res, (genre(Res,Ans1), online(Res,Ans2), studio_size(Res,Ans3), develop_date(Res,Ans4)), ResList4),
            checkSingleRes(ResList4),

            question5(Ans5), 
            findall(Res, (genre(Res,Ans1), online(Res,Ans2), studio_size(Res,Ans3), develop_date(Res,Ans4), difficulty(Res,Ans5)), ResList5),
            checkSingleRes(ResList5),

            extraQuestion(Res, Ans1, Ans2, Ans3, Ans4, Ans5),
            write("Result is: "), write(Res).