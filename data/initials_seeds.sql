INSERT INTO "attribute" ("name", "desc") VALUES
    ('endurance', 'Influe sur la vie'),
    ('force', 'Influe sur les dégats physiques'),
    ('dextérité', 'Influe sur la vitesse d''attaque'),
    ('intelligence', 'Influe sur les dégats magiques'),
    ('degat_min', 'Dégat minimum qu''infligera l''arme'),
    ('degat_max', 'Dégat maximum q''infligera une arme'),
    ('niveau', 'Niveau nécessaire pour intéragir avec l''objet'),
    ('points de caractéristiques', 'Points de caractéristique disponible'),
    ('prix', 'Prix de l''objet'),
    ('soins', 'Quantité de vie rendue'),
    ('points de vie', 'Points de vie restants au personnage');

INSERT INTO "equipment_slot" ("name") VALUES
    ('casque'),
    ('armure'),
    ('bottes'),
    ('arme');

INSERT INTO "reward" ("name", "desc") VALUES
    ('reward mineur fer', 'NC'),
    ('reward mineur bronze', 'NC'),
    ('reward mineur or', 'NC'),
    ('reward mineur cobalte', 'NC'),
    ('reward pecheur grenouille', 'NC'),
    ('reward pecheur calamar', 'NC'),
    ('reward pecheur carpe dorée', 'NC'),
    ('reward mineur saumon', 'NC'),
    ('reward combat objet', 'NC'),
    ('reward combat exp', 'NC'),
    ('reward combat gold', 'NC');

INSERT INTO "level" ("name") VALUES
    ('niveau des personnages'),
    ('niveau des métiers');

