class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]
    
  def new
  end
    
  def create
    artist = Artist.find_by_email(params[:session][:email])
   
    if artist && artist.authenticate(params[:session][:password])
      session[:artist_id] = artist.id
      redirect_to artists_path, :notice => "Welcome, #{artist.username}!"
    else
       flash.keep[:notice]="Invalid email or password"
       render "new"
    end
  end
    
  def destroy
    session[:artist_id] = nil
    redirect_to artists_path, :notice => "Logged out!"
  end
 
end