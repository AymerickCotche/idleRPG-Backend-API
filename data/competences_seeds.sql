INSERT INTO "competence" ("name", "desc", "effect", "increment_effect", "effect_type", "effect_stat", "cost", "increment_cost") VALUES
	('Force surhumaine', 'Décuple (littéralement) votre force de 10% à chaque niveau', 1, 0.1, 'percentage', 'force', 50, 1.6),
	('Gonflette', 'Augmente artificiellement votre force de 30pts à chaque niveau', 30, 30, 'raw', 'force', 50, 1.4),
	('Bonne pioche', 'Vous êtes plus habile avec votre pioche. + 1 minerai à chaque récolte', 1, 1, 'raw', 'mining', 150, 2.5),
	('Meilleur appât', 'Le vieux Willy vous donne un meilleur appât. + 1 poisson à chaque récolte', 1, 1, 'raw', 'fishing', 100, 2);