INSERT INTO "level_character" ("level", "exp_req", "level_id") VALUES
    (1, 3, 1), (2, 8, 1), (3, 14, 1), (4, 23, 1), (5, 35, 1), (6, 49, 1), (7, 67, 1), (8, 88, 1), (9, 112, 1), (10, 140, 1), (11, 172, 1), (12, 208, 1), (13, 249, 1), (14, 295, 1), (15, 345, 1), (16, 401, 1), (17, 462, 1), (18, 528, 1), (19, 601, 1), (20, 680, 1), (21, 765, 1), (22, 857, 1), (23, 956, 1), (24, 1062, 1), (25, 1175, 1), (26, 1296, 1), (27, 1425, 1), (28, 1561, 1), (29, 1706, 1), (30, 1860, 1), (31, 2022, 1), (32, 2194, 1), (33, 2375, 1), (34, 2565, 1), (35, 2765, 1), (36, 2975, 1), (37, 3195, 1), (38, 3426, 1), (39, 3668, 1), (40, 3920, 1), (41, 4184, 1), (42, 4459, 1), (43, 4745, 1), (44, 5044, 1), (45, 5355, 1), (46, 5678, 1), (47, 6014, 1), (48, 6363, 1), (49, 6725, 1), (50, 7100, 1), (51, 7489, 1), (52, 7892, 1), (53, 8308, 1), (54, 8739, 1), (55, 9185, 1), (56, 9645, 1), (57, 10121, 1), (58, 10612, 1), (59, 11118, 1), (60, 11640, 1), (61, 12178, 1), (62, 12732, 1), (63, 13303, 1), (64, 13891, 1), (65, 14495, 1), (66, 15117, 1), (67, 15756, 1), (68, 16412, 1), (69, 17087, 1), (70, 17780, 1), (71, 18491, 1), (72, 19221, 1), (73, 19970, 1), (74, 20738, 1), (75, 21525, 1), (76, 22332, 1), (77, 23159, 1), (78, 24005, 1), (79, 24872, 1), (80, 25760, 1), (81, 26668, 1), (82, 27598, 1), (83, 28549, 1), (84, 29521, 1), (85, 30515, 1), (86, 31531, 1), (87, 32569, 1), (88, 33630, 1), (89, 34714, 1), (90, 35820, 1), (91, 36950, 1), (92, 38103, 1), (93, 39279, 1), (94, 40480, 1), (95, 41705, 1), (96, 42954, 1), (97, 44228, 1), (98, 45527, 1), (99, 46851, 1), (100, 48200, 1), (101, 49575, 1), (102, 50976, 1), (103, 52402, 1), (104, 53855, 1), (105, 55335, 1), (106, 56841, 1), (107, 58375, 1), (108, 59936, 1), (109, 61524, 1), (110, 63140, 1), (111, 64784, 1), (112, 66456, 1), (113, 68157, 1), (114, 69887, 1), (115, 71645, 1), (116, 73433, 1), (117, 75250, 1), (118, 77096, 1), (119, 78973, 1), (120, 80880, 1), (121, 82817, 1), (122, 84785, 1), (123, 86784, 1), (124, 88814, 1), (125, 90875, 1), (126, 92968, 1), (127, 95093, 1), (128, 97249, 1), (129, 99438, 1), (130, 101660, 1), (131, 103914, 1), (132, 106202, 1), (133, 108523, 1), (134, 110877, 1), (135, 113265, 1), (136, 115687, 1), (137, 118143, 1), (138, 120634, 1), (139, 123160, 1), (140, 125720, 1), (141, 128316, 1), (142, 130947, 1), (143, 133613, 1), (144, 136316, 1), (145, 139055, 1), (146, 141830, 1), (147, 144642, 1), (148, 147491, 1), (149, 150377, 1), (150, 153300, 1), (151, 156261, 1), (152, 159260, 1), (153, 162296, 1), (154, 165371, 1), (155, 168485, 1), (156, 171637, 1), (157, 174829, 1), (158, 178060, 1), (159, 181330, 1), (160, 184640, 1), (161, 187990, 1), (162, 191380, 1), (163, 194811, 1), (164, 198283, 1), (165, 201795, 1), (166, 205349, 1), (167, 208944, 1), (168, 212580, 1), (169, 216259, 1), (170, 219980, 1), (171, 223743, 1), (172, 227549, 1), (173, 231398, 1), (174, 235290, 1), (175, 239225, 1), (176, 243204, 1), (177, 247227, 1), (178, 251293, 1), (179, 255404, 1), (180, 259560, 1), (181, 263760, 1), (182, 268006, 1), (183, 272297, 1), (184, 276633, 1), (185, 281015, 1), (186, 285443, 1), (187, 289917, 1), (188, 294438, 1), (189, 299006, 1), (190, 303620, 1), (191, 308282, 1), (192, 312991, 1), (193, 317747, 1), (194, 322552, 1), (195, 327405, 1), (196, 332306, 1), (197, 337256, 1), (198, 342255, 1), (199, 347303, 1), (200, 352400, 1);

