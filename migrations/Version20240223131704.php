<?php

declare(strict_types=1);

namespace DoctrineMigrations;

use Doctrine\DBAL\Schema\Schema;
use Doctrine\Migrations\AbstractMigration;

/**
 * Auto-generated Migration: Please modify to your needs!
 */
final class Version20240223131704 extends AbstractMigration
{
    public function getDescription(): string
    {
        return '';
    }

    public function up(Schema $schema): void
    {
        // this up() migration is auto-generated, please modify it to your needs
        $this->addSql('CREATE TABLE locations_categories (locations_id INT NOT NULL, categories_id INT NOT NULL, INDEX IDX_5256C72DED775E23 (locations_id), INDEX IDX_5256C72DA21214B7 (categories_id), PRIMARY KEY(locations_id, categories_id)) DEFAULT CHARACTER SET utf8mb4 COLLATE `utf8mb4_unicode_ci` ENGINE = InnoDB');
        $this->addSql('ALTER TABLE locations_categories ADD CONSTRAINT FK_5256C72DED775E23 FOREIGN KEY (locations_id) REFERENCES locations (id) ON DELETE CASCADE');
        $this->addSql('ALTER TABLE locations_categories ADD CONSTRAINT FK_5256C72DA21214B7 FOREIGN KEY (categories_id) REFERENCES categories (id) ON DELETE CASCADE');
    }

    public function down(Schema $schema): void
    {
        // this down() migration is auto-generated, please modify it to your needs
        $this->addSql('ALTER TABLE locations_categories DROP FOREIGN KEY FK_5256C72DED775E23');
        $this->addSql('ALTER TABLE locations_categories DROP FOREIGN KEY FK_5256C72DA21214B7');
        $this->addSql('DROP TABLE locations_categories');
    }
}
