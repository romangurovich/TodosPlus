class MainController < ApplicationController
  def index
    gon.tasks = Task.all
  end
end
