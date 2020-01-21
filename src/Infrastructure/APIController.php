<?php

declare(strict_types=1);

namespace Project\Infrastructure;

use Swagger\Annotations as SWG;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;

class APIController
{

    /**
     * Responds with sent body!.
     * @SWG\Tag(name="API")
     * @SWG\Get(
     *     produces={"application/json"},
     *     @SWG\Response(
     *          response=200,
     *          description="Returns our API response!",
     *     )
     *  )
     */
    public function indexAction(Request $request)
    {
        $body = 'Hello api visitor!';

        return new JsonResponse($body);
    }
}
