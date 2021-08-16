Feature: Task operations

Background:
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer 7bd08b817f0ea0ee6d45ca00e8b1300655feafa0' }

Scenario: Get all Tasks 
    Given path 'tasks' 
    When method GET
    Then status 200   
    Then match response == "#array"
      

Scenario: Create a Task
    Given path "tasks"
    And request
    """
    {"content": "Buy Milk", "due_string": "tomorrow"}
        
    """
    When method Post
    Then status 200
    Then match response == "#object"
    Then match response.content == "Buy Milk"

Scenario: Get active Task 
    Given path 'tasks/5064701157' 
    When method GET
    Then status 200   

Scenario: Update the task
    Given path 'tasks/5064701157' 
    And request
    """
    {"content": "Buy Bread", "due_string": "tomorrow"}
        
    """
    When method POST
    Then status 204
    

Scenario: Close a Task 
    Given path 'tasks/5064701157/close' 
    When method POST
    Then status 204      

Scenario: Reopen a Task 
    Given path 'tasks/5064701157/reopen' 
    When method POST
    Then status 204          


      
