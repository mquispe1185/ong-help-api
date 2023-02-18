class MercadopagoController < ApplicationController
  def checkout
    require 'mercadopago'
    sdk = Mercadopago::SDK.new(Rails.application.credentials.dig(:mp_acctoken_prod))
    fixed_cost = FixedCost.find(params[:fixed_cost_id])
    preference_data = {
      items: [
        {
          title: fixed_cost.title,
          unit_price: params[:amount].to_f,
          quantity: 1,
          id: fixed_cost.id,
          description: fixed_cost.description,
        },
      ],
      payer: {
        name: current_user.first_name,
        surname: current_user.last_name,
        email: current_user.email,
      },
      back_urls: {
        success: 'http://localhost:4200/' + (fixed_cost.chargeable_type).downcase,
        pending: 'http://localhost:4200/' + (fixed_cost.chargeable_type).downcase,
        failure: 'http://localhost:4200/' + (fixed_cost.chargeable_type).downcase,
      }
    }
    preference_response = sdk.preference.create(preference_data)
    preference = preference_response[:response]

    @preference_id = preference['id']
    render json: {preference_id: @preference_id}
  end
end
