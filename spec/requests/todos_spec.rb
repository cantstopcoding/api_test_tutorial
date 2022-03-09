require 'rails_helper'

describe 'Todos API', type: :request do
  it 'returns all todos' do
    get 'http://localhost:3000/api/v1/todos'
    FactoryBot.create(:todo, title: 'Walk dogs')
    FactoryBot.create(:todo, title: 'Do laundry')
    FactoryBot.create(:todo, title: 'Mop floor')

    expect(response).to have_http_status(:success)
    expect(JSON.parse(response.body).size).to eq(3)
  end
end
