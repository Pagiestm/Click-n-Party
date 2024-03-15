<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240311084745 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE ajouter_en_favoris (utilisateurs_id INT NOT NULL, locations_id INT NOT NULL, date_ajout DATE NOT NULL, INDEX IDX_5425BB8F1E969C5 (utilisateurs_id), INDEX IDX_5425BB8FED775E23 (locations_id), PRIMARY KEY(utilisateurs_id, locations_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE alerte_disponibilite (utilisateurs_id INT NOT NULL, categories_id INT NOT NULL, actif TINYINT(1) DEFAULT NULL, date_creation VARCHAR(255) DEFAULT \'CURRENT_TIMESTAMP\' NOT NULL, INDEX IDX_55F5DEBE1E969C5 (utilisateurs_id), INDEX IDX_55F5DEBEA21214B7 (categories_id), PRIMARY KEY(utilisateurs_id, categories_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE categories (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(100) NOT NULL, icon LONGTEXT NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE commenter (utilisateurs_id INT NOT NULL, locations_id INT NOT NULL, avis VARCHAR(255) NOT NULL, note_proprietaires INT DEFAULT NULL, note_loueur INT DEFAULT NULL, INDEX IDX_AB751D0A1E969C5 (utilisateurs_id), INDEX IDX_AB751D0AED775E23 (locations_id), PRIMARY KEY(utilisateurs_id, locations_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE images (id INT AUTO_INCREMENT NOT NULL, locations_id INT NOT NULL, nom LONGTEXT NOT NULL, INDEX IDX_E01FBE6AED775E23 (locations_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE locations (id INT AUTO_INCREMENT NOT NULL, utilisateurs_id INT DEFAULT NULL, nom VARCHAR(100) NOT NULL, description VARCHAR(255) NOT NULL, prix DOUBLE PRECISION NOT NULL, adresse VARCHAR(255) NOT NULL, date_debut_disponibilite DATE NOT NULL, date_fin_disponibilite DATE NOT NULL, capacite_maximal INT NOT NULL, pmr TINYINT(1) NOT NULL, actif TINYINT(1) NOT NULL, INDEX IDX_17E64ABA1E969C5 (utilisateurs_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE locations_categories (locations_id INT NOT NULL, categories_id INT NOT NULL, INDEX IDX_5256C72DED775E23 (locations_id), INDEX IDX_5256C72DA21214B7 (categories_id), PRIMARY KEY(locations_id, categories_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE ajouter_en_favoris ADD CONSTRAINT FK_5425BB8F1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
        $this->addSql('ALTER TABLE ajouter_en_favoris ADD CONSTRAINT FK_5425BB8FED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id)');
        $this->addSql('ALTER TABLE alerte_disponibilite ADD CONSTRAINT FK_55F5DEBE1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
        $this->addSql('ALTER TABLE alerte_disponibilite ADD CONSTRAINT FK_55F5DEBEA21214B7 FOREIGN KEY (categories_id) REFERENCES categories (id)');
        $this->addSql('ALTER TABLE commenter ADD CONSTRAINT FK_AB751D0A1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
        $this->addSql('ALTER TABLE commenter ADD CONSTRAINT FK_AB751D0AED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id)');
        $this->addSql('ALTER TABLE images ADD CONSTRAINT FK_E01FBE6AED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id)');
        $this->addSql('ALTER TABLE locations ADD CONSTRAINT FK_17E64ABA1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
        $this->addSql('ALTER TABLE locations_categories ADD CONSTRAINT FK_5256C72DED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE locations_categories ADD CONSTRAINT FK_5256C72DA21214B7 FOREIGN KEY (categories_id) REFERENCES categories (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE reserver ADD nombres_de_locataires DOUBLE PRECISION NOT NULL');
        $this->addSql('ALTER TABLE reserver ADD CONSTRAINT FK_B9765E93ED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE reserver DROP FOREIGN KEY FK_B9765E93ED775E23');
        $this->addSql('ALTER TABLE ajouter_en_favoris DROP FOREIGN KEY FK_5425BB8F1E969C5');
        $this->addSql('ALTER TABLE ajouter_en_favoris DROP FOREIGN KEY FK_5425BB8FED775E23');
        $this->addSql('ALTER TABLE alerte_disponibilite DROP FOREIGN KEY FK_55F5DEBE1E969C5');
        $this->addSql('ALTER TABLE alerte_disponibilite DROP FOREIGN KEY FK_55F5DEBEA21214B7');
        $this->addSql('ALTER TABLE commenter DROP FOREIGN KEY FK_AB751D0A1E969C5');
        $this->addSql('ALTER TABLE commenter DROP FOREIGN KEY FK_AB751D0AED775E23');
        $this->addSql('ALTER TABLE images DROP FOREIGN KEY FK_E01FBE6AED775E23');
        $this->addSql('ALTER TABLE locations DROP FOREIGN KEY FK_17E64ABA1E969C5');
        $this->addSql('ALTER TABLE locations_categories DROP FOREIGN KEY FK_5256C72DED775E23');
        $this->addSql('ALTER TABLE locations_categories DROP FOREIGN KEY FK_5256C72DA21214B7');
        $this->addSql('DROP TABLE ajouter_en_favoris');
        $this->addSql('DROP TABLE alerte_disponibilite');
        $this->addSql('DROP TABLE categories');
        $this->addSql('DROP TABLE commenter');
        $this->addSql('DROP TABLE images');
        $this->addSql('DROP TABLE locations');
        $this->addSql('DROP TABLE locations_categories');
        $this->addSql('ALTER TABLE reserver DROP nombres_de_locataires');
    }
}
