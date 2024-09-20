class Student < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :teacher

  # Fields to index
  settings do
    mappings dynamic: false do
      indexes :name, type: :text
    end
  end

  # Customize the indexable fields
  def as_indexed_json(options = {})
    as_json(only: [ :name, :subject, :marks ])
  end
end
