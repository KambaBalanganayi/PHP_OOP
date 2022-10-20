DROP TABLE IF EXISTS livre;
DROP TABLE IF EXISTS auteur;

--
-- Structure de la table auteur
--
CREATE TABLE auteur (
  auteur_id      INT UNSIGNED NOT NULL AUTO_INCREMENT,
  auteur_nom     VARCHAR(255) NOT NULL,
  auteur_prenom  VARCHAR(255) NOT NULL,
  PRIMARY KEY (auteur_id)
) ENGINE=InnoDB  DEFAULT CHARSET=UTF8;

--
-- Contenu de la table auteur
--
INSERT INTO auteur VALUES( 1, 'Orwell', 'George');
INSERT INTO auteur VALUES( 2, 'Mitchell', 'Margaret');
INSERT INTO auteur VALUES( 3, 'Melville', 'Herman');
INSERT INTO auteur VALUES( 4, 'Dumas', 'Alexandre');
INSERT INTO auteur VALUES( 5, 'Marquez', 'Gabriel García');
INSERT INTO auteur VALUES( 6, 'Murakami', 'Haruki');
INSERT INTO auteur VALUES( 7, 'Camus', 'Albert');

--
-- Structure de la table livre
--
CREATE TABLE livre (
  livre_id        INT UNSIGNED      NOT NULL AUTO_INCREMENT,
  livre_titre     VARCHAR(255)      NOT NULL,
  livre_annee     SMALLINT UNSIGNED NOT NULL,
  livre_resume    TEXT              NOT NULL,
  livre_auteur_id INT UNSIGNED      NOT NULL,
  PRIMARY KEY (livre_id),
  CONSTRAINT fk_livre_auteur_id FOREIGN KEY (livre_auteur_id) REFERENCES auteur(auteur_id)
) ENGINE=InnoDB DEFAULT CHARSET=UTF8;

--
-- Contenu de la table livre
--
INSERT INTO livre (livre_id, livre_auteur_id, livre_titre, livre_annee, livre_resume) VALUES
(1, 1, '1984', 1948, "Année 1984 en Océanie. 1984 ? C'est en tout cas ce qu'il semble à Winston, qui ne saurait toutefois en jurer. Le passé a été oblitéré et réinventé, et les événements les plus récents sont susceptibles d'être modifiés. Winston est lui-même chargé de récrire les archives qui contredisent le présent et les promesses de Big Brother."),
(2, 2, 'Autant en emporte le vent',  1936, "En pleine guerre de Sécession, la ravissante et très déterminée Scarlett O'Hara voit le bel avenir qui lui était réservé à jamais ravagé. Douée d'une énergie peu commune, elle va se battre sur tous les fronts, dans la Géorgie en feu, pour sauver la terre et le domaine paternels."),
(3, 3, 'Moby Dick', 1851, "Moby Dick, c’est la monstrueuse baleine blanche, l’incarnation du Mal, cette figure de l’obsession et du double qui, des profondeurs glacées, accompagne le capitaine Achab habitué en surface aux combats titanesques des océans."),
(4, 4, 'Les 3 mousquetaires', 1844, "Aux trois gentilshommes mousquetaires Athos, Porthos et Aramis, toujours prêts à en découdre avec les gardes du Cardinal de Richelieu, s'associe le jeune gascon d'Artagnan fraîchement débarqué de sa province avec pour ambition de servir le roi Louis XIII."),
(5, 5, '100 ans de solitude', 1967, "Il y a les bouches noires des fusils qui jettent des regards de mort au colonel Aurelanio Buendia et il y a la mémoire du militaire qui, devant sa fin proche, s’élance comme un disque solaire..."),
(6, 6, 'Kafka sur le rivage', 2002, "Kafka Tamura, quinze ans, fuit sa maison de Tokyo pour échapper à la terrible prophétie que son père a prononcée contre lui. Nakata, vieil homme simple d'esprit, décide lui aussi de prendre la route, obéissant à un appel impérieux, attiré par une force qui le dépasse. Lancés dans une vaste odyssée, nos deux héros vont croiser en chemin des hommes et des chats, une mère maquerelle fantomatique et une prostituée férue de Hegel, des soldats perdus et un inquiétant colonel, des poissons tombant du ciel, et bien d'autres choses encore... Avant de voir leur destin converger inexorablement, et de découvrir leur propre vérité."),
(7, 7, "L'étranger", 1942, "Condamné à mort, Meursault. Sur une plage algérienne, il a tué un Arabe. À cause du soleil, dira-t-il, parce qu'il faisait chaud. On n'en tirera rien d'autre. Rien ne le fera plus réagir : ni l'annonce de sa condamnation, ni la mort de sa mère, ni les paroles du prêtre avant la fin."),
(8, 7, 'La peste', 1947, "Avril 194.., la peste s'installe en Algérie dans la ville d'Oran, chaque jour des cas mortels se multiplient. Pourtant la préfecture tarde à faire la déclaration de « l'état de la peste » car elle ne veut pas inquiéter l'opinion publique. Mais au bout de quelques semaines, face à l'urgence le préfet ordonne de fermer les portes de la ville...");