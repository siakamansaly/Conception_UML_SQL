-- -----------------------------------------------------
-- Utilisateurs - Gestionnaire
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        1,
        'phil',
        'philippe@test.fr',
        '',
        'Doe',
        "Philippe",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`gestionnaire` (`utilisateur_id`, `fonction`)
SELECT
    `utilisateur`.`id`,
    "Chef cuisinier"
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'phil';

INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        2,
        'tom',
        'tom@test.fr',
        '',
        'Doe',
        "Thomas",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`gestionnaire` (`utilisateur_id`, `fonction`)
SELECT
    `utilisateur`.`id`,
    "Directeur"
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'tom';

INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        3,
        'siaka',
        'siaka@test.fr',
        '',
        'Doe',
        "Siaka",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`gestionnaire` (`utilisateur_id`, `fonction`)
SELECT
    `utilisateur`.`id`,
    "Gestionnaire"
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'siaka';

-- -----------------------------------------------------
-- Utilisateurs - Livreur
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        4,
        'batman',
        'batman@test.fr',
        '',
        'Wayne',
        "Bruce",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`livreur` (`utilisateur_id`)
SELECT
    `utilisateur`.`id`
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'batman';

INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        5,
        'superman',
        'superman@test.fr',
        '',
        'Kent',
        "Clark",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`livreur` (`utilisateur_id`)
SELECT
    `utilisateur`.`id`
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'superman';

INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        6,
        'spiderman',
        'spiderman@test.fr',
        '',
        'Parker',
        "Peter",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`livreur` (`utilisateur_id`)
SELECT
    `utilisateur`.`id`
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'spiderman';

-- -----------------------------------------------------
-- Utilisateurs - Client
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        7,
        'john',
        'john.doe@test.fr',
        '',
        'Doe',
        "John",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`client` (
        `utilisateur_id`,
        `adresse_facturation`,
        `complement_adresse_facturation`,
        `code_postal_facturation`,
        `ville_facturation`
    )
SELECT
    `utilisateur`.`id`,
    "1 rue du test",
    "",
    "75011",
    "PARIS"
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'john';

INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        8,
        'jane',
        'jane.doe@test.fr',
        '',
        'Doe',
        "Jane",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`client` (
        `utilisateur_id`,
        `adresse_facturation`,
        `complement_adresse_facturation`,
        `code_postal_facturation`,
        `ville_facturation`
    )
SELECT
    `utilisateur`.`id`,
    "6 avenue du test",
    "",
    "94260",
    "FRESNES"
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'jane';

INSERT INTO
    `expressfood`.`utilisateur` (
        `id`,
        `login`,
        `email`,
        `password`,
        `nom`,
        `prenom`,
        `telephone`
    )
VALUES
    (
        9,
        'paul',
        'paul.dupond@test.fr',
        '',
        'Dupond',
        "Paul",
        "0123456789"
    );

INSERT INTO
    `expressfood`.`client` (
        `utilisateur_id`,
        `adresse_facturation`,
        `complement_adresse_facturation`,
        `code_postal_facturation`,
        `ville_facturation`
    )
SELECT
    `utilisateur`.`id`,
    "3 allée du test",
    "",
    "75015",
    "PARIS"
FROM
    `expressfood`.`utilisateur`
WHERE
    `utilisateur`.`login` = 'paul';

-- -----------------------------------------------------
-- Catégorie Plat
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`categorie_plat` (`id`, `libelle_categorie_plat`)
VALUES
    (1, 'Plat'),
    (2, 'Dessert');

-- -----------------------------------------------------
-- Plat
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`plat` (
        `id`,
        `nom_plat`,
        `photo_plat`,
        `date_creation_plat`,
        `description_plat`,
        `gestionnaire_utilisateur_id`,
        `categorie_plat_id`
    )
VALUES
    (
        1,
        'Boeuf Bourguignon',
        'images/boeuf_bourguignon.png',
        NOW(),
        "Plat à base de boeuf et vin rouge",
        3,
        1
    ),
    (
        2,
        'Cassoulet',
        'images/cassoulet.png',
        NOW(),
        'Plat à base de haricot blanc et de viande',
        3,
        1
    ),
    (
        3,
        'Flan vanille',
        'images/flan_vanille.png',
        NOW(),
        'Dessert à base de vanille',
        3,
        2
    ),
    (
        4,
        'Cheesecake',
        'images/cheesecake.png',
        NOW(),
        'Dessert à base de fromage frais',
        3,
        2
    ),
    (
        5,
        'Raclette',
        'images/raclette.png',
        NOW(),
        "Fromage et charcuterie",
        3,
        1
    ),
    (
        6,
        'Penne arrabiata',
        'images/pennearrabiata.png',
        NOW(),
        'Pâte à la sauce tomate piquante',
        3,
        1
    ),
    (
        7,
        'Paris Brest',
        'images/parisbrest.png',
        NOW(),
        'choux fourrée à la crème mousseline pralinée et amandes',
        3,
        2
    ),
    (
        8,
        'Cookies',
        'images/cookies.png',
        NOW(),
        'Biscuit aux pépites de chocolat ',
        3,
        2
    );

