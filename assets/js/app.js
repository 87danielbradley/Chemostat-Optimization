var data = [
    {
        "categorie": "Day_1", 
        "values": [
            {
                "value": 0.000001, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.284299, 
                "nutrient": "gln"
            }
        ]
    }, 
	{
        "categorie": "Day_2", 
        "values": [
            {
                "value": 0, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.378238, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_3", 
        "values": [
            {
                "value": 0.000003, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.24437, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_4", 
        "values": [
            {
                "value": 0.025565, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.066288, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_5", 
        "values": [
            {
                "value": 0.035927, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.000001, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_6", 
        "values": [
            {
                "value": 0.03453, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.000004, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_7", 
        "values": [
            {
                "value": 0.035488, 
                "nutrient": "glc"
            }, 
            {
                "value": 0, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_8", 
        "values": [
            {
                "value": 0.034732, 
                "nutrient": "glc"
            }, 
            {
                "value": 0, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_9", 
        "values": [
            {
                "value": 0.039495, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.000011, 
                "nutrient": "gln"
            }
        ]
    },
	{
        "categorie": "Day_10", 
        "values": [
            {
                "value": 0.031985, 
                "nutrient": "glc"
            }, 
            {
                "value": 0.000062, 
                "nutrient": "gln"
            }
        ]
    }
];
var margin = {top: 20, right: 20, bottom: 30, left: 70},
    width = 960 - margin.left - margin.right,
    height = 500 - margin.top - margin.bottom;

var x0 = d3.scaleBand()
    .rangeRound([0, width])
	.padding([0.1]);

var x1 = d3.scaleBand();

var y = d3.scaleLinear()
    .range([height, 0]);

var xAxis = d3.axisBottom(x0)
    .tickSize(0);

var yAxis = d3.axisLeft(y);
var color = d3.scaleOrdinal()
    .range(["#ca0020","#92c5de"]);

var svg = d3.select('body').append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

data.forEach(function(d) {

  var categoriesNames = data.map(function(d) { return d.categorie; });
  var rateNames = data[0].values.map(function(d) { return d.nutrient; });

  x0.domain(categoriesNames);
  x1.domain(rateNames).range([0, x0.bandwidth()]);
  y.domain([0, d3.max(data, function(categorie) { return d3.max(categorie.values, function(d) { return d.value; }); })]);

  svg.append("g")
      .attr("class", "x axis")
      .attr("transform", "translate(0," + height + ")")
      .call(xAxis);

  svg.append("g")
      .attr("class", "y axis")
      .style('opacity','0')
      .call(yAxis)
  .append("text")
      .attr("transform", "rotate(-90)")
      .attr("y", 6)
      .attr("dy", ".71em")
      .style("text-anchor", "end")
      .style('font-weight','bold')
      .text("Value");

  svg.select('.y').transition().duration(500).delay(1300).style('opacity','1');

  var slice = svg.selectAll(".slice")
      .data(data)
      .enter().append("g")
      .attr("class", "g")
      .attr("transform",d=>{ return "translate(" + x0(d.categorie) + ",0)"; });

  slice.selectAll("rect")
      .data(d=>d.values)
  .enter().append("rect")
      .attr("width", 10)
      .attr("x", d=> { return x1(d.nutrient); })
	  .attr('dy', '0.32em')
      .style("fill", d=>{ return color(d.nutrient) })
      .attr("y", d=>{ return y(0); })
      .attr("height", d=> { return height - y(0); })
      .on("mouseover", d=> {
          d3.select(this).style("fill", d3.rgb(color(d.nutrient)).darker(2));
      })
      .on("mouseout", d=> {
          d3.select(this).style("fill", color(d.nutrient));
      });

  slice.selectAll("rect")
      .transition()
      .delay(d=> {return Math.random()*1000;})
      .duration(1000)
      .attr("y", d=>{ return y(d.value); })
      .attr("height", d=> { return height - y(d.value); });

  //Legend
  var legend = svg.selectAll(".legend")
      .data(data[0].values.map(d=> { return d.nutrient; }).reverse())
  .enter().append("g")
      .attr("class", "legend")
      .attr("transform", function(d,i) { return "translate(0," + i * 20 + ")"; })
      .style("opacity","0");

  legend.append("rect")
      .attr("x", width - 18)
      .attr("width", 18)
      .attr("height", 18)
      .style("fill", d=>{ return color(d); });

  legend.append("text")
      .attr("x", width - 24)
      .attr("y", 9)
      .attr("dy", ".35em")
      .style("text-anchor", "end")
      .text(d=>d);

  legend.transition().duration(500).delay(function(d,i){ return 1300 + 100 * i; }).style("opacity","1");

});

//







