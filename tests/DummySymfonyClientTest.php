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
        $body = [
            'this is a test'
        ];

        $this->client->request(
            'POST',
            '/api',
            [],
            [],
            [
                'CONTENT_TYPE' => 'application/json'
            ],
            json_encode($body)
        );

        $data = json_decode($this->client->getResponse()->getContent(), true);
        
        $this->assertEquals(JSON_ERROR_NONE, json_last_error());
        $this->assertEquals(200, $this->client->getResponse()->getStatusCode());
    }
}
