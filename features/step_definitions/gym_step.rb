Given("no gym exists with an email of {string}") do |string|
    Gym.find_by_email(string).should be_nil
end

Given("A gym signed up and confirmed as {string}, {string}, {string}") do |username, email, password|
    Gym.create(username: username, email: email, password: password, password_confirmation: password)
end

Given("A registered Gym as {string}, {string}, {string}") do |username, email, password|
    Gym.create(username: username, email: email, password: password, password_confirmation: password)
    visit new_gym_session_path
    fill_in 'gym_email', :with => email
    fill_in 'gym_password', :with => password
    click_button 'Log in'
end

When("A gym go to the {string} page") do |page|
    visit page
end

When("The gym sign in as {string}, {string}") do |email, password|
    fill_in 'gym_email', :with => email
    fill_in 'gym_password', :with => password
    click_button 'Log in'
end

When("A gym click the {string} link") do |link|
    click_link link
end  

Then("The gym should be to redirect to {string}") do |string|
    expect(current_path).to eql string
end
  
Then("The gym should see his features") do
    within("div#features") do
        true
    end
end
  
  