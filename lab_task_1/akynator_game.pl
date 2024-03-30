genre(Witcher_3,3)
genre(Elder_scrolls_5,3)
genre(Battlefield_4,1)
genre(World_of_warcraft,3)
genre(Grand_Theft_Auto_5, 1)
genre(League_of_legends, 5)
genre(Dota_2, 5)
genre(We_were_here,6)
genre(Dark_Souls_3,3)
genre(Elden_ring, 3)
genre(Hollow_knight, 4)
genre(Katana_zero,4)
genre(Call_Of_duty_Modern_warfare, 1)
genre(The_binding_of_isaac,7)
genre(Counter_strike_global_offensive,1)
genre(doom_eternal,1)
genre(Frostpunk,2)
genre(Civilization_6,2)
genre(PUBG,1)
genre(Sekiro_shadows_die_twice,3)
genre(Rainbow_six_siege,1)
genre(Warframe,1)
genre(Enter_the_gungeon,6)

online(Witcher_3,2)
online(Elder_scrolls_5,2)
online(World_of_warcraft,1)
online(Grand_Theft_Auto_5, 1)
online(League_of_legends, 1)
online(Dota_2, 1)
online(We_were_here,1)
online(Dark_Souls_3,2)
online(Elden_ring, 2)
online(Hollow_knight, 2)
online(Katana_zero,2)
online(Call_Of_duty_Modern_warfare, 1)
online(The_binding_of_isaac,2)
online(Counter_strike_global_offensive,1)
online(doom_eternal,2)
online(Frostpunk,2)
online(Civilization_6,1)
online(PUBG,1)
online(Sekiro_shadows_die_twice,2)
online(Rainbow_six_siege,1)
online(Warframe,1)
online(Enter_the_gungeon,2)

studio_size(Witcher_3,1)
studio_size(Elder_scrolls_5,1)
studio_size(World_of_warcraft,1)
studio_size(Grand_Theft_Auto_5, 1)
studio_size(League_of_legends, 1)
studio_size(Dota_2, 1)
studio_size(We_were_here,2)
studio_size(Dark_Souls_3,1)
studio_size(Elden_ring, 1)
studio_size(Hollow_knight, 2)
studio_size(Katana_zero,2)
studio_size(Call_Of_duty_Modern_warfare, 1)
studio_size(The_binding_of_isaac,2)
studio_size(Counter_strike_global_offensive,1)
studio_size(doom_eternal,1)
studio_size(Frostpunk,2)
studio_size(Civilization_6,1)
studio_size(PUBG,1)
studio_size(Sekiro_shadows_die_twice,1)
studio_size(Rainbow_six_siege,1)
studio_size(Warframe,1)
studio_size(Enter_the_gungeon,2)

develop_date(Witcher_3,1)
develop_date(Elder_scrolls_5,1)
develop_date(World_of_warcraft,1)
develop_date(Grand_Theft_Auto_5, 1)
develop_date(League_of_legends, 1)
develop_date(Dota_2, 1)
develop_date(We_were_here,1)
develop_date(Dark_Souls_3,1)
develop_date(Elden_ring, 2)
develop_date(Hollow_knight, 2)
develop_date(Katana_zero,2)
develop_date(Call_Of_duty_Modern_warfare, 1)
develop_date(The_binding_of_isaac,2)
develop_date(Counter_strike_global_offensive,1)
develop_date(doom_eternal, 2)
develop_date(Frostpunk, 2)
develop_date(Civilization_6,1)
develop_date(PUBG,1)
develop_date(Sekiro_shadows_die_twice,2)
develop_date(Rainbow_six_siege,1)
develop_date(Warframe,1)
develop_date(Enter_the_gungeon,1)

difficulty(Witcher_3,2)
difficulty(Elder_scrolls_5,2)
difficulty(World_of_warcraft,4)
difficulty(Grand_Theft_Auto_5, 4)
difficulty(League_of_legends, 4)
difficulty(Dota_2, 4)
difficulty(We_were_here,1)
difficulty(Dark_Souls_3,3)   
difficulty(Elden_ring, 3)
difficulty(Hollow_knight, 3)
difficulty(Katana_zero,2)
difficulty(Call_Of_duty_Modern_warfare, 4)
difficulty(The_binding_of_isaac,3)
difficulty(Counter_strike_global_offensive,4)
difficulty(doom_eternal, 2)
difficulty(Frostpunk, 2)
difficulty(Civilization_6,1)
difficulty(PUBG,4)
difficulty(Sekiro_shadows_die_twice,3)
difficulty(Rainbow_six_siege,4)
difficulty(Warframe,1)
difficulty(Enter_the_gungeon,2)

question1(Ans1) :- write("What's your game genre?"),nl
                write("1) Shooter"),nl
                write("2) Strategy"),nl
                write("3) RPG"),nl
                write("4) Platformer"),nl
                write("5) Moba"),nl
                write("6) Puzzle"),nl
                write("7) Roguelike"),nl
                read(Ans1)

question2(Ans2) :- write("Does your game is online game?"),nl
                write("1) Yes"),nl
                write("2) No"),nl
                read(Ans2)

question3(Ans3) :- write("Is your game developed by big studio?"),nl
                write("1) Yes"),nl
                write("2) No"),nl
                read(Ans3)

question4(Ans4) :- write("Was your game developed before 2017?"),nl
                write("1) Yes"),nl
                write("2) No"),nl
                read(Ans4)   

question5(Ans5) :- write("What's difficulty of your game?"),nl
                write("1) Easy"),nl
                write("2) Normal"),nl
                write("3) Hard"),nl
                write("4) Game doesn't have difficulty"),nl
                read(Ans5)

akynator() :- question1(Ans1), question2(Ans2), question3(Ans3)
            question5(Ans5), question5(Ans5),
            genre(res,Ans1), online(res,Ans2), studio_size(res,Ans3),
            develop_date(res,Ans4), difficulty(res,Ans5),
            write(res)