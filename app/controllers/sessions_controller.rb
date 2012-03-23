class SessionsController < ApplicationController
  def create
    data = open("http://loginza.ru/api/authinfo?token=#{params[:token]}&id=16673&sig=#{Digest::MD5.hexdigest(params[:token] + "f4b1b30116d3f4c58c90e511c8910db9")}")
    render :json => data

  end
end