INSERT INTO "level_job" ("level", "exp_req", "level_id") VALUES
    (1, 3, 2), (2, 8, 2), (3, 14, 2), (4, 23, 2), (5, 35, 2), (6, 49, 2), (7, 67, 2), (8, 88, 2), (9, 112, 2), (10, 140, 2), (11, 172, 2), (12, 208, 2), (13, 249, 2), (14, 295, 2), (15, 345, 2), (16, 401, 2), (17, 462, 2), (18, 528, 2), (19, 601, 2), (20, 680, 2), (21, 765, 2), (22, 857, 2), (23, 956, 2), (24, 1062, 2), (25, 1175, 2), (26, 1296, 2), (27, 1425, 2), (28, 1561, 2), (29, 1706, 2), (30, 1860, 2), (31, 2022, 2), (32, 2194, 2), (33, 2375, 2), (34, 2565, 2), (35, 2765, 2), (36, 2975, 2), (37, 3195, 2), (38, 3426, 2), (39, 3668, 2), (40, 3920, 2), (41, 4184, 2), (42, 4459, 2), (43, 4745, 2), (44, 5044, 2), (45, 5355, 2), (46, 5678, 2), (47, 6014, 2), (48, 6363, 2), (49, 6725, 2), (50, 7100, 2), (51, 7489, 2), (52, 7892, 2), (53, 8308, 2), (54, 8739, 2), (55, 9185, 2), (56, 9645, 2), (57, 10121, 2), (58, 10612, 2), (59, 11118, 2), (60, 11640, 2), (61, 12178, 2), (62, 12732, 2), (63, 13303, 2), (64, 13891, 2), (65, 14495, 2), (66, 15117, 2), (67, 15756, 2), (68, 16412, 2), (69, 17087, 2), (70, 17780, 2), (71, 18491, 2), (72, 19221, 2), (73, 19970, 2), (74, 20738, 2), (75, 21525, 2), (76, 22332, 2), (77, 23159, 2), (78, 24005, 2), (79, 24872, 2), (80, 25760, 2), (81, 26668, 2), (82, 27598, 2), (83, 28549, 2), (84, 29521, 2), (85, 30515, 2), (86, 31531, 2), (87, 32569, 2), (88, 33630, 2), (89, 34714, 2), (90, 35820, 2), (91, 36950, 2), (92, 38103, 2), (93, 39279, 2), (94, 40480, 2), (95, 41705, 2), (96, 42954, 2), (97, 44228, 2), (98, 45527, 2), (99, 46851, 2), (100, 48200, 2), (101, 49575, 2), (102, 50976, 2), (103, 52402, 2), (104, 53855, 2), (105, 55335, 2), (106, 56841, 2), (107, 58375, 2), (108, 59936, 2), (109, 61524, 2), (110, 63140, 2), (111, 64784, 2), (112, 66456, 2), (113, 68157, 2), (114, 69887, 2), (115, 71645, 2), (116, 73433, 2), (117, 75250, 2), (118, 77096, 2), (119, 78973, 2), (120, 80880, 2), (121, 82817, 2), (122, 84785, 2), (123, 86784, 2), (124, 88814, 2), (125, 90875, 2), (126, 92968, 2), (127, 95093, 2), (128, 97249, 2), (129, 99438, 2), (130, 101660, 2), (131, 103914, 2), (132, 106202, 2), (133, 108523, 2), (134, 110877, 2), (135, 113265, 2), (136, 115687, 2), (137, 118143, 2), (138, 120634, 2), (139, 123160, 2), (140, 125720, 2), (141, 128316, 2), (142, 130947, 2), (143, 133613, 2), (144, 136316, 2), (145, 139055, 2), (146, 141830, 2), (147, 144642, 2), (148, 147491, 2), (149, 150377, 2), (150, 153300, 2), (151, 156261, 2), (152, 159260, 2), (153, 162296, 2), (154, 165371, 2), (155, 168485, 2), (156, 171637, 2), (157, 174829, 2), (158, 178060, 2), (159, 181330, 2), (160, 184640, 2), (161, 187990, 2), (162, 191380, 2), (163, 194811, 2), (164, 198283, 2), (165, 201795, 2), (166, 205349, 2), (167, 208944, 2), (168, 212580, 2), (169, 216259, 2), (170, 219980, 2), (171, 223743, 2), (172, 227549, 2), (173, 231398, 2), (174, 235290, 2), (175, 239225, 2), (176, 243204, 2), (177, 247227, 2), (178, 251293, 2), (179, 255404, 2), (180, 259560, 2), (181, 263760, 2), (182, 268006, 2), (183, 272297, 2), (184, 276633, 2), (185, 281015, 2), (186, 285443, 2), (187, 289917, 2), (188, 294438, 2), (189, 299006, 2), (190, 303620, 2), (191, 308282, 2), (192, 312991, 2), (193, 317747, 2), (194, 322552, 2), (195, 327405, 2), (196, 332306, 2), (197, 337256, 2), (198, 342255, 2), (199, 347303, 2), (200, 352400, 2); 

