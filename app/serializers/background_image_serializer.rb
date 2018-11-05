class BackgroundImageSerializer
  include FastJsonapi::ObjectSerializer

  set_type :images
  set_id :location

  attributes :image_collection
end