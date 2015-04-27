class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
  end

  ##COCHINERO
  def get_password
    if Client.find_by email: params[:email] && Password.last != nil
      gcm = GCM.new("AIzaSyB7eYdj4HgGK_akFXpBVk109mb1_d_wQhU")
      client = Client.find_by email: params[:email]
      reg_id = [client.reg_id]
      last_pass = Password.last.password
      options = { data: {bus_password: last_pass}, collapse_key: "Contraseña"}
      response = gcm.send(reg_id, options)
      puts response.class
      if response[:status_code] == 200
        render json: {msg: "Contraseña enviada correctamente", password: last_pass, response: response}
      else
        render :json => {:error => "something went wrong", response: response}, :status => :not_found
      end
    else 
      render :json => {:error => "something went wrong"}, :status => 500
    end
  end

  def client_panic
    puts params[:email]
    puts params[:placa]
    gcm = GCM.new("AIzaSyB7eYdj4HgGK_akFXpBVk109mb1_d_wQhU")
    #registration_ids = ["APA91bHQwdJFAtAq3cZESW2tWJsAqCFpWhm8gsNeyAL9PBQ4S-0a9v7-st5DPmZoz1ZCJpRXIU7xCA6bVnNBwnTVizAjuVG_fVUtih15_DPi1cOLwpwSxYMyCJkDlcwt_pyUF38mleJi38Uj8H0zDObbRAncrf9SSg", "APA91bGOJ0R1qmd8Wm7IbE8TrTv0y8wRoVc-0lRGymVnDQimjVZjwPiNYKVqLeNjsRQUBF7rZvFSvst_GvPNq8FGIbJhCstCfN7Lyyn6HIN-olSM0qy0BaJ1og7o1W3b-2zFsaYWfNLuQyarPEviC4EnageHIxIJew"]
    client = Client.find_by email: params[:email]
    chofer = Bus.find_by placa: params[:placa]
    registration_ids = [chofer.reg_id]
    options = { data: {alerta: client.email}, collapse_key: "score_actualizado"}
    response = gcm.send(registration_ids, options)
    render json: response
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  # GET /clients/1/edit
  def edit
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Client was successfully created.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'Client was successfully updated.' }
        format.json { render :show, status: :ok, location: @client }
      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client.destroy
    respond_to do |format|
      format.html { redirect_to clients_url, notice: 'Client was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:email, :reg_id, :device)
    end
end
