# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :set_categories

  private

  def set_categories
    @categories = Category.all
  end
end
