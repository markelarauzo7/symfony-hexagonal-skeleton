<?php

declare(strict_types=1);

namespace Tests;

use Symfony\Bundle\FrameworkBundle\Test\WebTestCase;

class DummySymfonyClientTest extends WebTestCase
{
    private $client;

    public function setUp() : void
    {
        $this->client = static::createClient();
    }

    /**
     * @test
     */
    public function symfony_client_working()
    {
        $this->client->request(
            'GET',
            '/',
            [],
            [],
            [],
            null
        );

        $this->assertEquals(200, $this->client->getResponse()->getStatusCode());
    }

    /**
     * @test
     */
    public function symfony_client_working_2()
    {
        $this->client->request(
            'GET',
            '/api',
            [],
            [],
            [
                'CONTENT_TYPE' => 'application/json'
            ]
        );

        $this->assertEquals(200, $this->client->getResponse()->getStatusCode());
    }
}
