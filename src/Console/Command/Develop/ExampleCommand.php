<?php

/**
 * @file
 * Contains \VM\Console\Develop\Example.
 */

namespace VM\Console\Command\Develop;

use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Command\Command;
use Drupal\Console\Command\Shared\CommandTrait;
use Drupal\Console\Style\DrupalStyle;

/**
 * Class ExampleCommand
 * @package VM\Console\Command\Develop
 */
class ExampleCommand extends Command
{
    use CommandTrait;

    /**
     * {@inheritdoc}
     */
    protected function configure()
    {
        $this->setName('develop:example');
    }

    /**
     * {@inheritdoc}
     */
    protected function interact(InputInterface $input, OutputInterface $output)
    {
    }

    /**
     * {@inheritdoc}
     */
    protected function execute(InputInterface $input, OutputInterface $output)
    {
        /* Register your command as a service
         *
         * Make sure you register your command class at
         * config/services/namespace.yml file and add the `console.command` tag.
         *
         * develop_example:
         *   class: VM\Console\Command\Develop\ExampleCommand
         *   tags:
         *     - { name: console.command }
         *
         * NOTE: Make the proper changes on the namespace and class
         *       according your new command.
         *
         * DrupalConsole extends the SymfonyStyle class to provide
         * an standardized Output Formatting Style.
         *
         * Drupal Console provides the DrupalStyle helper class:
         */
        $io = new DrupalStyle($input, $output);
        $io->simple('This text could be Dev translatable by');
        $io->simple('adding a YAML file at "config/translations/LANGUAGE/command.name.yml"');

        /**
         *  Reading user input argument
         *  $input->getArgument('ARGUMENT_NAME');
         *
         *  Reading user input option
         *  $input->getOption('OPTION_NAME');
         */
    }
}