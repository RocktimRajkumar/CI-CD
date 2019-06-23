<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src='https://api.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.js'></script>
    <link href='https://api.mapbox.com/mapbox-gl-js/v0.53.0/mapbox-gl.css' rel='stylesheet' />

    <title>MapBox-JS Design Challenge</title>
    <style>
        body {
            margin: 0;
            padding: 0;
        }

        #map {
            position: absolute;
            top: 0;
            bottom: 0;
            width: 100%;
        }
        #reset{
            position:absolute;
            left:50%;
            bottom:12px;
        }
        #heading{
            position: absolute;
            top:4px;
            margin:0px;
            left:42%;
            z-index:1; 
            color:#c1c1c4;
        }
    </style>
</head>

<body>
    <h2 id="heading"> Jorhat 785001, Assam, India</h2>
    <div id="map">

    </div>
    <button id="reset">Reset</button>
</body>
<script>


    mapboxgl.accessToken = 'pk.eyJ1Ijoicm9ja3RpbSIsImEiOiJjanRxMmh6bjIwNDd2NDRwYWJtN3h6NDY4In0.bfNNM-zi0FzzH6B29_W1Mw';
    var startTime = 0;
    var progress = 0;
    var map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/rocktim/cjtq6bppo1vlh1fpi64hb4yj3',
        center: [94.216670, 26.750000],
        zoom: 10.0
    });

    var OriginalCoordinates = [
        [94.200812, 26.831392],
        [94.131366, 26.818768],
        [94.081853, 26.757923],
        [94.114004, 26.64763],
        [94.245181, 26.608542],
        [94.352565, 26.663721],
        [94.372499, 26.733805],
        [94.351922, 26.806142],
        [94.279261, 26.83713],
        [94.200812, 26.831392]
    ];

    var coordinates = OriginalCoordinates;

    function boundaryBox() {

        return {

            "type": "Feature",
            "properties": {
                "jorhat": "boundary"
            },
            "geometry": {
                "coordinates": coordinates,
                "type": "LineString"
            }
        };
    }

    var resetbtn=document.getElementById("reset");

    map.on('load', function () {

        map.addSource('point', {
            "type": "geojson",
            "data": boundaryBox()
        });

        map.addLayer({
            "id": "jorhat",
            "type": "line",
            "source": "point",
            'layout': {},
            'paint': {
                'line-color': '#F78A6E',
                'line-width': 4
            }
        });

        //Reset button when press shows all coordinates
        resetbtn.addEventListener("click",function(){
            coordinates = OriginalCoordinates;
        });

        function animateLine(timestamp) {

            progress = timestamp - startTime;

            if (progress > 1000) {
                startTime = timestamp;
                map.getSource('point').setData(boundaryBox());
                //Removing first pair of coordinates
                coordinates = coordinates.slice(1, 10)
            }
            if (coordinates.length == 0)
                coordinates = OriginalCoordinates;

            requestAnimationFrame(animateLine);
        }

        //     // Start the animation.
        animateLine();
    });

</script>

</html>