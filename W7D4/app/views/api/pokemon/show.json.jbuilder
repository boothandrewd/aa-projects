json.poke do
  json.(@pokemon, :id, :name, :attack, :defense, :moves, :poke_type)
  json.image_url asset_path(@pokemon.image_url)
end

json.items @pokemon.items do |item|
  json.extract! item, :id, :name, :pokemon_id, :price, :happiness
  json.image_url asset_path(item.image_url)
end
