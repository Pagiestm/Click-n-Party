<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240223110743 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE commenter (utilisateurs_id INT NOT NULL, locations_id INT NOT NULL, avis VARCHAR(255) NOT NULL, note_proprietaires INT DEFAULT NULL, note_loueur INT DEFAULT NULL, INDEX IDX_AB751D0A1E969C5 (utilisateurs_id), INDEX IDX_AB751D0AED775E23 (locations_id), PRIMARY KEY(utilisateurs_id, locations_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE commenter ADD CONSTRAINT FK_AB751D0A1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
        $this->addSql('ALTER TABLE commenter ADD CONSTRAINT FK_AB751D0AED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id)');
        $this->addSql('ALTER TABLE locations ADD date_fin_disponibilite DATE NOT NULL, CHANGE date_disponibilite date_debut_disponibilite DATE NOT NULL, CHANGE disponible actif TINYINT(1) NOT NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE commenter DROP FOREIGN KEY FK_AB751D0A1E969C5');
        $this->addSql('ALTER TABLE commenter DROP FOREIGN KEY FK_AB751D0AED775E23');
        $this->addSql('DROP TABLE commenter');
        $this->addSql('ALTER TABLE locations ADD date_disponibilite DATE NOT NULL, DROP date_debut_disponibilite, DROP date_fin_disponibilite, CHANGE actif disponible TINYINT(1) NOT NULL');
    }
}
