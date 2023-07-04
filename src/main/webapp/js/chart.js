google.charts.load('current', { 'packages': ['line'] });
google.charts.setOnLoadCallback(drawChart);
var data, chart, options;

function drawChart() {
    var data = google.visualization.arrayToDataTable([
        ['Date', 'Hype Boy', 'Unholy', 'That Band', 'Butter'],
        ['02-15', 1, 4, 5, 12],
        ['02-16', 6, 1, 8, 4],
        ['02-17', 10, 3, 2, 5],
        ['02-18', 16, 5, 11, 2],
        ['02-19', 13, 12, 4, 2],
        ['02-20', 10, 13, 12, 14],
        ['02-21', 14, 15, 13, 8]
    ]);

    var options = {
        title: '나만의 차트 | ',
        curveType: 'function',
        legend: { position: 'bottom' },
        series: {
            0: { color: '#D9AD29' },
            1: { color: '#A67926' },
            2: { color: '#734B1A' },
            3: { color: '#FACF1E' }
        }
    };

    var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

    chart.draw(data, options);

    // Add our selection handler.

    google.visualization.events.addListener(chart, 'select', selectHandler);

    // The selection handler.
    // Loop through all items in the selection and concatenate
    // a single message from all of them.
    function selectHandler() {
        var selection = chart.getSelection();
        var row = selection[0].row;
        var col = selection[0].column;
        var date = data.getFormattedValue(row, 0);
        var mName = data.getFormattedValue(0, col);
        var mCount = data.getFormattedValue(row, col);
        alert(date + " " + mName + " " + mCount);
    };
};