# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'ApplicationController', type: :request do
  describe 'ApplicationController#authenticate' do
    context 'when not authenticated' do
      let(:invalid_token) do
        <<~TOKEN
          eyJhbGciOiJSUzI1NiIsImtpZCI6IjIxZTZjMGM2YjRlMzA5NTI0N2MwNjgwMDAwZTFiNDMxODIzODZkNTAiLC
          J0eXAiOiJKV1QifQ.eyJuYW1lIjoidGFuYWthIHRhcm8iLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xld
          XNlcmNvbnRlbnQuY29tL2R1bW15IiwiaXNzIjoiaHR0cHM6Ly9zZWN1cmV0b2tlbi5nb29nbGUuY29tL3BheXJ
          lY28tYTZmYTIiLCJhdWQiOiJwYXlyZWNvLWE2ZmEyIiwiYXV0aF90aW1lIjoxNjY0Mzc3NTcxLCJ1c2VyX2lkI
          joicXNmYXNzYWRzbllxWjNCWmVmIiwic3ViIjoicW5nZGdmZ2ZoZ3NZcVozQlplZlEiLCJpYXQiOjE2NjQ0MzU
          1MjUsImV4cCI6MTY2NDQzOTEyNSwiZW1haWwiOiJkdW1teUBnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6d
          HJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjYwNTM3NTEyODU1OTAyNzY1Mzg
          0OCJdLCJlbWFpbCI6WyJkdW1teUBnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJnb29nbGUuY29tI
          n19.ilgaoyHDqUPyUfWeUxfWfnC3ifaKlqnMabd1EUG4FN_xFwtQXqnO5awd2_BJaLCiUF4MpoSvtqeu80TVvU
          FTOU-9PaEZfwNWVq3msU7N2PJ85GgTkio_jg3ABk2xxKzZozJE0hGlyCTyVIGaJBGqpcaJESwtkXysF3TsvNK3
          pO6qGI0rbsWyAryP6RTy0j2HK4qb35Krlt8HsfHCLXspKMlmVqJYC-rlsh6tPBwwiGzWj6Hu3RJCBE6bbe5zou
          AvV-88am2D8ATJOf1n2_msaBcqhmV3ps1-_DFvRGvGYK6Mg5VfMgHxJz-eR-rdDxFHaiXTAoMf9ZalPkr5LAADTQ
        TOKEN
      end
      let(:headers) { { 'Authorization' => "Bearer #{invalid_token}" } }

      it 'cannot get information' do
        expect do
          get api_v1_user_path, headers:
        end.to raise_error(RuntimeError,
                           'Firebase ID token has invalid signature. Not enough or too many segments')
      end

      it 'cannot post information' do
        expect do
          post api_v1_companies_path, params: {}, headers:
        end.to raise_error(RuntimeError,
                           'Firebase ID token has invalid signature. Not enough or too many segments')
      end
    end
  end
end
