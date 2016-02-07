# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  L.mapbox.accessToken = 'pk.eyJ1IjoidGVzdGluZ3VzZXIiLCJhIjoiY2llbHE4dWJvMDAzdDhva3V4ODZzdXNybSJ9.JWQZxXSNxQDEM2-nfn4ZgQ'
  map = L.mapbox.map('map', 'testinguser.cielq8u0d00dhsmm4ezxnfgrf').setView([19.432608, -99.133209], 5);

  $.ajax
    dataType: 'json'
    url: '/alerts.json'
    success: (data) ->
      for feature in data.features
        do (feature) ->
          
          if feature.properties.type == 1
             feature.properties.type = "Yo"
             feature.properties["marker-color"] = "#B0171F"
          else
            feature.properties.type = "Alguien más"
            feature.properties["marker-color"] = "#0000FF"
      map.featureLayer.setGeoJSON(data)

  map.featureLayer.on 'layeradd', (e) ->
    marker = e.layer
    properties = marker.feature.properties

    popup = '<div class="popup">' +
              '<h3>Cliente: <b>' + properties.name + '</b></h3>' +
              '<p>Tipo de alerta: <b>' + properties.type + '</b></p>' +
              '<p>Tipo de acoso: <b>' + properties.harrasment_type + '</b></p>' +
              '<p>Hora de alerta: <b>' + properties.created + '</b></p>' +
            '</div>'
    marker.bindPopup popup,
      closeButton: true
      minWidth: 320


$(document).ready(ready)
$(document).on('page:load', ready)