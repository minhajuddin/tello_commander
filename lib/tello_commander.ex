defmodule TC do
  require Logger
  @tello_port 8889

  # connects to tello and starts the video stream
  def start(ip) do
    # connect to tello

    # open a local udp socket
    {:ok, sock} = :gen_udp.open(0, [:binary, {:active, true}])

    # send "command" to get tello into sdk mode
    send_command(sock, ip, "command")

    # print some diagnostics
    send_command(sock, ip, "battery?")
  end

  def send_command(sock, ip, data) do
    :ok = :gen_udp.send(sock, ip, @tello_port, data)
    receive do
      msg ->
        Logger.info message: msg, log_code: "received"
    after 1000 ->
        Logger.error "TIMEOUT"
    end
  end
end
