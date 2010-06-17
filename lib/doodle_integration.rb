require 'net/http'
require 'uri'
require 'timeout'

class DoodleIntegration
	def self.create_poll(xml_body)
		xml_body ||= <<EOT
<poll xmlns="http://doodle.com/xsd1">
<type>TEXT</type>
<hidden>false</hidden>
<levels>2</levels>
<title>PPP</title>
<description>yum!</description>
<initiator>
<name>AllenSwidkdkd</name>
</initiator>
</poll>
EOT

		url = 'doodle-test.com'
		path = "/api1WithoutAccessControl/polls" #/4zwcu3g56cugc6md"

		begin
			# raise error if connection not responding
			Timeout::timeout(2) do
				headers = {'Content-Type' => 'text/xml'}
				http = Net::HTTP.new(url)
				@response = http.post(path, xml_body, headers)
			end

		rescue Timeout::Error
			puts "Timeout::Error: #{$!}"
		rescue
			puts "Connection failed: #{$!}"
		end

		return @response
	end
end
