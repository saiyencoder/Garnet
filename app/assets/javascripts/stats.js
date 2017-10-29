/* global Vue */
document.addEventListener("DOMContentLoaded", function(event) { 
  var app = new Vue({
    el: '#app',
    data: {
      message: "Still Works",
      // teams: [],
      players: gon.players
    },
    mounted: function() {
      // $.get('/teams.json', function(data) {
      //   this.teams = data;
      // }.bind(this));

      // $.get('/players.json', function(data) {
      //   this.players = data;
      // }.bind(this));
    },
    methods: {


    },
    computed: {

    }
  });
});