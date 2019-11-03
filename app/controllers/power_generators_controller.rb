# frozen_string_literal: true

class PowerGeneratorsController < ApplicationController
  def index
    @power_generators = PowerGenerator.all
    @power_generators = PowerGenerator.order(params[:filter_power_generators]).search_for(params[:keyword]) if params[:keyword].present?
    @power_generators = advanced_query if params[:advanced_search_for_select].present?
    @power_generators = filter_power_generators(@power_generators)
    @power_generators = @power_generators.page params[:page] if @power_generators.present?
  end

  def new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def advanced_query
    return @power_generators if params[:advanced_search_for_select].blank?

    @power_generators =  @power_generators.where(manufacturer: params[:keyword_ad]) if params[:advanced_search_for_select] == 'manufacturer'
    @power_generators =  @power_generators.where(structure_type: params[:keyword_ad]) if params[:advanced_search_for_select] == 'structure_type'
    @power_generators
  end

  def show
    @power_generators = PowerGenerator.find(params[:id])
  end

  def filter_power_generators(power_generators)
    return power_generators if params[:filter_power_generators].blank?

    power_generators.order(params[:filter_power_generators])
  end

  private

  def accessible_fields
    %i[name description]
  end

  def power_generators_params
    params.require(:power_generator).permit(accessible_fields)
  end
end
