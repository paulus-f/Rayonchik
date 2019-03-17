reject_suggestion = (id) => {
  var reason = prompt('Напишите причину', "Есть причина");
  $.ajax({
    url: '/suggestions/' + id + '/reject',
    type: 'POST',
    data: { 
      _method: 'POST', 
      reason: reason
    },
    success: (data) => {
        if(data) {
          alert(data.message)
        }
      } 
    })
}

approve_suggestion = (id) => {
  $.ajax({
    url: '/suggestions/' + id + '/approve',
    type: 'POST',
    data: { 
      _method: 'POST', 
    },
    success: (data) => {
        if(data) {
          alert(data.message)
        }
      } 
    })
}