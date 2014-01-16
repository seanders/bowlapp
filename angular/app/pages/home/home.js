'use strict';

angular.module('bowlApp')
  .controller('MainCtrl', function ($scope, $location, $api, $document) {

    $api.get_people().then(function (response) {
      // set scale
      var width = $("#homepage-chart").width(),
          barHeight = 20;

      var x = d3.scale.linear()
        .domain([0, d3.max(response, function (d) {return d.confidence_points })])
        .range([0, width]);

      var chart = d3.select('#homepage-chart')
          .attr("width", width)
          .attr("height", barHeight * response.length);

      var bar = chart.selectAll('g')
          .data(response)
          .enter()
          .append('g')
          .attr('transform', function (d, i) {
            return 'translate(0,' + i * barHeight + ")";
          });

      bar.append('rect')
        .attr('width', function (d) { return x(d.confidence_points)})
        .attr('height', barHeight - 1);

      bar.append('text')
        .attr('x', function (d) { return x(d.confidence_points) - 3; })
        .attr('y', barHeight/2)
        .attr('dy', '.35em')
        .text(function (d) {
          if (d.last_name) {
            name = d.first_name + " " + d.last_name
          } else {
            name = d.first_name
          }
          return name + "  -  " + d.confidence_points
        });


    //   var chart = d3.select('#homepage-chart');
    //   var bar = chart.selectAll('div');
    //   var barUpdate = bar.data(response);
    //   var barEnter = barUpdate.enter().append("div");

    //   barEnter.style("width", function (d, i) {
    //     return x(d.confidence_points) + 'px';
    //   });

    //   barEnter.text(function (d, i) {
    //     var name
    //     if (d.last_name) {
    //       name = d.first_name + " " + d.last_name
    //     } else {
    //       name = d.first_name
    //     }
    //     return name + "  -  " + d.confidence_points
    //   });
    });
  });
