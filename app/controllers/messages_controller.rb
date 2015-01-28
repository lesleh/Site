class MessagesController < ApplicationController
  before_action :authenticate, only: [:index, :show, :destroy]
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  before_action :set_title

  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
  end

  # GET /messages/new
  def new
    @message = Message.new
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(message_params)
    @message.ip = request.remote_ip

    respond_to do |format|
      if @message.save
        format.html { redirect_to root_path, :flash => { :success => "Message sent" } }
        format.json { render :show, status: :created, location: @message }
      else
        format.html { render :new }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html { redirect_to messages_url, :flash => { :success => "Message deleted" } }
      format.json { head :no_content }
    end
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
      params.require(:message).permit(:name, :email, :subject, :ip, :body)
    end
end
