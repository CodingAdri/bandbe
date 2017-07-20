class RoomsController < ApplicationController

before_action :set_room, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
   def index
      @rooms = current_user.rooms
   end
   
   def new
      @room = current_user.rooms.build
   end
   
   def create
      @room = current_user.rooms.build(room_params)
      if @room.save
          redirect_to @room, notice: "Votre annonce a été ajoutée avec succès"
      else
         render :new
      end
   end
   
   def show
   end
 
   def edit
   end
   
   def update
       if @room.update(room_params)
           redirect_to @room, notice: "Modification enregistrée"
       else
          render :edit
       end
   end

private
   def set_room
      @rooms = Room.find(params[:id])
   end
   
   def room_params
      params.require(:room).permit(:home_type, :room_type, :accomodate, :bed_room, :bath_room,
      :listing_name, :summary, :adress, :is_wifi, :is_tv, :is_closet, :is_heating, :is_kitchen,
      :is_smoking, :is_elevator, :is_essentials, :is_skilocker, :is_pool, :is_hottub, :price, :active)
   end
   
   
end