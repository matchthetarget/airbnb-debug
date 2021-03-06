class RoomResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :host_id, :integer
  attribute :number_of_bedrooms, :integer
  attribute :name, :string
  attribute :description, :string
  attribute :cost_per_night, :float
  attribute :number_of_bathrooms, :string
  attribute :address, :string

  # Direct associations

  has_many   :interactions

  has_many   :lines,
             foreign_key: :location_id

  has_many   :photos

  has_many   :user_rooms

  belongs_to :host,
             resource: UserResource

  # Indirect associations

  many_to_many :guests,
               resource: UserResource

  many_to_many :users
end
