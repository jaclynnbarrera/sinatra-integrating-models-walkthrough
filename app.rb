require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  #renders the index.erb page
  get '/' do
    erb :index
  end

  #receives the form data through params and renders to results page
  post '/' do

    @analyzed_text = TextAnalyzer.new(params[:user_text])
    @number_of_words = @analyzed_text.count_of_words
    @vowels = @analyzed_text.count_of_vowels
    @consonants = @analyzed_text.count_of_consonants
    @analyzed_text.most_used_letter.each do |k,v|
      @most_common_letter = k.capitalize
      @common_letter_count = v
    end     
    erb :results
  end
end