INSERT INTO "item_type" ("name", "desc") VALUES
    ('consommable', 'objet utilisable et qui se détruit après consommation'),
    ('ressource', 'objet necessaire à la fabrication de d''autre objet'),
    ('arme', 'augmente les dégats du personnage'),
    ('casque', 'augmente l''endurance du personnage'),
    ('armure', 'augmente l''endurance du personnage'),
    ('bottes', 'augmente la dextérité du personnage');

INSERT INTO "item" ("name", "item_type_id", "img_path", "desc") VALUES
    ('fer', 2, 'fer', 'Minerai très commun et peu cher'), ('bronze', 2, 'bronze', 'Commun, se revend bien à bas prix'), ('or', 2, 'or', 'Assez cher mais au final, plutôt fragile'), ('cobalte', 2, 'cobalte', 'Teinte bleutée très belle'), ('jade', 2, 'jade', 'Souvent utilisé pour faire des bijoux'), ('blancheroche', 2, 'blancheroche', 'Très rare, se trouve en milieu enneigé uniquement'), ('rubis', 2, 'rubis', 'Seuls les meilleurs mineurs peuvent en récupérer'), ('grenouille', 1, 'grenouille', 'Aliment basique, redonne 5PDV'), ('calamar', 1, 'calamar', 'Très mauvais, mais redonne 10PDV'), ('carpe dorée', 1, 'carpedoree', 'Beau poisson brillant, redonne 15PDV'), ('saumon', 1, 'saumon', 'Très bon, même cru, redonne 20PDV'), ('thon', 1, 'thon', 'Vous nourrira pour 2 jours ! Redonne 25PDV'), ('barracuda', 1, 'barracuda', 'Comme la chanson. Redonne 30PDV'), ('poisson globe', 1, 'poissonglobe', 'Il ne risque pas de se gonfler. Redonne 35PDV'), ('thon rouge', 1, 'thonrouge', 'Poisson favori des riches marchands. Redonne 40PDV'), ('épée de fer', 3, 'epeedefer', 'Épée fragile et très basique'), ('casque de fer', 4, 'casquedefer', 'Casque un peu rouillé'), ('armure de fer', 5, 'armuredefer', 'Armure de mauvaise facture'), ('bottes de fer', 6, 'bottesdefer', 'Bottes de débutant'), ('épée de bronze', 3, 'epeedebronze', 'Épée assez pointue mais reste fragile'), ('casque de bronze', 4, 'casquedebronze', 'Fait à la main et ça se voit'), ('armure de bronze', 5, 'armuredebronze', 'Vous protégera de quelques coups'), ('bottes de bronze', 6, 'bottesdebronze', 'Assez confortables mais peu solides'), ('épée d''or', 3, 'epeedor', 'Épée convoitée par les pillards'), ('casque d''or', 4, 'casquedor', 'Assez solide'), ('armure d''or', 5, 'armuredor', 'Aveugle les ennemis en plein soleil'), ('bottes d''or', 6, 'bottesdor', 'Très peu pratiques mais solides'), ('épée de cobalte', 3, 'epeedecobalte', 'Épée tranchante, et belle'), ('casque de cobalte', 4, 'casquedecobalte', 'Vous donne l''air d''un chevalier royal'), ('armure de cobalte', 5, 'armuredecobalte', 'Quelques défauts mais reste très solide'), ('bottes de cobalte', 6, 'bottesdecobalte', 'Bien adaptées à la course'), ('hache de jade', 3, 'hachedejade', 'Arme terrifiante'), ('casque de jade', 4, 'casquedejade', 'Cher mais efficace'), ('armure de jade', 5, 'armuredejade', 'Vous protégera efficacement'), ('bottes de jade', 6, 'bottesdejade', 'Reste discret en forêt'), ('épée en blancheroche', 3, 'epeeenblancheroche', 'Magnifique épée très tranchante'), ('casque en blancheroche', 4, 'casqueenblancheroche', 'Vous pourriez casser une roche avec ça'), ('armure en blancheroche', 5, 'armureenblancheroche', 'Résiste très bien à tous types de coups'), ('bottes en blancheroche', 6, 'bottesenblancheroche', 'Très confortables et pratiques'), ('lance de rubis', 3, 'lancederubis', 'On dit que sa couleur se prononce au fil de ses victimes'), ('casque de rubis', 4, 'casquederubis', 'Casque utilisé par les plus talentueux, ou riche'), ('armure de rubis', 5, 'armurederubis', 'Portée auparavant par un guerrier du nom de " Tony "'), ('bottes de rubis', 6, 'bottesderubis', 'Vous rend insensible. Des pieds.'); 
    
