defmodule GutenburgConcordance do


  def test_get_concordances do
    get_all_books(41807, 41808)
  end

  #http://www.gutenberg.org/cache/epub/41807/pg41807.txt
  #http://www.gutenberg.org/cache/epub/41808/pg41808.txt


  def get_all_books(start_range, end_range) do
    HTTPoison.start
    for num <- start_range..end_range do
      spawn(fn ->
        case HTTPoison.get("http://www.gutenberg.org/cache/epub/#{num}/pg#{num}.txt") do
          {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
            IO.puts body
            #send(_parser, body)

          {:ok, %HTTPoison.Response{status_code: 404}} ->
            IO.puts "Page not found!"

          {:error, %HTTPoison.Error{reason: reason}} ->
            IO.puts reason
        end
      end)
    end
  end
end
