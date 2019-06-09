Given("no athlete exists with an email of {string}") do |string|
    Athlete.find_by_email(string).should be_nil
end

Given("An athlete is signed up and confirmed as {string}, {string}, {string}") do |username, email, password|
    Athlete.create(username: username, email: email, password: password, password_confirmation: password)
end

Given("A registered Athlete as {string}, {string}, {string}") do |username, email, password|
    Athlete.create(username: username, email: email, password: password, password_confirmation: password)
    visit new_athlete_session_path
    fill_in 'athlete_email', :with => email
    fill_in 'athlete_password', :with => password
    click_button 'Log in'
end

When("An athlete go to the {string} page") do |page|
    visit page
end

When("The athlete sign in as {string}, {string}") do |email, password|
    fill_in 'athlete_email', :with => email
    fill_in 'athlete_password', :with => password
    click_button 'Log in'
end

When("An athlete click the {string} link") do |link|
    if link=="Change my body features" || link=="My gyms" || link=="My courses" || link=="My coupons" || link=="My worksheets"
        within("div#link") do
            click_link link
        end
    else click_link link 
    end
end

When("The athlete {string} have a {string}") do |email, string|
    @athlete = Athlete.find_by_email(email)
    @gym = Gym.create(username: "Gym1", email: "test@test.com", password: "password", password_confirmation: "password")
    if string == "gym"
        @athlete.gyms.push(@gym)
    elsif string == "course"
        @course = Course.create(name: "Course1", gym_id: @gym.id)
        @athlete.courses.push(@course)
    elsif string == "coupon"
        @coupon = Coupon.create(code: "Coupon1", name: "test1", gym_id: @gym.id)
        @athlete.coupons.push(@coupon)
    end
end

When("An {string} go to the course+id page") do |email|
    @athlete = Athlete.find_by_email(email)
    @course = Course.first
    if @athlete.courses.include?(@course)
        @id = @athlete.courses.first.id
    else @id = @course.id 
    end
    visit "/courses/"+@id.to_s
end

When("An {string} go to the coupon+id page") do |email|
    @athlete = Athlete.find_by_email(email)
    @coupon = Coupon.create(code: "test1", name: "test1", gym_id: @gym.id)
    @id = @coupon.id 
    visit "/coupons/"+@id.to_s
end
  
When("An {string} go to the gym+id page") do |email|
    @athlete = Athlete.find_by_email(email)
    @gym = Gym.first
    if @athlete.gyms.include?(@gym)
        @id = @athlete.gyms.first.id
    else @id = @gym.id
    end
    visit "/gyms/"+@id.to_s
end

When("The athlete haven't a {string}") do |string|
    @gym = Gym.create(username: "Gym1", email: "test@test.com", password: "password", password_confirmation: "password")
    if string == "gym"
       @gym
    elsif string == "course"
        Course.create(name: "Course1", gym_id: @gym.id)
    elsif string == "coupon"
        Coupon.create(code: "Coupon1", name: "test1", gym_id: @gym.id)
    end
end

Then("The athlete should be to redirect to {string}") do |page|
    expect(current_path).to eql page
end
  
Then("The athlete should see his features") do
    within("div#features") do
        true
    end
end 

Then("The athlete should be able to remove the {string}") do |string|
    if string == "gym"
        expect(current_path).to eql athlete_my_gyms_path
        click_link("Leave");
    elsif string == "course"
        expect(current_path).to eql athlete_my_courses_path
        click_link("Leave");
    elsif string == "coupon"
        expect(current_path).to eql athlete_my_coupons_path
        click_link("Leave");
    end
end

Then("The athlete should be able to show a {string}") do |string|
    if string == "gym"
        expect(current_path).to eql gyms_path
        click_link("Show");
    elsif string == "course"
        expect(current_path).to eql courses_path
        click_link("Show");
    elsif string == "coupon"
        expect(current_path).to eql coupons_path
        click_link("Show");
    end
end

Then("The athlete should be able to review a {string}") do |string|
    if string == "gym"
        expect(current_path).to eql "/gym_reviews/new"
    elsif string == "course"
        expect(current_path).to eql "/course_comments/new"
    end
end

Then("The athlete should be able to require a worksheet") do
    expect(current_path).to eql "/worksheets/new"
end


Then("The athlete should be able to join a {string}") do |string|
    if string == "gym"
        click_link("Join");
    elsif string == "course"
        click_link("Join");
    elsif string == "coupon"
        click_link("Join");
    end
end