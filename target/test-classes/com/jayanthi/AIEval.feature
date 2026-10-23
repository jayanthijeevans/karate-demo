Feature: First AI Evaluation - Vijayadashami Vidyarambham

  Background:
    * url 'https://jsonplaceholder.typicode.com'

  Scenario: Check if answer contains expected keyword - Simple Eval
    # This is how we evaluate LLM - does answer contain truth?
    * def expectedKeywords = ['sunt', 'aut']
    * def aiResponse = 'sunt aut facere repellat provident occaecati'
    
    # Eval Logic: Does response contain expected fact?
    * match aiResponse contains expectedKeywords[0]
    * print 'Eval PASSED - AI answer has expected keyword'

  Scenario: Score an AI answer - Pass/Fail Rubric
    * def goldenAnswer = 'The capital of India is New Delhi'
    * def aiAnswer = 'New Delhi is the capital of India'
    
    # Simple scoring - like LLM evals in jobs
    * def score = aiAnswer.contains('New Delhi') ? 1 : 0
    * match score == 1
    * print 'Score:', score, '/ 1 - EVAL PASS'

  Scenario: Your real API with Eval Mindset
    Given path '/posts/1'
    When method get
    Then status 200
    # Now evaluate like an AI QA:
    * def responseText = response.title
    * assert responseText.length > 10
    * print 'Quality Check Passed - Title is meaningful:', responseText