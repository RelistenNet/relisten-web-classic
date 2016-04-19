
function removeThe(name) {
    return name.replace(/^The /, "").trim();
}

function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

var content = '';
process.stdin.resume();
process.stdin.on('data', function(buf) { content += buf.toString(); });
process.stdin.on('end', function() {
    var j = JSON.parse(content);

    var artists = {};

    j.data.map(function (v) {
    	return {
    		name: v.name,
    		slug: v.slug,
    		shows: v.recording_count
    	};
    }).sort(function (a, b) {
    	return removeThe(a.name).localeCompare(removeThe(b.name));
    }).forEach(function (v) {
    	artists[v.slug] = {name: v.name, shows: numberWithCommas(v.shows)};
    });

    console.log(JSON.stringify(artists));
});

