<?php

declare(strict_types=1);

namespace Project\Aggregate\Infrastructure;

use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class APIController
{
    public function indexAction(Request $request)
    {
        $body = 'Hello api visitor!';

        return new JsonResponse($body);
    }
}
