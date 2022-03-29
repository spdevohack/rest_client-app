class PostIndex
	require 'rest-client'
	require 'json'

	def initialize
			@url = "http://localhost:3000/v1/posts"
      # @url = 'https://xxxx.restdb.io/rest/data'
      @headers = {
        'content-type': "application/json"
      } 
	end

	def call
		# debugger
		res = RestClient.get(@url, @headers)
    body = JSON.parse(res)
	end

end