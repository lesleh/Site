class StaticPagesController < ApplicationController
  def view
    render params[:id]
  end
end
