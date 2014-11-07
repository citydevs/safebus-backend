require 'gcm'
class WelcomeController < ApplicationController
  def index
  end

  def send_gcm
    gcm = GCM.new("AIzaSyB7eYdj4HgGK_akFXpBVk109mb1_d_wQhU")
    registration_ids = ["APA91bHQwdJFAtAq3cZESW2tWJsAqCFpWhm8gsNeyAL9PBQ4S-0a9v7-st5DPmZoz1ZCJpRXIU7xCA6bVnNBwnTVizAjuVG_fVUtih15_DPi1cOLwpwSxYMyCJkDlcwt_pyUF38mleJi38Uj8H0zDObbRAncrf9SSg", "APA91bGOJ0R1qmd8Wm7IbE8TrTv0y8wRoVc-0lRGymVnDQimjVZjwPiNYKVqLeNjsRQUBF7rZvFSvst_GvPNq8FGIbJhCstCfN7Lyyn6HIN-olSM0qy0BaJ1og7o1W3b-2zFsaYWfNLuQyarPEviC4EnageHIxIJew"]
    options = { data: {cosas: "AAAA!!!!!"}, collapse_key: "score_actualizado"}
    response = gcm.send(registration_ids, options)
    respond_to do |format|
      #format.html # show.html.erb
      format.json { render :json => response }
    end
  end
end
