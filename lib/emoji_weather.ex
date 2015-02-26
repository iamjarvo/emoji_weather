defmodule EmojiWeather.CLI do
  def main(args) do
    IO.puts "Using EmojiWeather"
    IO.inspect args
    args |> process_args |> process
  end

  def process_args(args) do
    {_, [lat, lon], _} = OptionParser.parse(args)
    [lat, lon]
  end

  def process([lat, lon]) do
    ForecastIO.start()
    {:ok, result } = ForecastIO.forecast(lat, lon)
    current = ForecastIO.current(result)
    IO.inspect current
    IO.inspect current["icon"]
  end

  def process do
    IO.puts "0 args"
  end
end
