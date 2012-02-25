@educational_stages
Feature: Educational Stages
  In order to have educational_stages on my website
  As an administrator
  I want to manage educational_stages

  Background:
    Given I am a logged in refinery user
    And I have no educational_stages

  @educational_stages-list @list
  Scenario: Educational Stages List
   Given I have educational_stages titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of educational_stages
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @educational_stages-valid @valid
  Scenario: Create Valid Educational Stage
    When I go to the list of educational_stages
    And I follow "Add New Educational Stage"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 educational_stage

  @educational_stages-invalid @invalid
  Scenario: Create Invalid Educational Stage (without name)
    When I go to the list of educational_stages
    And I follow "Add New Educational Stage"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 educational_stages

  @educational_stages-edit @edit
  Scenario: Edit Existing Educational Stage
    Given I have educational_stages titled "A name"
    When I go to the list of educational_stages
    And I follow "Edit this educational_stage" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of educational_stages
    And I should not see "A name"

  @educational_stages-duplicate @duplicate
  Scenario: Create Duplicate Educational Stage
    Given I only have educational_stages titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of educational_stages
    And I follow "Add New Educational Stage"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 educational_stages

  @educational_stages-delete @delete
  Scenario: Delete Educational Stage
    Given I only have educational_stages titled UniqueTitleOne
    When I go to the list of educational_stages
    And I follow "Remove this educational stage forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 educational_stages
 