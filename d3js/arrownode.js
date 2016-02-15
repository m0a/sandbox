createsvg();


function createsvg() {


  var svg = d3.select("#example").append("svg")
  .attr({
    "width":640,
    "height":480,
  });


  // var c1 = [100, 90,  30];
  // var c2 = [200, 120, 20];

   var cArray = [
     [100, 90, 30],
     [200, 120, 20],
     [230, 20, 10],

     ];
  var color = d3.scale.category10();

  var line = d3.svg.line()
    .interpolate("basis")
    .x(function(d){
      return d[0];
    })
    .y(function(d){
      return d[1];
    });

  var path = svg.append("path")
    .attr({
      "d":line(cArray),
      "stroke":"lightgreen",
      "stroke-width": 5,
      "fill": "none",
    })

    // var g = svg.selectAll("g")
    //     .data(cArray)
    //     .enter()
    //     .append("g")
    //     .attr({
    //       transform: function(d){
    //         return "translate(" + d[0] + "," + d[1] + ")";
    //       },
    //     });
    //
    //   g.append("circle")
    //   .attr({
    //     "r" : function(d){
    //       return d[2];
    //     },
    //     "fill": function(d,i){
    //       return color(i);
    //     },
    //   });
    //
    //   g.append("text")
    //   .attr({
    //     "text-anchor":"middle",
    //     "dy":".35em",
    //     "fill":"white"
    //   })
    //   .text(function(d,i){
    //     return i + 1;
    //   });
    //




}
