# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/og_previewers', type: :request do
  # OgPreviewer. As you add validations to OgPreviewer, be sure to
  # adjust the attributes here as well.
  let(:valid_job_id) { 'bd6ba944-7512-478d-90b2-3619b48bcbed' }
  let(:valid_attributes) do
    {
      input_url: 'http://stashrewards.com',
      og_image_url: 'https://www.stashrewards.com/images/stash_rewards_social.jpg',
      job_id: valid_job_id,
      status: 'completed'
    }
  end

  let(:invalid_attributes) do
    {
      email: 'dan.ellenbaum@gmail.com',
      user_id: 123,
      input_url: 'not_a_url'
    }
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      OgPreviewer.create! valid_attributes
      get og_previewers_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      og_previewer = OgPreviewer.create! valid_attributes
      get og_previewer_url(og_previewer)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_og_previewer_url
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new OgPreviewer' do
        post og_previewers_url, xhr: true, params: { og_previewer: valid_attributes }
        expect(response.body.include?("('#og_output').append('Processing...')")).to eq(true)
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new OgPreviewer' do
        expect do
          post og_previewers_url, xhr: true, params: { og_previewer: invalid_attributes }
        end.to change(OgPreviewer, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post og_previewers_url, xhr: true, params: { og_previewer: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested og_previewer' do
      og_previewer = OgPreviewer.create! valid_attributes
      expect do
        delete og_previewer_url(og_previewer)
      end.to change(OgPreviewer, :count).by(-1)
    end

    it 'redirects to the og_previewers list' do
      og_previewer = OgPreviewer.create! valid_attributes
      delete og_previewer_url(og_previewer)
      expect(response).to redirect_to(og_previewers_url)
    end
  end
end