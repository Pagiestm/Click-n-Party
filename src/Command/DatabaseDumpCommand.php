<?php

namespace App\Command;

use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Process\Process;
use Symfony\Component\HttpKernel\KernelInterface;

class DatabaseDumpCommand extends Command
{
    protected static $defaultName = 'app:database:dump';

    private $projectDir;

    public function __construct(KernelInterface $kernel)
    {
        $this->projectDir = $kernel->getProjectDir();

        parent::__construct();
    }

    protected function configure()
    {
        $this
            ->setDescription('Création d\'un dump de la Base de données')
            ->setHelp('Cette commande permet de créé un dump de la Base de données...');
    }

    protected function execute(InputInterface $input, OutputInterface $output)
    {
        $dumpPath = $this->projectDir . '/dump/dump.sql';

        $process = Process::fromShellCommandline(sprintf(
            '"C:\wamp64\bin\mysql\mysql8.2.0\bin\mysqldump" -u%s -p%s %s > %s',
            'root',
            '',
            'click-n-party',
            $dumpPath
        ));

        $process->run();

        if (!$process->isSuccessful()) {
            $output->writeln('<error>Erreur lors de la création du dump de base de données</error>');
            $output->writeln('<error>' . $process->getErrorOutput() . '</error>');
            return Command::FAILURE;
        }

        $output->writeln('<info>Dump de la Base de Données créé avec succès !</info>');
        return Command::SUCCESS;
    }
}
