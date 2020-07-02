document.addEventListener('turbolinks:load', function() {
	control = document.querySelector('.myBar')
	if (control){ makeProgress(control) }
})

function makeProgress(control){
	var currentQuestionNum = Number(control.dataset.questionNumber)
	var allQuestionNum = Number(control.dataset.questionsNumber)
	var progress = calculateProgress(currentQuestionNum, allQuestionNum)
	control.style.width = progress + '%'
}

function calculateProgress(currentNum, allNum){
	return Math.floor(((currentNum - 1)/allNum)*100)
}