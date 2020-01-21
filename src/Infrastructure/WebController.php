<?php

declare(strict_types=1);

namespace Project\Infrastructure;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Contracts\Translation\TranslatorInterface;

class WebController
{
    /** */
    public function indexAction(TranslatorInterface $translator)
    {
        $translated = $translator->trans('hello', ['name' => ' web visitor'], 'messages');
        
        return new Response($translated);
    }
}
