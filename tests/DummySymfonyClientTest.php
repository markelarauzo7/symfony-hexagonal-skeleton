<?php

declare(strict_types=1);

namespace Tests;

use Symfony\Bundle\FrameworkBundle\KernelBrowser;
use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;
use Symfony\Component\HttpFoundation\Response;

class DummySymfonyClientTest extends WebTestCase
{
    private KernelBrowser $client;

    public function setUp(): void
    {
        $this->client = static::createClient();
    }

    /**
     * @test
     */
    public function symfonyClientWorking()
    {
        $this->client->request(
            'GET',
            '/',
            [],
            [],
            [],
            null
        );
        
        $this->assertEquals(Response::HTTP_OK, $this->client->getResponse()->getStatusCode());
    }

    /**
     * @test
     */
    public function symfonyClientWorking2()
    {
        $this->client->request(
            'GET',
            '/api',
            [],
            [],
            [
                'CONTENT_TYPE' => 'application/json',
            ]
        );

        $this->assertEquals(Response::HTTP_OK, $this->client->getResponse()->getStatusCode());
    }
}
