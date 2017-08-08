def search
      if params[:search].present? && params[:search].strip != ""
         session[:aiirbnb_search] = params[:search]
      end
      
      arrResult = Array.new
      
      if session[:aiirbnb_search] && session[:aiirbnb_search] != ""
         @room_adress = Room.where(active: true).near(session[:aiirbnb_search], 5, order:'distance')
      else
         @room_adress = Room.where(active: true).all
      end
      
      @search = @room_adress.ransack(params[:q])
      @room = @search.result
      
      @arrRoom = @room.to_a
      
      if (params[:start_date] && params[:end_date] && !params[:start_date].empty? & !params[:end_date].empty?)
         start_date = Date.parse(params[:start_date])
         end_date = Date.parse(params[:end_date])
         
         @room.each do |room|
            not_available = room.reservations.where("(? <= start_date AND start_date <= ?) OR 
            (? <= end_date AND end_date <= ?) OR (start_date < ? AND ? < end_date)", start_date, end_date,
            start_date, end_date, start_date, end_date).limit(1)
            
            if not_available.length > 0
               @arrRoom.delete(room)
            end
         end
      end
   end