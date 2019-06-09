Feature: ATHLETE features
  
  Scenario: As an UNREGISTERED USER I want to DISPLAY THE GUEST PAGE
    Given no athlete exists with an email of "email@person.com"
    When An athlete go to the "/" page
    And An athlete click the "Get Start!" link
    Then The athlete should be to redirect to "/guest"
  
  Scenario: Athlete is not signed up
    Given no athlete exists with an email of "email@person.com"
    When An athlete go to the "/athletes/sign_in" page
    And The athlete sign in as "email@person.com", "password"
    Then The athlete should be to redirect to "/athletes/sign_in"
  
  Scenario: Athlete signs in successfully
    Given An athlete is signed up and confirmed as "username", "email@person.com", "password"
    When An athlete go to the "/athletes/sign_in" page
    And The athlete sign in as "email@person.com", "password"
    Then The athlete should be to redirect to "/athlete/home"

  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can SHOW MY NAME, 
            SHOW MY EMAIL, SHOW MY BODY CHARACTERISTICS
    Given A registered Athlete as "username", "email@person.com", "password"
    When An athlete go to the "/athlete/profile" page
    Then The athlete should see his features

  Scenario: As aN ATHLETE I want to HAVE A PROFILE so that I can SET MY BODY FEATURES
    Given A registered Athlete as "username", "email@person.com", "password"
    When An athlete go to the "/athlete/profile" page
    And An athlete click the "Change my body features" link
    Then The athlete should be to redirect to "/athlete/settings"

  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can DISPLAY ALL MY GYMS
    Given A registered Athlete as "username", "email@person.com", "password"
    When An athlete go to the "/athlete/profile" page
    And An athlete click the "My gyms" link
    Then The athlete should be to redirect to "/athlete/my_gyms"

  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can DISPLAY ALL MY COURSES
    Given A registered Athlete as "username", "email@person.com", "password"
    When An athlete go to the "/athlete/profile" page
    And An athlete click the "My courses" link
    Then The athlete should be to redirect to "/athlete/my_courses"

  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can DISPLAY ALL MY COPONS
    Given A registered Athlete as "username", "email@person.com", "password"
    When An athlete go to the "/athlete/profile" page
    And An athlete click the "My coupons" link
    Then The athlete should be to redirect to "/athlete/my_coupons"

  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can DISPLAY ALL MY WORKSHEETS
    Given A registered Athlete as "username", "email@person.com", "password"
    When An athlete go to the "/athlete/profile" page
    And An athlete click the "My worksheets" link
    Then The athlete should be to redirect to "/athlete/my_worksheets"

  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can REMOVE A COURSE FROM MY LIST
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "course"
    And An athlete go to the "/athlete/my_courses" page
    Then The athlete should be able to remove the "course"
  
  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can REMOVE A GYM FROM MY LIST
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "gym"
    And An athlete go to the "/athlete/my_gyms" page
    Then The athlete should be able to remove the "gym"
  
  Scenario: As an ATHLETE I want to HAVE PROFILE so that I can REMOVE A COUPON FROM MY LIST
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "coupon"
    And An athlete go to the "/athlete/my_coupons" page
    Then The athlete should be able to remove the "coupon"

  Scenario: As an ATHLETE I want to ACCESS TO THE COURSES LIST so that I can SHOW A COURSE 
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "course"
    And An athlete go to the "/courses" page
    Then The athlete should be able to show a "course"
  
  Scenario: As an ATHLETE I want to ACCESS TO THE GYMS LIST so that I can SHOW A GYM 
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "gym"
    And An athlete go to the "/gyms" page
    Then The athlete should be able to show a "gym"

  Scenario: As an ATHLETE I want to ACCESS TO THE COUPONS LIST so that I can SHOW A COUPON 
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "coupon"
    And An athlete go to the "/coupons" page
    Then The athlete should be able to show a "coupon"

  Scenario: As an ATHLETE I want to ACCESS TO A SINGLE COURSE so that I can REVIEW THE COURSE
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "course"
    And An "email@person.com" go to the course+id page
    And An athlete click the "Leave a Comment" link
    Then The athlete should be able to review a "course"


  Scenario: As an ATHLETE I want to ACCESS TO A SINGLE GYM so that I can REVIEW THE GYM
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "gym"
    And An "email@person.com" go to the gym+id page
    And An athlete click the "Vote" link
    Then The athlete should be able to review a "gym"

  Scenario: As an ATHLETE I want to ACCESS TO A SINGLE GYM so that I can REQUIRE A WORKSHEET
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete "email@person.com" have a "gym"
    And An "email@person.com" go to the gym+id page
    And An athlete click the "Require Worksheet" link
    Then The athlete should be able to require a worksheet
    
  Scenario: As an ATHLETE I want to ACCESS TO A SINGLE GYM so that I can SUBSCRIBE TO THE GYM
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete haven't a "gym"
    And An "email@person.com" go to the gym+id page
    Then The athlete should be able to join a "gym"

  Scenario: As an ATHLETE I want to ACCESS TO A SINGLE COUPON so that I can SUBSCRIBE TO THE COUPON
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete haven't a "coupon"
    And An "email@person.com" go to the coupon+id page
    Then The athlete should be able to join a "coupon"

  Scenario: As an ATHLETE I want to ACCESS TO A SINGLE COURSE so that I can SUBSCRIBE TO THE COURSE
    Given A registered Athlete as "username", "email@person.com", "password"
    When The athlete haven't a "course"
    And An "email@person.com" go to the course+id page
    Then The athlete should be able to join a "course"
