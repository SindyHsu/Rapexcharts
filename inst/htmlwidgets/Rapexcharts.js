HTMLWidgets.widget({

  name: 'Rapexcharts',

  type: 'output',

  renderValue: function(el, option_value,  width, height) {
    var chart = new ApexCharts(el, option_value);
    chart.render();
  },

  resize: function(el, width, height) {
  }
});
