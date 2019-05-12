#!/usr/bin/env groovy
// @TODO revise https://symfony.com/doc/current/deployment.html for prod deployments
node('PowerguneDesa') {
    try {
        
        stage('build') {
            // PHP, Composer and SQL related stuff is assumed
            // Checkout the app
            checkout scm

            // Install dependencies
            bat 'composer install'
            // Flag /Y for overwriting file
            bat 'copy /Y C:\\Automatizazioa\\php-scripts\\public_html\\.env .env'
            // Run any static asset building, if needed
            // sh "npm install && gulp --production"
        }

        stage('test') {
            // Run Unit + Integration testsuite
            bat 'vendor\\bin\\phpunit --testsuite IZFE-Unit'
            bat 'vendor\\bin\\phpunit --testsuite IZFE-Integration'
        }
        /*
        stage ('promotion') {
            timeout(time: 1, unit: 'MINUTES') {
              input 'Are you sure you want to deploy?'
            }
        }
        */  
        stage('deploy') {

            bat 'scripts\\deploy.bat developer'
            // Execute composer if new packages or versions need to be installed
            bat 'composer install'
            // Clear smarty cache
            bat 'scripts\\clearCache.bat'
        }
        
    } catch(error) {
        
        throw error
    } finally {
        // Any cleanup operations needed, whether we hit an error or not
    }
}
