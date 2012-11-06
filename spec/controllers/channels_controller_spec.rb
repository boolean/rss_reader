require 'spec_helper'

describe ChannelsController do

  # This should return the minimal set of attributes required to create a valid
  # Channel. As you add validations to Channel, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {:url => 'http://feeds.feedburner.com/Rubyflow'}
  end

  def create_valid_channel
    channel = Channel.new(valid_attributes)
    channel.user = @user
    channel.save!
    channel
  end

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = User.create!(first_name: 'Test',
                        last_name: 'test',
                        login: 'test',
                        email: 'test@test.com',
                        password: 'testtesttest',
                        password_confirmation: 'testtesttest')

    #ser.confirm! # or set a confirmed_at inside the factory. Only necessary if you are using the confirmable module
    sign_in @user
  end

  describe "GET index" do
    it "assigns only the user channels as @channels" do
      @another_user = User.create!(first_name: 'Test',
                        last_name: 'test',
                        login: 'test1',
                        email: 'test1@test.com',
                        password: 'testtesttest',
                        password_confirmation: 'testtesttest')

      other_channel = Channel.new(valid_attributes)
      other_channel.user = @another_user
      other_channel.save

      channel = create_valid_channel
      get :index
      assigns(:channels).should eq([channel])
    end
  end

  describe "GET show" do
    it "assigns the requested channel as @channel" do
      channel = create_valid_channel
      get :show, {:id => channel.to_param}
      assigns(:channel).should eq(channel)
    end
  end

  describe "GET new" do
    it "assigns a new channel as @channel" do
      get :new
      assigns(:channel).should be_a_new(Channel)
    end
  end

  describe "GET edit" do
    it "assigns the requested channel as @channel" do
      channel = create_valid_channel
      get :edit, {:id => channel.to_param}
      assigns(:channel).should eq(channel)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Channel" do
        expect {
          post :create, {:channel => valid_attributes}
        }.to change(Channel, :count).by(1)
      end

      it "assigns a newly created channel as @channel" do
        post :create, {:channel => valid_attributes}
        assigns(:channel).should be_a(Channel)
        assigns(:channel).should be_persisted
      end

      it "redirects to the created channel" do
        post :create, {:channel => valid_attributes}
        response.should redirect_to(Channel.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved channel as @channel" do
        # Trigger the behavior that occurs when invalid params are submitted
        Channel.any_instance.stub(:save).and_return(false)
        post :create, {:channel => {}}
        assigns(:channel).should be_a_new(Channel)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Channel.any_instance.stub(:save).and_return(false)
        post :create, {:channel => {}}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested channel" do
        channel = create_valid_channel
        # Assuming there are no other channels in the database, this
        # specifies that the Channel created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Channel.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, {:id => channel.to_param, :channel => {'these' => 'params'}}
      end

      it "assigns the requested channel as @channel" do
        channel = create_valid_channel
        put :update, {:id => channel.to_param, :channel => valid_attributes}
        assigns(:channel).should eq(channel)
      end

      it "redirects to the channel" do
        channel = create_valid_channel
        put :update, {:id => channel.to_param, :channel => valid_attributes}
        response.should redirect_to(channel)
      end
    end

    describe "with invalid params" do
      it "assigns the channel as @channel" do
        channel = create_valid_channel
        # Trigger the behavior that occurs when invalid params are submitted
        Channel.any_instance.stub(:save).and_return(false)
        put :update, {:id => channel.to_param, :channel => {}}
        assigns(:channel).should eq(channel)
      end

      it "re-renders the 'edit' template" do
        channel = create_valid_channel
        # Trigger the behavior that occurs when invalid params are submitted
        Channel.any_instance.stub(:save).and_return(false)
        put :update, {:id => channel.to_param, :channel => {}}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested channel" do
      channel = create_valid_channel
      expect {
        delete :destroy, {:id => channel.to_param}
      }.to change(Channel, :count).by(-1)
    end

    it "redirects to the channels list" do
      channel = create_valid_channel
      delete :destroy, {:id => channel.to_param}
      response.should redirect_to(channels_url)
    end
  end

end
