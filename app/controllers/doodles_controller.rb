class DoodlesController < ApplicationController

  hobo_model_controller

  auto_actions :all

	# code below will be integrated into Doodle#create later
	def doodle_create
		# contruct the XML data required by Doodle API
		xml_data = <<EOT
<poll xmlns="http://doodle.com/xsd1"><type>TEXT</type><hidden>false</hidden><levels>2</levels><title>PPP</title><description>yum!</description><initiator><name>AllenSwidkdkd</name></initiator></poll>
EOT

		 @poll = DoodleIntegration.create_poll(xml_body)
		 render :text => @poll

	end

end
