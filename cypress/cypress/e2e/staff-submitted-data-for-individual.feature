Feature: Staff form for individual
  Scenario: Staff will submit data
    Given I click on "create client" button
    When I select "Individual" in the "Client type" dropdown
    Then I type the "first name" as "Paulo"