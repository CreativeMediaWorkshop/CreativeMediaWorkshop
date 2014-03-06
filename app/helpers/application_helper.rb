module ApplicationHelper
	def pio_client
		client = PredictionIO::Client.new('21Fj6kzjy5X06CALAXH69GJtfU7hFzSqgbcORWHGV01UBbW5HYGIqWvF3OxnT9PS')
		# For how to use PIO, check http://docs.prediction.io/current/tutorials/quickstart-ruby.html
	end
end
