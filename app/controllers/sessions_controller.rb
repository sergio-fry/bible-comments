class SessionsController < ApplicationController
  def create
    data = open("http://loginza.ru/api/authinfo?token=#{params[:token]}&id=16673&sig=#{Digest::MD5.hexdigest(params[:token] + "f4b1b30116d3f4c58c90e511c8910db9")}").read

    data_json = JSON.parse(data)

    @user = User.find_or_create_by_identity_and_provider(data_json["identity"], data_json["provider"])
    @user.open_id_data = data_json
    @user.save

    session[:user_id] = @user.id

    redirect_to root_path
  end

  if Rails.env.to_sym == :development
    def fake
      @user = User.find_or_create_by_identity_and_provider("Fake User", "Faker")
      @user.open_id_data = { "name" => { "full_name" => "Fake User" } }
      @user.save

      session[:user_id] = @user.id
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
