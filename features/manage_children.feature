@children
Feature: Children
  In order to have children on my website
  As an administrator
  I want to manage children

  Background:
    Given I am a logged in refinery user
    And I have no children

  @children-list @list
  Scenario: Children List
   Given I have children titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of children
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @children-valid @valid
  Scenario: Create Valid Child
    When I go to the list of children
    And I follow "Add New Child"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 child

  @children-invalid @invalid
  Scenario: Create Invalid Child (without name)
    When I go to the list of children
    And I follow "Add New Child"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 children

  @children-edit @edit
  Scenario: Edit Existing Child
    Given I have children titled "A name"
    When I go to the list of children
    And I follow "Edit this child" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of children
    And I should not see "A name"

  @children-duplicate @duplicate
  Scenario: Create Duplicate Child
    Given I only have children titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of children
    And I follow "Add New Child"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 children

  @children-delete @delete
  Scenario: Delete Child
    Given I only have children titled UniqueTitleOne
    When I go to the list of children
    And I follow "Remove this child forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 children
 