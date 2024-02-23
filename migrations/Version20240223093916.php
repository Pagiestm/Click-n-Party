<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240223093916 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE ajouter_en_favoris (utilisateurs_id INT NOT NULL, locations_id INT NOT NULL, date_ajout DATE NOT NULL, INDEX IDX_5425BB8F1E969C5 (utilisateurs_id), INDEX IDX_5425BB8FED775E23 (locations_id), PRIMARY KEY(utilisateurs_id, locations_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE ajouter_en_favoris ADD CONSTRAINT FK_5425BB8F1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
        $this->addSql('ALTER TABLE ajouter_en_favoris ADD CONSTRAINT FK_5425BB8FED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE ajouter_en_favoris DROP FOREIGN KEY FK_5425BB8F1E969C5');
        $this->addSql('ALTER TABLE ajouter_en_favoris DROP FOREIGN KEY FK_5425BB8FED775E23');
        $this->addSql('DROP TABLE ajouter_en_favoris');
    }
}
