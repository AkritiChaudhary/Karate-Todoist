Feature: Task operations

Background:
    * url baseUrl
    * configure headers = { 'Authorization': 'Bearer 7bd08b817f0ea0ee6d45ca00e8b1300655feafa0' }

Scenario: Create new label
    Given path "labels"   
    And request
    """
         {"name": "Food"}
    """
    When method Post
    Then status 200

Scenario: Update label
    Given path "labels/2157802208"
    And headers {Content-Type:'application/json'}
  
    And request
    """
        {"name": "Drinks"}
    """
    When method Post
    Then status 204     
       
Scenario: Delete label
    Given path "labels/2157802208"
    And headers {Content-Type:'application/json'}
    When method Delete
    Then status 204
    
