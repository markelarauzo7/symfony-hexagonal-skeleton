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
     * @SWG\Post(
     *     consumes={"application/json"},
     *     produces={"application/json"},
     *     @SWG\Response(
     *          response=200,
     *          description="Returns the body!",
     *     ),
     *      @SWG\Parameter(
     *          name="body",
     *          in="body",
     *          required=true,
     *          @SWG\Schema(
     *              @SWG\Property( property="body", type="string")
     *         )
     *     ),
     *  )
     */
    public function indexAction(Request $request)
    {
        $body = $request->get('body');

        return new JsonResponse($body);
    }
}
