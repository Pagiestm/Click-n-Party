<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240223132533 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE alerte_disponibilite (utilisateurs_id INT NOT NULL, categories_id INT NOT NULL, actif TINYINT(1) DEFAULT NULL, date_creation VARCHAR(255) DEFAULT \'CURRENT_TIMESTAMP\' NOT NULL, INDEX IDX_55F5DEBE1E969C5 (utilisateurs_id), INDEX IDX_55F5DEBEA21214B7 (categories_id), PRIMARY KEY(utilisateurs_id, categories_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE alerte_disponibilite ADD CONSTRAINT FK_55F5DEBE1E969C5 FOREIGN KEY (utilisateurs_id) REFERENCES utilisateurs (id)');
        $this->addSql('ALTER TABLE alerte_disponibilite ADD CONSTRAINT FK_55F5DEBEA21214B7 FOREIGN KEY (categories_id) REFERENCES categories (id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE alerte_disponibilite DROP FOREIGN KEY FK_55F5DEBE1E969C5');
        $this->addSql('ALTER TABLE alerte_disponibilite DROP FOREIGN KEY FK_55F5DEBEA21214B7');
        $this->addSql('DROP TABLE alerte_disponibilite');
    }
}
