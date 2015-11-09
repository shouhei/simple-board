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

    respond_to do |format|
      if @message.save
        notice_message = 'successfully'
      else
        notice_message = 'unsuccessfully'
      end
      format.html { redirect_to messages_url, notice: "Message was #{notice_message} created." }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:title, :body, :signature)
    end
end
