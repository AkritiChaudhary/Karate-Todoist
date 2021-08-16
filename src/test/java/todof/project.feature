Feature: Project Operations

Background:
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer 7bd08b817f0ea0ee6d45ca00e8b1300655feafa0' }

Scenario: Create new Project 
    Given path 'projects' 
    And request
    """
    {
    "name": "Shopping List"
    }
    """
    When method POST
    Then status 200
    * def projectId = response.id

    Given path 'projects/'+projectId
    When method get
    Then status 200  
 
Scenario: Get the Project 
    Given path 'projects/2271377339' 
    When method GET
    Then status 200   
    Then match response == "#object"
    Then match response.name == "Shopping List" 

Scenario: Update the project
    Given path "projects/2271377339"
    And request
    """
    {"name": "Get These Things Today"}
    """
    When method POST
    Then status 204 
    Then match response.name == "Get These Things Today"  
    

    