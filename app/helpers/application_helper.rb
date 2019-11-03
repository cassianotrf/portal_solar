module ApplicationHelper
  def power_generators_for_select
    [
      ['A - Z', 'name'],
      ['Preço', 'price']
    ]
  end

  def advanced_search_for_select
    [
      ['Fabricante', 'manufacturer'],
      ['Material', 'structure_type']
    ]
  end
end
