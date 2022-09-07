# frozen_string_literal: true

require 'rubygems'
require 'sinatra'
require 'haml'

get '/' do
  libralies = [
    { url: 'https://github.com/tknzk/saml_idp_metadata', title: 'SAML IdP Metadata Parser' },
    { url: 'https://github.com/tknzk/jpostcode-api', title: 'JPOSTCODE API' },
    { url: 'https://github.com/tknzk/ehproxy', title: 'ehproxy' },
    { url: 'https://github.com/tknzk/gcf_chatwork', title: 'GCF ChatWork' },
    { url: 'https://github.com/tknzk/gcf_line_notify', title: 'GCF LINE Notify' },
    { url: 'https://github.com/tknzk/Services_Bitly', title: 'Services_Bitly' },
    { url: 'https://github.com/tknzk/Services_GoogleChartApiQR', title: 'Services_GoogleChartApiQR' }
  ]

  @libralies = libralies

  haml :index, format: :html5
end

get '/.well-known/did.json' do
  content_type :json
  did = <<~_EOS_
    {"id":"did:web:www.tknzk.com","@context":["https://www.w3.org/ns/did/v1",{"@base":"did:web:www.tknzk.com"}],"service":[{"id":"#linkeddomains","type":"LinkedDomains","serviceEndpoint":{"origins":["https://www.tknzk.com/"]}},{"id":"#hub","type":"IdentityHub","serviceEndpoint":{"instances":["https://hub.did.msidentity.com/v1.0/313eb7a4-2876-4aab-ba7f-e38e8708a124"]}}],"verificationMethod":[{"id":"#35359585bfca4c02bd77a557a7da64c3vcSigningKey-a3e41","controller":"did:web:www.tknzk.com","type":"EcdsaSecp256k1VerificationKey2019","publicKeyJwk":{"crv":"secp256k1","kty":"EC","x":"havNHZvAA_Vaf2TqaerZkStUXfNMUeR1OJa-9uEz_3Q","y":"XosMcydAq7oxf1M0XhUl8aOe3xTbNqhDKS1j-etAWWQ"}}],"authentication":["#35359585bfca4c02bd77a557a7da64c3vcSigningKey-a3e41"],"assertionMethod":["#35359585bfca4c02bd77a557a7da64c3vcSigningKey-a3e41"]}
  _EOS_
  did
end

get '/.well-known/did-configuration.json' do
  content_type :json
  configuration = <<~_EOS_
    {"@context":"https://identity.foundation/.well-known/contexts/did-configuration-v0.0.jsonld","linked_dids":["eyJhbGciOiJFUzI1NksiLCJraWQiOiJkaWQ6d2ViOnd3dy50a256ay5jb20jMzUzNTk1ODViZmNhNGMwMmJkNzdhNTU3YTdkYTY0YzN2Y1NpZ25pbmdLZXktYTNlNDEifQ.eyJzdWIiOiJkaWQ6d2ViOnd3dy50a256ay5jb20iLCJpc3MiOiJkaWQ6d2ViOnd3dy50a256ay5jb20iLCJuYmYiOjE2NjI1MzI3NjMsImV4cCI6MjQ1MTQ1MTE2MywidmMiOnsiQGNvbnRleHQiOlsiaHR0cHM6Ly93d3cudzMub3JnLzIwMTgvY3JlZGVudGlhbHMvdjEiLCJodHRwczovL2lkZW50aXR5LmZvdW5kYXRpb24vLndlbGwta25vd24vY29udGV4dHMvZGlkLWNvbmZpZ3VyYXRpb24tdjAuMC5qc29ubGQiXSwiaXNzdWVyIjoiZGlkOndlYjp3d3cudGtuemsuY29tIiwiaXNzdWFuY2VEYXRlIjoiMjAyMi0wOS0wN1QwNjozOToyMy42MTRaIiwiZXhwaXJhdGlvbkRhdGUiOiIyMDQ3LTA5LTA3VDA2OjM5OjIzLjYxNFoiLCJ0eXBlIjpbIlZlcmlmaWFibGVDcmVkZW50aWFsIiwiRG9tYWluTGlua2FnZUNyZWRlbnRpYWwiXSwiY3JlZGVudGlhbFN1YmplY3QiOnsiaWQiOiJkaWQ6d2ViOnd3dy50a256ay5jb20iLCJvcmlnaW4iOiJodHRwczovL3d3dy50a256ay5jb20vIn19fQ.W8gfRkifHDgWJD3nANQK7vnfEavT1tRq5AQsVD-Yo7cgM3eiJ7nVsUSq68Pe_-ACwEE350sk8xtm8D4jOFqQnw"]}
  _EOS_
  configuration
end
