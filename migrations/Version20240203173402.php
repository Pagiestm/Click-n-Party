<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240203173402 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE locations (id INT AUTO_INCREMENT NOT NULL, utilisateurs_id INT DEFAULT NULL, nom VARCHAR(100) NOT NULL, description VARCHAR(255) NOT NULL, image LONGTEXT NOT NULL, prix DOUBLE PRECISION NOT NULL, adresse VARCHAR(255) NOT NULL, date_disponibilite DATE NOT NULL, notes INT DEFAULT NULL, capacite_maximal INT NOT NULL, pmr TINYINT(1) NOT NULL, disponible TINYINT(1) NOT NULL, INDEX IDX_17E64ABA1E969C5 (utilisateurs_id), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE locations ADD CONSTRAINT FK_17E64ABA1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE locations DROP FOREIGN KEY FK_17E64ABA1E969C5');
        $this->addSql('DROP TABLE locations');
    }
}
