# coding: utf-8
require 'pp'
require 'json'
require 'openssl'
require 'uri'
require 'net/http'
require 'time'

module Etwings
    class ConnectionFailedException < StandardError; end
    class APIErrorException < StandardError; end
    
    class API
        def initialize(opt = {})
            @cool_down = opt[:cool_down] || true
            @cool_down_time = opt[:cool_down_time] || 2
            @cert_path = opt[:cert_path] || nil
            @etwings_public_url = "https://exchange.etwings.com/api/1/"
            @etwings_trade_url = ""
        end

        #
        # Public API
        #

        # Get last price of *currency_code* / *counter_currency_code*.
        def get_last_price(currency_code, counter_currency_code = "jpy")
            json = get_ssl(@etwings_public_url + "last_price/" + currency_code + "_" + counter_currency_code)
            return json["last_price"]
        end

        # Get ticker of *currency_code* / *counter_currency_code*.
        def get_ticker(currency_code, counter_currency_code = "jpy")
            json = get_ssl(@etwings_public_url + "ticker/" + currency_code + "_" + counter_currency_code)
            return json
        end

        # Get trades of *currency_code* / *counter_currency_code*.
        def get_trades(currency_code, counter_currency_code = "jpy")
            json = get_ssl(@etwings_public_url + "trades/" + currency_code + "_" + counter_currency_code)
            return json
        end

        # Get depth of *currency_code* / *counter_currency_code*.
        def get_depth(currency_code, counter_currency_code = "jpy")
            json = get_ssl(@etwings_public_url + "depth/" + currency_code + "_" + counter_currency_code)
            return json
        end

        #
        # Class private method
        #

        private

        # Connect to address via https, and return json reponse.
        def get_ssl(address)
            uri = URI.parse(address)
            begin
                https = Net::HTTP.new(uri.host, uri.port)
                https.use_ssl = true
                https.open_timeout = 5
                https.read_timeout = 15
                https.verify_mode = OpenSSL::SSL::VERIFY_PEER
                https.verify_depth = 5

                https.start {|w|
                    response = w.get(uri.request_uri)
                    case response
                    when Net::HTTPSuccess
                        json = JSON.parse(response.body)
                        if json.has_key?("error")
                            raise APIErrorException, json["error"]
                        end
                        get_cool_down
                        return json
                    else
                        raise ConnectionFailedException, "Failed to connect to etwings."
                    end
                }
            rescue
                raise
            end
        end

        def get_cool_down
            if @cool_down
                sleep(@cool_down_time)
            end
        end
        
    end
end
