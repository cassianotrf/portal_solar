class Freight < ApplicationRecord
  validates :state, :weight_min, :weight_max, :cost, presence: true
  belongs_to :power_generator

  def calc_frete(cep_destino, peso, comprimento, largura, altura)
    prices = []
    frete = Correios::Frete::Calculador.new :cep_origem => "04602-002", :cep_destino => cep_destino,
    :peso => peso, :comprimento => comprimento, :largura => largura, :altura => altura
    sedex = frete.calcular :sedex
    pac = frete.calcular :pac
    prices.push({tipo: 'sedex', valor: sedex.valor, prazo_entrega: sedex.prazo_entrega })
    prices.push({tipo: 'pac', valor: pac.valor, prazo_entrega: pac.prazo_entrega })
  end
end
