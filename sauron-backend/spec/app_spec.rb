require File.expand_path '../spec_helper.rb', __FILE__

class HashToObject
  def initialize(hash)
    hash.each do |k,v|
      self.instance_variable_set("@#{k}", v.is_a?(Hash) ? HashToObject.new(v) : v)
      self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
      self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})
    end
  end
end

describe "Sauron Application" do
  let!(:mock) { [HashToObject.new({ user: { name: 'Rafael Tauil', url: '', profile_image_url: '' },
                              text: { text: '', full_text: '', url: '' } })] }

  it "returns ok" do
    allow_any_instance_of(Twitter::REST::Client).to receive(:search).with('Rafael Tauil', result_type: "recent").and_return(mock)
    get '/search', { search_term: 'Rafael Tauil' }
    expect(last_response).to be_ok
  end

  it "invokes Twitter::REST::Client#search" do
    expect_any_instance_of(Twitter::REST::Client).to receive(:search).with('Rafael Tauil', result_type: "recent").and_return(mock)
    get '/search', { search_term: 'Rafael Tauil' }
  end

  it "returns an array of json" do
    allow_any_instance_of(Twitter::REST::Client).to receive(:search).with('Rafael Tauil', result_type: "recent").and_return(mock)
    get '/search', { search_term: 'Rafael Tauil' }
    expect(JSON.parse(last_response.body).size).to eq(1)
    expect(JSON.parse(last_response.body)[0]['user']['name']).to eq('Rafael Tauil')
  end
end
