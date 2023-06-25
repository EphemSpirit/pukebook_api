# frozen_string_literal: true

module Api
  module V1
    class BlarghsController < ApplicationController
      before_action :authenticate_user!, except: %i[index]
      before_action :set_blargh, only: %i[show destroy]

      def index
        @blarghs = User.first.blarghs.all
        render json: { blarghs: @blarghs, status: :ok }
      end

      def show
        render json: { blargh: @blargh, status: :ok }
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

      def set_blargh
        @blargh = Blargh.find(params[:id])
      end
    end
  end
end
