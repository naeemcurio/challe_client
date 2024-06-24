<?php

namespace App\Console\Commands;

use Illuminate\Console\GeneratorCommand;

class CreateService extends GeneratorCommand
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'make:service {name}';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Create a new Service File';

    protected $type = 'Service';


    protected function getStub(){
        return base_path('stubs/service.stub');
    }


    protected function getDefaultNamespace($rootNamespace){
        return $rootNamespace .'\Services' ;
    }

    protected function replaceClass($stub, $name){
        $class = str_replace($this->getNamespace($name).'\\', '', $name);
        $namespace = $this->getNamespace($name);

        str_replace('{{namespace}}',$namespace,$stub);

        return str_replace('{{class}}', $class, $stub);
    }
}
