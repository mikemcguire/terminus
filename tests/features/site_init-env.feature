Feature: Initializing environments
  In order to use Pantheon's default site environments
  As a user
  I need to be able to initialize those environments.

  @vcr site_init-env
  Scenario: Initializing the test environment
    Given I am authenticated
    And a site named "[[test_site_name]]"
    When I run "terminus site init-env --site=[[test_site_name]] --env=test"
    Then I should get "."
    Then I should get:
    """
    Deploying code to "test", and cloning files from "dev", and cloning database from "dev"
    """

  @vcr site_init-env_already-initialized
  Scenario: Should not allow re-initializing an environment
    Given I am authenticated
    And a site named "[[test_site_name]]"
    When I run "terminus site init-env --site=[[test_site_name]] --env=test"
    Then I should get:
    """
    The test environment has already been initialized
    """
