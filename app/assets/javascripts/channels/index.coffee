#= require cable
#= require_self
#= require_tree .

@App = {}
#App.cable = Cable.createConsumer 'ws://localhost:28080'
App.cable = Cable.createConsumer 'ws://contactenboek.bas-de-ruiter.nl:28080'
