class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  # GET /messages
  # GET /messages.json
  def index
    @message = Message.new
    @messages = Message.all
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_url, notice: "Message was successfully created."
    else
      redirect_to messages_url, alert: "Message was unsuccessfully created."
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:title, :body, :signature)
    end
end
