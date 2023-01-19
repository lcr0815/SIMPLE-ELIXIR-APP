NimbleCSV.define(NimbleCSV.Spreadsheet, [])
NimbleCSV.define(MyParser, escape: "\"")

alias NimbleCSV.RFC4180, as: CSV

def import_shipments(conn, %{"params" => %{"import_file" => params}}) do
  params.path
  |> File.stream!(read_ahead: 100_000)
  |> MyParser.parse_stream(skip_headers: true)
  |> Stream.map(fn n ->
    case n do
      [name, barcode] ->
        IO.inspect(name)
        IO.inspect(barcode)

      _ ->
        IO.inspect("empty")
    end
  end)
  |> Stream.run()

  render(conn, "index.html")
end