INSERT INTO "craft_plan" ("quantity", "component_id") VALUES
    (35, 1), (30, 1), (40, 1), (35, 1), (35, 2), (30, 2), (40, 2), (35, 2), (65, 3), (60, 3), (80, 3), (70, 3), (150, 4), (130, 4), (175, 4), (150, 4), (320, 5), (290, 5), (375, 5), (300, 5), (650, 6), (620, 6), (750, 6), (600, 6), (1100, 7), (1000, 7), (1250, 7), (1000, 7); 
    

INSERT INTO "craft_item" ("item_id", "craft_plan_id") VALUES
    (16, 1), (17, 2), (18, 3), (19, 4), (20, 5), (21, 6), (22, 7), (23, 8), (24, 9), (25, 10), (26, 11), (27, 12), (28, 13), (29, 14), (30, 15), (31, 16), (32, 17), (33, 18), (34, 19), (35, 20), (36, 21), (37, 22), (38, 23), (39, 24), (40, 25), (41, 26), (42, 27), (43, 28);

INSERT INTO "item_attribute" ("item_id", "value", "attribute_id") VALUES
    (1, 1, 7), (1, 1, 9), (2, 15, 7), (2, 15, 9), (3, 30, 7), (3, 30, 9), (4, 45, 7), (4, 60, 9), (5, 60, 7), (5, 80, 9), (6, 75, 7), (6, 120, 9), (7, 90, 7), (7, 200, 9), (8, 1, 7), (8, 5, 10), (8, 1, 9), (9, 15, 7), (9, 10, 10), (9, 12, 9), (10, 30, 7), (10, 15, 10), (10, 30, 9), (11, 45, 7), (11, 20, 10), (11, 45, 9), (12, 60, 7), (12, 25, 10), (12, 60, 9), (13, 75, 7), (13, 30, 10), (13, 80, 9), (14, 90, 7), (14, 35, 10), (14, 120, 9), (15, 100, 7), (15, 40, 10), (15, 150, 9), (16, 5, 3), (16, 1, 7), (16, 35, 9), (20, 10, 3), (20, 10, 7), (20, 80, 9), (24, 25, 3), (24, 25, 7), (24, 250, 9), (28, 40, 3), (28, 40, 7), (28, 1200, 9), (32, 55, 3), (32, 55, 7), (32, 4500, 9), (36, 70, 3), (36, 70, 7), (36, 8200, 9), (40, 90, 3), (40, 90, 7), (40, 15000, 9), (17, 5, 3), (17, 1, 7), (17, 30, 9), (21, 10, 3), (21, 10, 7), (21, 75, 9), (25, 25, 3), (25, 25, 7), (25, 240, 9), (29, 40, 3), (29, 40, 7), (29, 1050, 9), (33, 55, 3), (33, 55, 7), (33, 4200, 9), (37, 70, 3), (37, 70, 7), (37, 8000, 9), (41, 90, 3), (41, 90, 7), (41, 13500, 9), (18, 8, 3), (18, 1, 7), (18, 40, 9), (22, 13, 3), (22, 10, 7), (22, 90, 9), (26, 28, 3), (26, 25, 7), (26, 300, 9), (30, 45, 3), (30, 40, 7), (30, 1500, 9), (34, 70, 3), (34, 55, 7), (34, 5250, 9), (38, 90, 3), (38, 70, 7), (38, 8750, 9), (42, 145, 3), (42, 90, 7), (42, 17000, 9), (19, 5, 3), (19, 1, 7), (19, 35, 9), (23, 10, 3), (23, 10, 7), (23, 80, 9), (27, 25, 3), (27, 25, 7), (27, 250, 9), (31, 45, 3), (31, 40, 7), (31, 1200, 9), (35, 55, 3), (35, 55, 7), (35, 4500, 9), (39, 70, 3), (39, 70, 7), (39, 8000, 9), (43, 120, 3), (43, 90, 7), (43, 14000, 9);

