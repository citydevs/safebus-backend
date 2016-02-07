require 'gcm'
class WelcomeController < ApplicationController
  def index
  end

  def send_gcm
    options = { data: {cosas: "AAAA!!!!!"}, collapse_key: "score_actualizado"}
    response = gcm.send(registration_ids, options)
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render :json => response }
    end
  end
end
