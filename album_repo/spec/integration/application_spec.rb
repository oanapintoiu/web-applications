require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # context 'GET/albums' do
  #   it "should return the list of albums" do
  #     response = get('/albums')

  #     expected_response = "Surfer Rosa, Waterloo, Super Trouper, Bossanova, Lover, Folklore, I Put a Spell on You, Baltimore, Here Comes the Sun, Fodder on My Wings, Ring Ring"

  #     expect(response.status).to eq(200)
  #     expect(response.body).to eq(expected_response)
  #   end
  # end

  context 'POST/albums' do
    it "should return 200 OK" do
      response = post('/albums', title: "OK Computer", release_year: "1997", artist_id: "5")

      repo = AlbumRepository.new
      expect(repo.all.last.title).to eq "OK Computer"
      expect(response.status).to eq(200)
    end
  end

  context 'GET/artists' do
    it 'returns 200 OK plus list of artists' do
      response = get('/artists')

      expect(response.status).to eq(200)
      expect(response.body).to eq('Pixies, ABBA, Taylor Swift, Nina Simone, Kiasmos')
    end
  end

  context 'POST/artists' do
    it 'returns 200 OK plus create an artist' do
      response = post('/artists', name: 'Wild Nothing', genre: 'Indie')
      repo = ArtistRepository.new

      expect(response.status).to eq(200)
      expect(repo.all.last.name).to eq 'Wild Nothing'
    end
  end

  context "GET /albums" do
    it "returns a webpage showing all albums" do
      response = get('/albums')

      expect(response.body).to include ('Title: Surfer Rosa')
      expect(response.body).to include ('Title: Waterloo')
    end
  end

  context "GET /albums/:id" do
    it 'returns a webpage displaying the album' do
      response = get('/albums/2')

      expect(response.body).to include('<h1>Surfer Rosa</h1>')
      expect(response.body).to include('Release year: 1988')
      expect(response.body).to include('Artist: Pixies')
    end
  end

end
