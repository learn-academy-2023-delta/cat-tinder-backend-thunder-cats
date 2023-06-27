require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of all thunder cats" do
      Cat.create(
        name: 'Panthro',
        age: 24,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
      )

      get '/cats'
      cat = JSON.parse(response.body)

      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a thunder cat" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      
      expect(response).to have_http_status(200)

      cat = Cat.first
      expect(cat.name).to eq "Panthro"
      expect(cat.age).to eq 24
      expect(cat.enjoys).to eq 'Loves to lift weights and does not rerack the weights.'
    end
  end

  describe "PATCH /update" do
    it "updates a thunder cat" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      cat = Cat.first

      updated_thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 34,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      patch "/cats/#{cat.id}", params: updated_thunder_cat_params

      updated_thunder_cat = Cat.find(cat.id)

      expect(response).to have_http_status(200)
      expect(updated_thunder_cat.age).to eq 34
    end
  end

  describe "DELETE /destroy" do
    it "deletes a thunder cat" do
      cat = Cat.create(
        name: 'Panthro',
        age: 24,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
      )

      delete "/cats/#{cat.id}"
      new_cat = Cat.all
      expect(new_cat).to be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe "cannot create a cat without valid attributes" do
    it "doesn't create a cat without a name" do
      thunder_cat_params = {
        cat: {
        name: '',
        age: 24,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }
      # send the request to the server and pass params ehich are thunder_cat_params
      post '/cats', params: thunder_cat_params
      # expect an error if the thunder_cat_params does not have a name
      # expect(response.status).to eq 422
      # another way to write this test:
      expect(response).to have_http_status(422)


      cat = JSON.parse(response.body)
      expect(cat['name']).to include "can't be blank"
    end
  end

    it "cannot create a cat without an age" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: '',
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      cat = JSON.parse(response.body)
      expect(response.status).to eq 422
      expect(cat['age']).to include "can't be blank"
    end

    it "cannot create a cat without what it enjoys" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: '',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      cat = JSON.parse(response.body)
      expect(response.status).to eq 422
      expect(cat['enjoys']).to include "can't be blank"
    end

    it "cannot create a cat without an image" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: 'eating',
        image: ''
        }
      }

      post '/cats', params: thunder_cat_params
      cat = JSON.parse(response.body)
      expect(response.status).to eq 422
      expect(cat['image']).to include "can't be blank"
    end

  describe "cannot update a cat without valid attributes" do
    it "cannot update a cat without a name" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      cat = Cat.first

      updated_thunder_cat_params = {
          cat: {
          name: '',
          age: 24,
          enjoys: 'Loves to lift weights and does not rerack the weights.',
          image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      patch "/cats/#{cat.id}", params: updated_thunder_cat_params
      cat = JSON.parse(response.body)
      expect(response).to have_http_status 422
      expect(cat['name']).to include "can't be blank"
    end

    it "cannot update a cat without an age" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: 'Loves to lift weights and does not rerack the weights.',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      cat = Cat.first

      updated_thunder_cat_params = {
          cat: {
          name: 'Panthro',
          age: '',
          enjoys: 'Loves to lift weights and does not rerack the weights.',
          image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      patch "/cats/#{cat.id}", params: updated_thunder_cat_params
      cat = JSON.parse(response.body)
      expect(response).to have_http_status 422
      expect(cat['age']).to include "can't be blank"
    end

    it "cannot update a cat without what it enjoys" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: 'eats pizza',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      cat = Cat.first

      updated_thunder_cat_params = {
          cat: {
          name: 'Panthro',
          age: 24,
          enjoys: 'eats alot',
          image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      patch "/cats/#{cat.id}", params: updated_thunder_cat_params
      cat = JSON.parse(response.body)
      expect(response).to have_http_status 422
      expect(cat['enjoys']).to include "is too short (minimum is 10 characters)"
    end

    it "cannot update a cat without an image" do
      thunder_cat_params = {
        cat: {
        name: 'Panthro',
        age: 24,
        enjoys: 'eats pizza',
        image: 'https://static.wikia.nocookie.net/thundercats/images/d/d7/2vlcsnap-2014-03-12-21h53m03s204.jpg/revision/latest?cb=20140322205906'
        }
      }

      post '/cats', params: thunder_cat_params
      cat = Cat.first

      updated_thunder_cat_params = {
          cat: {
          name: 'Panthro',
          age: 24,
          enjoys: 'eats alot',
          image: ''
        }
      }

      patch "/cats/#{cat.id}", params: updated_thunder_cat_params
      cat = JSON.parse(response.body)
      expect(response).to have_http_status 422
      expect(cat['image']).to include "can't be blank"
    end
  end
end
