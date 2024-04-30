<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240426210224 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE reserver DROP FOREIGN KEY FK_B9765E93ED775E23');
        $this->addSql('ALTER TABLE reserver CHANGE locations_id locations_id INT DEFAULT NULL');
        $this->addSql('ALTER TABLE reserver ADD CONSTRAINT FK_B9765E93ED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id) ON DELETE SET NULL');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE reserver DROP FOREIGN KEY FK_B9765E93ED775E23');
        $this->addSql('ALTER TABLE reserver CHANGE locations_id locations_id INT NOT NULL');
        $this->addSql('ALTER TABLE reserver ADD CONSTRAINT FK_B9765E93ED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id) ON UPDATE NO ACTION ON DELETE NO ACTION');
    }
}
