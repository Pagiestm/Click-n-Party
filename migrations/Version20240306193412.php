<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240306193412 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE images (id INT AUTO_INCREMENT NOT NULL, path LONGTEXT NOT NULL, alt VARCHAR(125) NOT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE locations ADD images_id INT NOT NULL, DROP image');
        $this->addSql('ALTER TABLE locations ADD CONSTRAINT FK_17E64ABAD44F05E5 FOREIGN KEY (images_id) REFERENCES images (id)');
        $this->addSql('CREATE INDEX IDX_17E64ABAD44F05E5 ON locations (images_id)');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE locations DROP FOREIGN KEY FK_17E64ABAD44F05E5');
        $this->addSql('DROP TABLE images');
        $this->addSql('DROP INDEX IDX_17E64ABAD44F05E5 ON locations');
        $this->addSql('ALTER TABLE locations ADD image LONGTEXT NOT NULL, DROP images_id');
    }
}
