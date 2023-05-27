class Api::V1::BlarghsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_blargh, only: [:show, :destroy]

  def index
    @blarghs = User.first.blarghs.all
    binding.pry
    render json: { blarghs: @blarghs, status: :ok }
  end

  def create
    @blargh = current_user.blarghs.build(blargh_params)

    if @blargh.save
      render json: { blargh: @blargh, status: :created }
    else
      render json: { errors: @blargh.errors, status: :unprocessable_entity }
    end
  end

  def destroy
    @blargh.destroy
    render json: { status: :no_content }
  end

  private

    def blargh_params
      params.require(:blargh).permit(:body, :author_id)
    end
end