-- -----------------------------------------------------
-- Publication Plat Du jour
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`plat_du_jour`(
        `date_publication_plat_du_jour`,
        `prix_unitaire_plat_du_jour`,
        `quantite_stock`,
        `plat_id`,
        `gestionnaire_utilisateur_id`
    )
VALUES
    (CURDATE(), 12, 150, 1, 1),
    (CURDATE(), 15, 150, 2, 2),
    (CURDATE(), 12, 150, 3, 3),
    (CURDATE(), 12, 150, 4, 3),
    (CURDATE() + interval 1 DAY, 11, 60, 1, 1),
    (CURDATE() + interval 1 DAY, 15, 80, 2, 2),
    (CURDATE() + interval 1 DAY, 12, 150, 3, 3),
    (CURDATE() + interval 1 DAY, 12, 100, 4, 3),
    (CURDATE() + interval 2 DAY, 12, 100, 5, 1),
    (CURDATE() + interval 2 DAY, 15, 150, 6, 2),
    (CURDATE() + interval 2 DAY, 12, 150, 7, 3),
    (CURDATE() + interval 2 DAY, 12, 150, 8, 3),
    (CURDATE() + interval 3 DAY, 12, 150, 1, 1),
    (CURDATE() + interval 3 DAY, 15, 150, 2, 2),
    (CURDATE() + interval 3 DAY, 12, 150, 3, 3),
    (CURDATE() + interval 3 DAY, 12, 150, 4, 3),
    (CURDATE() + interval 4 DAY, 12, 150, 5, 1),
    (CURDATE() + interval 4 DAY, 15, 150, 6, 2),
    (CURDATE() + interval 4 DAY, 12, 150, 7, 3),
    (CURDATE() + interval 4 DAY, 12, 150, 8, 3),
    (CURDATE() + interval 5 DAY, 12, 150, 1, 1),
    (CURDATE() + interval 5 DAY, 15, 150, 2, 2),
    (CURDATE() + interval 5 DAY, 12, 150, 3, 3),
    (CURDATE() + interval 5 DAY, 12, 150, 4, 3),
    (CURDATE() + interval 6 DAY, 12, 150, 5, 1),
    (CURDATE() + interval 6 DAY, 15, 150, 6, 2),
    (CURDATE() + interval 6 DAY, 12, 150, 7, 3),
    (CURDATE() + interval 6 DAY, 12, 150, 8, 3),
    (CURDATE() + interval 7 DAY, 12, 150, 1, 1),
    (CURDATE() + interval 7 DAY, 15, 150, 2, 2),
    (CURDATE() + interval 7 DAY, 12, 150, 3, 3),
    (CURDATE() + interval 7 DAY, 12, 150, 4, 3);

-- -----------------------------------------------------
-- Adresse livraison
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`adresse_livraison`(
        `id`,
        `adresse`,
        `complement_adresse`,
        `code_postal`,
        `ville`,
        `client_utilisateur_id`
    )
VALUES
    (
        1,
        '3 rue de la mâche',
        '',
        '75015',
        'PARIS',
        '7'
    ),
    (
        2,
        '2 rue de la roquette',
        'BAT A',
        '75020',
        'PARIS',
        '7'
    ),
    (3, '16 allée batavia', '', '75013', 'PARIS', '8'),
    (
        4,
        '22 boulevard iceberg',
        'BP 125',
        '75013',
        'PARIS',
        '8'
    ),
    (
        5,
        '34 rue de la laitue',
        '',
        '75010',
        'PARIS',
        '9'
    ),
    (6, '21 rue cresson', '', '75008', 'PARIS', '9');

-- -----------------------------------------------------
-- Commande
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`commande` (
        `numero_commande`,
        `date_commande`,
        `client_utilisateur_id`,
        `adresse_livraison_id`,
        `statut_commande`,
        `date_livraison`,
        `date_estimation_livraison`,
        `statut_livraison`,
        `livreur_utilisateur_id`
    )
VALUES
    (
        1,
        NOW(),
        7,
        1,
        'Payée',
        '2021-11-25 23:07:56',
        '2021-11-25 23:17:56',
        'Livré',
        4
    ),
    (
        2,
        NOW(),
        8,
        3,
        'Payée',
        NULL,
        NOW() + interval 13 MINUTE,
        'Pris en charge',
        5
    ),
    (
        3,
        NOW(),
        7,
        2,
        'Payée',
        NULL,
        NULL,
        'En attente',
        NULL
    ),
    (4, NOW(), 7, 1, NULL, NULL, NULL, NULL, NULL),
    (5, NOW(), 9, 6, NULL, NULL, NULL, NULL, NULL),
    (6, NOW(), 7, 2, NULL, NULL, NULL, NULL, NULL),
    (7, NOW(), 8, 4, NULL, NULL, NULL, NULL, NULL),
    (8, NOW(), 9, 5, NULL, NULL, NULL, NULL, NULL);

-- -----------------------------------------------------
-- Plats du jour commandés
-- -----------------------------------------------------
INSERT INTO
    `expressfood`.`plat_du_jour_commande` (
        `plat_du_jour_id`,
        `commande_numero_commande`,
        `quantite_commande`
    )
VALUES
    (1, 1, 2),
    (2, 1, 1),
    (2, 3, 1),
    (2, 4, 2),
    (3, 5, 4),
    (3, 8, 3),
    (4, 6, 6),
    (4, 7, 5);