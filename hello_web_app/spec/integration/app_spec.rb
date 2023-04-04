require "spec_helper"
require "rack/test"
require_relative '../../app'

describe Application do
  # This is so we can use rack-test helper methods.
  include Rack::Test::Methods

  # We need to declare the `app` value by instantiating the Application
  # class so our tests work.
  let(:app) { Application.new }

  # xit "should return 'Hello Leo'" do
  #   response = get("/hello?name=Leo")

  #   expect(response.status).to eq(200)
  #   expect(response.body).to eq("Hello Leo!")
  # end

  it "should return names" do
    response = get("/names?name=Julia, Mary, Karim")

    expect(response.status).to eq(200)
    expect(response.body).to eq("Julia, Mary, Karim")
  end

  it "should return a list of names in alphabetical order" do
    response = post("/sort_names?names=Joe,Alice,Zoe,Julia,Kieran")

    expect(response.status).to eq(200)
    expect(response.body).to eq("Alice,Joe,Julia,Kieran,Zoe")
  end
end

    #   context "POST to /submit" do
  #     it "returns 200 OK with the right content" do
  #       # Send a POST request to /submit
  #       # with some body parameters
  #       # and returns a response object we can test.
  #       response = post("/submit", name: "Dana", some_other_param: 12)

  #       # Assert the response status code and body.
  #       expect(response.status).to eq(200)
  #       expect(response.body).to eq("Hello Dana")
  #     end
  #   end