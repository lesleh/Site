class MessagesController < ApplicationController
  before_action :authenticate, only: [:index, :show, :destroy]
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_title
  respond_to :html, :json

  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.ip = request.remote_ip

    flash[:success] = "Message was successfully created." if @message.save
    respond_with(@message, location: root_path)
  end

  def destroy
    @message.destroy
    flash[:success] = "Message deleted"
    respond_with @message
  end

  private
    def set_title
      @page_title = "Contact"
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def message_params
      params.require(:message).permit(:name, :email, :subject, :body)
    end
end