INSERT INTO "job" ("name", "desc") VALUES
    ('mineur', 'Permet de récupérer des minerais servant de composant de craft'),
    ('pêcheur', 'Permet de récupérer des poissons servant de consommable pour récupérer de la vie');

INSERT INTO "job_reward" (value, reward_id, job_id) VALUES
    (1, 1, 1),
    (1, 2, 1),
    (1, 3, 1),
    (1, 4, 1),
    (1, 5, 2),
    (1, 6, 2),
    (1, 7, 2),
    (1, 8, 2);
    

INSERT INTO "item_reward" ("drop_rate", "reward_id", "item_id") VALUES
    (1, 1, 1),
    (1, 2, 2),
    (1, 3, 3),
    (1, 4, 4),
    (1, 5, 5),
    (1, 6, 6),
    (1, 7, 7),
    (1, 8, 8);

INSERT INTO "entity" ("name", "level", "image_url", "reward_exp", "reward_gold") VALUES
    ('Chauve-souris', 1, 'img', 1, 1), ('Corbeau', 3, 'img', 3, 3), ('Slime', 6, 'img', 7, 15), ('Ours', 10, 'img', 10, 20), ('Glacier', 15, 'img', 15, 30), ('Ange', 17, 'img', 20, 50), ('Statue antique', 21, 'img', 25, 60), ('L''oeil', 25, 'img', 30, 65), ('Goblin sombre', 30, 'img', 35, 85), ('Le noyé', 34, 'img', 40, 125), ('Brigand', 36, 'img', 45, 200), ('Amphibien', 40, 'img', 50, 120), ('Démon matriarche', 50, 'img', 55, 250), ('Golem mineur', 52, 'img', 60, 200), ('Golem matriarche', 55, 'img', 65, 300), ('Nécromant', 60, 'img', 75, 300), ('Rhino', 64, 'img', 80, 150), ('Amphibien matriarche', 68, 'img', 85, 350), ('Nordique', 69, 'img', 95, 175), ('Brigand armé', 74, 'img', 105, 400), ('Mage matriarche', 79, 'img', 115, 400), ('Mimique', 85, 'img', 130, 600), ('Oeil matriarche', 90, 'img', 150, 500), ('Roi des goblins', 100, 'img', 190, 700); 



