class Admin::GistsController < ApplicationController
  
  # GET /gists or /gists.json
  def index
    @gists = Gist.all
  end

  # GET /gists/1 or /gists/1.json
  def show
  end

  
end
