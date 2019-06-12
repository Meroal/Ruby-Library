module FatZebra
  ##
  # == FatZebra \Card
  #
  # Manage credit card for the API
  #
  # * find
  # * save
  #
  class Card < APIResource
    @resource_name = 'credit_cards'

    include FatZebra::APIOperation::Save
    include FatZebra::APIOperation::Find

    validates :card_holder, required: { unless: %i[wallet] }, on: :create
    validates :card_number, required: { unless: %i[wallet] }, on: :create
    validates :card_expiry, required: { unless: %i[wallet] }, on: :create

    validates :wallet, required: { unless: %i[card_number] }, on: :create
    validates :card_expiry, required: true, on: :update

  end
end