INSERT INTO "entity_attribute" ("value", "attribute_id", "entity_id") VALUES
    (3, 1, 1), (3, 2, 1), (3, 3, 1), (25, 11, 1), (2, 1, 2), (8, 2, 2), (15, 3, 2), (50, 11, 2), (12, 1, 3), (6, 2, 3), (1, 3, 3), (120, 11, 3), (20, 1, 4), (12, 2, 4), (3, 3, 4), (200, 11, 4), (32, 1, 5), (22, 2, 5), (15, 3, 5), (320, 11, 5), (13, 1, 6), (45, 2, 6), (60, 3, 6), (250, 11, 6), (40, 1, 7), (55, 2, 7), (25, 3, 7), (400, 11, 7), (25, 1, 8), (75, 2, 8), (100, 3, 8), (400, 11, 8), (80, 1, 9), (75, 2, 9), (90, 3, 9), (450, 11, 9), (100, 1, 10), (100, 2, 10), (100, 3, 10), (475, 11, 10), (85, 1, 11), (120, 2, 11), (215, 3, 11), (550, 11, 11), (150, 1, 12), (130, 2, 12), (100, 3, 12), (700, 11, 12), (250, 1, 13), (150, 2, 13), (250, 3, 13), (750, 11, 13), (225, 1, 14), (160, 2, 14), (40, 3, 14), (1000, 11, 14), (325, 1, 15), (180, 2, 15), (20, 3, 15), (1250, 11, 15), (270, 1, 16), (300, 2, 16), (280, 3, 16), (1100, 11, 16), (300, 1, 17), (320, 2, 17), (400, 3, 17), (700, 11, 17), (245, 1, 18), (345, 2, 18), (450, 3, 18), (950, 11, 18), (340, 1, 19), (365, 2, 19), (300, 3, 19), (1400, 11, 19), (360, 1, 20), (385, 2, 20), (475, 3, 20), (1300, 11, 20), (420, 1, 21), (400, 2, 21), (250, 3, 21), (1600, 11, 21), (500, 1, 22), (500, 2, 22), (500, 3, 22), (2500, 11, 22), (475, 1, 23), (480, 2, 23), (200, 3, 23), (1800, 11, 23), (800, 1, 24), (800, 2, 24), (650, 3, 24), (4500, 11, 24);



INSERT INTO "entity_reward_item" ("entity_id", "quantity", "item_id", "drop_rate") VALUES
    (1, 5, 5, 0.99), (2, 16, 6, 0.55), (3, 1, 17, 0.01), (4, 2, 8, 1), (5, 3, 4, 0.05), (6, 56, 8, 0.5), (7, 20, 3, 0.7), (8, 12, 21, 0.88), (9, 36, 7, 0.35), (10, 2, 6, 0.77), (11, 5, 3, 0.35), (12, 3, 7, 0.62), (13, 4, 21, 0.35), (14, 3, 4, 0.58), (15, 8, 4, 0.99), (16, 10, 7, 0.21), (17, 16, 17, 0.35), (18, 13, 8, 0.70), (19, 1, 7, 0.35), (20, 3, 20, 1), (21, 13, 21, 0.9), (22, 5, 22, 0.9), (23, 8, 23, 0.9), (24, 3, 24, 0.9);


-- INSERT INTO "item_reward" ("drop_rate", "reward_id", "item_id") VALUES
--     (1, 10, 1),
--     (1, 11, 1),
--     (5, 10, 2),
--     (100, 11, 2),
--     (10, 10, 3),
--     (200, 11, 3);
-- WITH inserted_character AS (
--     INSERT INTO "character" (name, "user_id", img_path) VALUES
--         ('Kingzo', 1, '/unlien/dimage')
--         RETURNING id
-- ) 
-- , ins_char_equipement AS ( 
-- 	INSERT INTO "character_equipment" (character_id, equipment_slot_id) VALUES
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		1),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		2),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		3),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		),
-- 		4)
-- )
-- , ins_char_attribute AS (
-- 	INSERT INTO "character_attribute" ("value", "attribute_id", "character_id") VALUES
-- 		(5, 1, 
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)),
-- 		(5, 2, 
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)),
-- 		(5, 3,
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)),
-- 		(5, 4, 
-- 		 (SELECT id
-- 		 FROM inserted_character
-- 		)) 
-- )
-- , ins_char_job AS (
-- 	INSERT INTO "character_job" ("character_id", "job_id") VALUES
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		), 1),
-- 		((SELECT id
-- 		 FROM inserted_character
-- 		), 2)
-- )
-- INSERT INTO inventory ("character_id")
-- 	SELECT id
-- 	FROM inserted_character;