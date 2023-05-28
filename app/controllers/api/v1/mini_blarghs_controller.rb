# frozen_string_literal: true

module Api
  module V1
    class MiniBlarghsController < ApplicationController
      before_action :authenticate_user!

      def create
        @blargh = Blargh.find(params[:blargh_id])
        @mini_blargh = @blargh.mini_blarghs.build(mini_blargh_params)

        if @mini_blargh.save
          render json: { mini_blargh: @mini_blargh, status: :created }
        else
          render json: { errors: @mini_blargh.errors, status: :unprocessable_entity }
        end
      end

      def destroy
        @mini_blargh = MiniBlargh.find(params[:id])
        @mini_blargh.destroy if @mini_blargh.author_id == current_user.id
        render json: { status: :no_content }
      end

      private

      def mini_blargh_params
        params.require(:mini_blargh).permit(:body, :author_id, :blog_id)
      end
    end
  end
end
