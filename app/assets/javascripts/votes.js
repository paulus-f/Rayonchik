vote_suggestion = (id, vote) => {
  $.ajax({
    url: '/suggestions/' + id + '/vote',
    type: 'POST',
    data: {
      _method: 'POST',
      vote: vote
    },
    success: (data) => {
        if(data) {
          alert(data.message)
        }
      } 
    })
}