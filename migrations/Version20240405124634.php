<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240405124634 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE equipements (id INT AUTO_INCREMENT NOT NULL, libelle VARCHAR(100) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('CREATE TABLE equipements_locations (equipements_id INT NOT NULL, locations_id INT NOT NULL, INDEX IDX_C0AC25C7852CCFF5 (equipements_id), INDEX IDX_C0AC25C7ED775E23 (locations_id), PRIMARY KEY(equipements_id, locations_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE equipements_locations ADD CONSTRAINT FK_C0AC25C7852CCFF5 FOREIGN KEY (equipements_id) REFERENCES equipements (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE equipements_locations ADD CONSTRAINT FK_C0AC25C7ED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE equipements_locations DROP FOREIGN KEY FK_C0AC25C7852CCFF5');
        $this->addSql('ALTER TABLE equipements_locations DROP FOREIGN KEY FK_C0AC25C7ED775E23');
        $this->addSql('DROP TABLE equipements');
        $this->addSql('DROP TABLE equipements_locations');
    }
}
