class MercadopagoController < ApplicationController
  def checkout
    require 'mercadopago'
    sdk = Mercadopago::SDK.new('ACCESS_TOKEN')
    preference_data = {
      items: [
        {
          title: 'Mi producto',
          unit_price: 75.56,
          quantity: 1,
          id: params[:fixed_cost_id],
        }
      ],
      back_urls: {
        success: 'http://localhost:4200/ong',
        pending: 'http://localhost:4200/ong',
        failure: 'http://localhost:4200/ong',
      }
    }
    preference_response = sdk.preference.create(preference_data)
    preference = preference_response[:response]
    
    @preference_id = preference['id']
    render json: {preference_id: @preference_id}
  end
end
