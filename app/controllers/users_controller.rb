class UsersController < ApplicationController
 
     def show
 
        @user = User.find(params[:id])
        @room = @user.rooms
     end
 
end 