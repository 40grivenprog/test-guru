document.addEventListener('turbolinks:load', function() {
	var display = document.querySelector('#time')

	if(display) {
        left_time = document.querySelector('#left_time').value;
        test_id = 'test' + getTestPassageId();
		time = localStorage.getItem(test_id) || left_time;
		time_to_seconds = timeToSeconds(time);
        startTimer(time_to_seconds, display, test_id);
	}

    if(location.pathname.includes('result')){
        test_id = 'test' + getTestPassageId()
        localStorage.removeItem(test_id);
    }
})

function startTimer(duration, display, test_id) {
    var timer = duration;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        time_to_show = minutes + ":" + seconds;
        display.textContent = time_to_show;
        localStorage.setItem(test_id, time_to_show);

        if (--timer < 0) {
            localStorage.removeItem(test_id);
            result_url = document.querySelector('#result_url').value;
            location.assign(result_url);
            timer = duration;
            alert("Время вышло!");
        }
    }, 1000);
}

function timeToSeconds(time){
    time_array = time.split(':');
    if(time_array.length == 2){
        return (time_array[0] * 60) + parseInt(time_array[1])
    }else{
        return time_array[0] * 60;
    }
}

function getTestPassageId() {
    return location.pathname.split('/')[2]
}