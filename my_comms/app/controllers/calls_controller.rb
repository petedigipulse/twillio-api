class CallsController < ApplicationController
  before_action :set_call, only: [:show, :edit, :update, :destroy]

  # GET /calls
  # GET /calls.json
  def index
    @calls = Call.all
    @account_sid = 'AC17355db7790d2916f0e059ec874d62aa' 
    @auth_token = '626448ea4774753933df10fa70d779b4' 
     
    # set up a client to talk to the Twilio REST API 
    # @client = Twilio::REST::Client.new(@account_sid, @auth_token)
     
    # @call = @client.account.calls.create({ 
    #   :from => '+6421428583',
    #   :to => '+644769123',   
    #   :method => 'GET',  
    #   :fallback_method => 'GET',  
    #   :status_callback_method => 'GET',    
    #   :record => 'false'
    # })

     # This application sid will play a Welcome Message.
    @demo_app_sid = 'APabe7650f654fc34655fc81ae71caa3ff'
    @capability = Twilio::Util::Capability.new( @account_sid, @auth_token)
    @capability.allow_client_outgoing @demo_app_sid
    @token = @capability.generate
    # @erb :index, :locals => {:token => @token}  



    

  end

  # GET /calls/1
  # GET /calls/1.json
  def show
  end

  # GET /calls/new
  def new
    @call = Call.new
  end

  # GET /calls/1/edit
  def edit
  end

  # POST /calls
  # POST /calls.json
  def create
    @call = Call.new(call_params)
    
    # put your own credentials here 
    
    respond_to do |format|
      if @call.save
        format.html { redirect_to @call, notice: 'Call was successfully created.' }
        format.json { render :show, status: :created, location: @call }
      else
        format.html { render :new }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /calls/1
  # PATCH/PUT /calls/1.json
  def update
    respond_to do |format|
      if @call.update(call_params)
        format.html { redirect_to @call, notice: 'Call was successfully updated.' }
        format.json { render :show, status: :ok, location: @call }
      else
        format.html { render :edit }
        format.json { render json: @call.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /calls/1
  # DELETE /calls/1.json
  def destroy
    @call.destroy
    respond_to do |format|
      format.html { redirect_to calls_url, notice: 'Call was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call
      @call = Call.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_params
      params.require(:call).permit(:user)
    end
end
