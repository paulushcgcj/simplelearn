Feature: Font review

  This is a case where I review every single font type being used and the size

  Scenario: Review font on submission list
    Given I visit "/dashboard"
    Then I can read "Client Management System"
    And I can verify that the "Client name" is "bold" and has a "font size" of "12px"
    And All fonts on screen use the "BC Sans" font