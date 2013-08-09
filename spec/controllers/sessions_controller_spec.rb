require 'spec_helper'

describe SessionsController do
  render_views

  let(:session) {session[:id] = FactoryGirl.create(:user) }
  let(:user) { FactoryGirl.create(:user) }

  describe '#new' do

    it "should respond to a get request for the new path and render the sign in form" do
      get :new
      expect(response.status).to eq 200
    end

  end

  describe '#create' do

    context "when user signs in successfully" do

      before do
        post :create, user: { email: user.email, password: user.password }
      end

      it 'should be treated as current_user with a session id' do 
       expect {logged_in? == true} 
     end


     it 'redirects user to root path' do
      response.should redirect_to(root_path)
    end

    it "should have flash notice 'You. Made it.'" do
      flash[:notice].should eq 'You. Made it.'
    end

      # for integration test  - if user is a current user with a session id -
      # it should be able to
      # answer a question or 
      # post a new question

    end

    context "if user logs in unsuccesfully" do

      before do 
        current_user = nil
      end

      it 'should not be assigned a session id or treated as a current_user ' do 
       expect { logged_in? == false } 
     end
     
      # save for integration test
      # it "displays a flash alert, 'Invalid username or password'" do
      # flash[:alert].should eq nil
      # end

          # scenario "if user fails to enter valid email" do
                
          #   before do 
          #     post :create, user: { email: user.email, password: user.password }
          #   end

          #   it "displays a flash alert, 'Invalid username or password'" do
          #     flash[:alert].should have_content('Invalid username or password')
          #   end

          # end

          # integration test to write
           #  match test login path should eq new sessions path
           #  link to login path should work
           #  that the users page has_content login link


  it "should re-direct them to the login path" do
    expect(response.status).to eq 200
  end

      # for integration test - if user is a current user with a session id 
      # - it should be able to answer a question or 
      # post a new question

    end


    context "if user fails enters wrong password" do

      before do 
        post :create, user: {email: user.email, password: "als;kdjfal;skjfd"}
      end

      it "displays a flash alert, 'Invalid username or password'" do
        flash[:alert].should eq 'Invalid username or password'
      end

      it "should re-render the sessions#new page" do
        expect (response.status).to eq 200
        response.should redirect_to(login_path)
      end

    end

    context "params from sign in form" do

      it "should pass params to the user item" do
        pending
      end

    end

  end 

  describe '#destroy' do

    it 'should clear the session that corresponds with the given session id' do
      expect {session.empty?} 
    end

  end 

end
