Feature: GYM features
  
  Scenario: Gym is not signed up
    Given no gym exists with an email of "email@person.com"
    When A gym go to the "/gyms/sign_in" page
    And The gym sign in as "email@person.com", "password"
    Then The gym should be to redirect to "/gyms/sign_in"
  
  Scenario: Gym signs in successfully
    Given A gym signed up and confirmed as "username", "email@person.com", "password"
    When A gym go to the "/gyms/sign_in" page
    And The gym sign in as "email@person.com", "password"
    Then The gym should be to redirect to "/gym/home"

  Scenario: As a GYM I want to HAVE PROFILE so that I can SHOW MY NAME, SHOW MY EMAIL, SHOW MY ADDRESS
    Given A registered Gym as "username", "email@person.com", "password"
    And A gym go to the "/gym/profile" page
    Then The gym should see his features

  Scenario: As a GYM I want to HAVE A PROFILE so that I can SET MY ADDRESS
    Given A registered Gym as "username", "email@person.com", "password"
    When A gym go to the "/gym/profile" page
    And A gym click the "Change address" link
    Then The gym should be to redirect to "/gym/address"

  Scenario: As a GYM I want to ACCESS TO MY COURSES LIST so that I can DISPLAY ALL MY COURSES
    Given A registered Gym as "username", "email@person.com", "password"
    When A gym go to the "/gym/home" page
    And A gym click the "My courses" link
    Then The gym should be to redirect to "/gym/my_courses"

  Scenario: As a GYM I want to HAVE A “CREATE COURSE” FORM so that I can CREATE A COURSE
    Given A registered Gym as "username", "email@person.com", "password"
    When A gym go to the "/gym/my_courses" page
    And A gym click the "New Course" link
    Then The gym should be to redirect to "/courses/new"

  Scenario: As a GYM I want to ACCESS TO MY COURSES LIST so that I can DISPLAY ALL MY COUPONS
    Given A registered Gym as "username", "email@person.com", "password"
    When A gym go to the "/gym/home" page
    And A gym click the "My coupons" link
    Then The gym should be to redirect to "/gym/my_coupons"

  Scenario: As a GYM I want to HAVE A “CREATE COURSE” FORM so that I can CREATE A COUPONS
    Given A registered Gym as "username", "email@person.com", "password"
    When A gym go to the "/gym/my_coupons" page
    And A gym click the "New Coupon" link
    Then The gym should be to redirect to "/coupons/new"

  Scenario: As a GYM I want to ACCESS TO MY COURSES LIST so that I can DISPLAY ALL MY WORKSHEETS
    Given A registered Gym as "username", "email@person.com", "password"
    When A gym go to the "/gym/home" page
    And A gym click the "My worksheets" link
    Then The gym should be to redirect to "/gym/my_worksheets"  