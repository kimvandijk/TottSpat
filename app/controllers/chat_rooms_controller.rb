class ChatRoomsController < ApplicationController
  

  # GET /chat_rooms
  # GET /chat_rooms.json
  def index
    @chat_rooms = ChatRoom.all
  end

  # GET /chat_rooms/1
  # GET /chat_rooms/1.json
  def show
     @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
      @message = Message.new
  end

  # GET /chat_rooms/new
  def new
    @chat_room = ChatRoom.new
  end

  # POST /chat_rooms
  # POST /chat_rooms.json
  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_room
      @chat_room = ChatRoom.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_room_params
      params.require(:chat_room).permit(:title)
    end
end
