// /* global Vue */
// document.addEventListener("DOMContentLoaded", function(event) { 
//   var app = new Vue({
//     el: '#app',
//     data: {
//       message: "Still Works",
//       stats: [
//               {id: this.id, fieldGoalMade: 0}
//               ]
//     },

//     mounted: function() {
//       $.get('/stats.json', function(data) {
//         this.stats = data;
//       }.bind(this));
//     },
//     methods: {

//       createStats: function() {
//         var params = {
//           fieldGoalMade: this.fieldGoalMade
//         };
//         $.post('/stats.json', params, function(newStats) {
//           this.stats.push(newStats);
//         }.bind(this));
//       },



      
//     },
//     computed: {

//     }
//   });
// });