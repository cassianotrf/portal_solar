class FreightsController < ApplicationController
  def index
    @freight = Freight.all
  end

  def new
    power_generator = PowerGenerator.find(params[:id])
    params[:address] = HTTParty.get("http://apps.widenet.com.br/busca-cep/api/cep/#{params[:zipcode]}.json")
  end

  def create
    power_generator = PowerGenerator.find(params[:freight][:power_generator_id])
    @frete = Freight.new
  end

  private

  def accessible_fields
    %i[state weight_min weight_max cost]
  end

  def consulta_detalhes_params
    params.require(:power_generator).permit(accessible_fields)
  end
end
