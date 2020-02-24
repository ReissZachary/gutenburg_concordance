defmodule GutenburgConcordance do

  def init do
  end

  def get_all_books() do
    HTTPoison.start
    #url = "http://www.gutenberg.org/cache/epub/#{start_number}/pg#{start_number}.txt"
    response = HTTPoison.get("http://www.gutenberg.org/cache/epub/41807/pg41807.txt")
    

  end
end
