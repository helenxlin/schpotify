require 'net/http'


#uri=URI('http://159.203.178.244/stream')
#
#filename = "song.m4a"
#response = nil
#
#Net::HTTP.start(uri.host, uri.port) do |http|
#  request = Net::HTTP::Get.new uri.request_uri
#
#  http.request request do |response|
#    open filename, 'w' do |io|
#      response.read_body do |chunk|
#        io.write chunk
#      end
#    end
#  end
#end


player = Audite.new

player.events.on(
